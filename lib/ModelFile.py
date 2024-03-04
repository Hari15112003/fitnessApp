
import pandas as pd
import numpy as np
from sklearn.model_selection import StratifiedShuffleSplit
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.metrics import mean_squared_error
import pickle
from firebase_admin import db
import urllib
import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel


app = FastAPI()


class Item(BaseModel):
    height: str
    age: str
    weight: str
    gender: str
    activity: str


response = ''
breakfast = ''
lunch = ''
dinner = ''


@app.post("/tp")
async def nameRoute(item: Item):

    global response
    global breakfast
    global lunch
    global dinner

    height = int(item.height)
    age = int(item.age)
    weight = int(item.weight)
    gender = int(item.gender)
    activity = int(item.activity)

    config = {
        "apiKey": "AIzaSyD4n2356evIuRlqkMuq5do3wTUzEL3kFeM",
        "authDomain": "you domain",
        "databaseURL": "https://insta-clone-c4d7e-default-rtdb.firebaseio.com",
        "projectId": "insta-clone-c4d7e",
        "storageBucket": "insta-clone-c4d7e.appspot.com",
        "messagingSenderId": "1094506106434",
        "appId":  "1:1094506106434:web:3dd15d07dd0a2389e527db",

    }

    firebase = pyrebase.initialize_app(config)
    storage = firebase.storage()

    Food = storage.child('csv_files/foodfin.csv').get_url(None)
    Final = storage.child('csv_files/Final_Data.csv').get_url(None)
    mlpmodel = storage.child('F_MLP_model.pkl').get_url(None)

    ML = urllib.request.urlopen(mlpmodel)
    myfile = ML.read()

    Food_data = pd.read_csv(Food)
    Final_data = pd.read_csv(Final)

    MLP_loaded_mpdel = pd.read_pickle(mlpmodel)

    my_pipeline = Pipeline([
        ('std_scaler', StandardScaler()),
    ])
    my_pipeline.fit_transform(Final_data)

    def calculate_bmi(height, weight):
        return weight / (height / 100)**2

    def calculate_bmr(age, height, weight, gender, activity):
        if gender == 1:
            bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
        else:
            bmr = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age)

        return bmr

    def activity_val():
        activity = int()
        if activity == 1:
            activity_index = 1.2
        elif activity == 2:
            activity_index = 1.3
        elif activity == 3:
            activity_index = 1.5
        elif activity == 4:
            activity_index = 1.7
        else:
            activity_index = 1.9
        return activity_index

    height_m = int(height)/100
    activ = activity_val()
    bmi = calculate_bmi(height, weight)
    bmr = calculate_bmr(age, height, weight, gender, activ)

    scaler = StandardScaler()
    inputs_list = []
    inputs_list.append([age, weight, height_m, gender, bmi, bmr, activ])

    Data = my_pipeline.transform(inputs_list)

    STD_Data = MLP_loaded_mpdel.predict(Data)
    caloric_needs = STD_Data[0]

    calories_breakfast = int(caloric_needs * 0.25)
    calories_lunch = int(caloric_needs * 0.40)
    calories_dinner = int(caloric_needs * 0.35)

    breakfast_items = Food_data[Food_data['Breakfast'] == 1].sample(
        frac=1).reset_index(drop=True)
    lunch_items = Food_data[Food_data['Lunch'] ==
                            1].sample(frac=1).reset_index(drop=True)
    dinner_items = Food_data[Food_data['Dinner']
                             == 1].sample(frac=1).reset_index(drop=True)

    recommended_breakfast = ''
    for i, row in breakfast_items.iterrows():
        if row['Calories'] <= calories_breakfast:
            recommended_breakfast += f"\n{row}\n\n"
            calories_breakfast -= row['Calories']
        if calories_breakfast <= 0:
            break

    recommended_lunch = ''
    for i, row in lunch_items.iterrows():
        if row['Calories'] <= calories_lunch:
            recommended_lunch += f"\n{row}\n\n"
            calories_lunch -= row['Calories']
        if calories_lunch <= 0:
            break

    recommended_dinner = ''
    for i, row in dinner_items.iterrows():
        if row['Calories'] <= calories_dinner:
            recommended_dinner += f"\n{row}\n\n"
            calories_dinner -= row['Calories']
        if calories_dinner <= 0:
            break

    def recommend_breakfast():
        breakfast_items = Food_data[Food_data['Breakfast'] == 1].reset_index(
            drop=True)
        breakfast_items = breakfast_items.sample(n=3)
        bc = breakfast_items['Calories'].sum()
        return breakfast_items[['Food_items', 'Calories']]

    def recommend_lunch():
        lunch_items = Food_data[Food_data['Lunch'] == 1].reset_index(drop=True)
        lunch_items = lunch_items.sample(n=4)
        return lunch_items[['Food_items', 'Calories']]
        return lunch_items['Calories'].sum()

    def recommend_dinner():
        dinner_items = Food_data[Food_data['Dinner']
                                 == 1].reset_index(drop=True)
        dinner_items = dinner_items.sample(n=3)
        return dinner_items[['Food_items', 'Calories']]
        return dinner_items['Calories'].sum()

    breakfast = f"Total calories for breakfast: {caloric_needs * 0.25}:\nRecommend breakfast:\n{recommend_breakfast()}\n"
    lunch = f"Total calories for lunch: {caloric_needs * 0.25}:\n{recommend_lunch()}\n"
    dinner = f"Total calories for dinner: {caloric_needs * 0.25}:\n{recommend_dinner()}\n"

    response = f"Recommended breakfast (total calories: {caloric_needs * 0.25}):{recommended_breakfast}\n"

    return ''


@app.get("/tp")
def fet():

    return {'breakfast': breakfast, 'lunch': lunch, 'dinner': dinner}


if __name__ == "__main__":
    uvicorn.run("main:app")
