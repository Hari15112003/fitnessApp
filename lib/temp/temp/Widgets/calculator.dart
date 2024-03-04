// import "dart:io";


// void main(){


// // -----------------------BMR Calculator--------------------------------
//     num weight = num.parse(stdin.readLineSync()!);
//     num height = num.parse(stdin.readLineSync()!);
//     int age=int.parse(stdin.readLineSync()!);
//     String gender =stdin.readLineSync()!;
//     double bmr;


//     void BMR(weight, height, age,gender){
//       double caloriesRequiredForBMR =(weight * 10)+(6.25 * height) -(5 * age );
//       if(gender == "male"){
//          bmr=caloriesRequiredForBMR + 5;
//       }else{
//          bmr=caloriesRequiredForBMR -116 ;
//       }
//     };

//     BMR(weight, height, age,gender);
   
// // --------------------------------------Calorie Calculator--------------------------   
//     String activityLevel=stdin.readLineSync()!;

//     double level;

//     String target=stdin.readLineSync()!;

//     double calories;
//     void Calorie(bmr,activityLevel,target){


//       if (activityLevel == "beginner") {
//         level=1.3;
//       }else if(activityLevel == "intermediate"){
//         level=1.5;
//       }else if(activityLevel == "advance"){
//         level=1.7;
//       }
//       // to calculate required calories on the daily basis
//       double requiredCal=bmr * level ;

//     // Target to gain the calories
//       if(target == "gain"){
//         calories=requiredCal +500;
//       }
//       // target to loss calories
//       else if(target == "loss"){
//         calories=requiredCal - 500;
//       }


//     }
// // It will calculate calories required on the daily basis via consider target or aim of the user (burn calories or loss calories)
//     Calorie(bmr, activityLevel,target);








// // -----------------------------Ideal Body Weight Caclculator--------------------------------
// var ideal;
// void idealBodyWeight(height,gender){

//   if(gender == "male"){
//     ideal =height -100;
//   }else if(gender == "female"){
//     ideal=height-105;
//   }
// }

// idealBodyWeight(height, gender);


// // ------------------Age Calculator-----------------------
// String dobInput=stdin.readLineSync()!;
// DateTime dob =DateTime.parse(dobInput);
// DateTime now=DateTime.now();
// num ageC;

// // Age = Given date - Date of birth.
// void ageCal(dob){
//   ageC=now.year-dob.year;
//    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
//     ageC--; // Subtract one year if the current date is before the birth date
//   }

// }
// ageCal(dob);











// // ------------------------BMI Calculator--------------
// // var bmi,bodyFat;
// double bmi = 0;
// num BFP = 0;
// void BMI(weight,height){
//   double heightInCm=height/100;
//      bmi = weight / (heightInCm * heightInCm);
// }
//   BMI(weight, height);




//   // ----------------------FAT calculator---------------------
//   void fatCal(bmi ,gender,age){
//       // if (gender=="male") {
//       //   bodyFat = (1.20 * bmi) + (0.23 * age) - 16.2;
//       // }else if (gender=="female"){
//       //    bodyFat = (1.20 * bmi) + (0.23 * age) - 5.4;
//       // }





//         if(gender == "male"){

//             if(age < 18 && age > 0){
//               BFP = 1.51 * bmi - 0.70 * age - 2.2;
//             }
//             else if(age > 18 ){
//               BFP = 1.20 * bmi + 0.23 * age - 16.2; 
//             } 
//         }
//         else if(gender == "female"){
//             if(age < 18 && age > 0){
//               BFP = 1.20 * bmi + 0.23 * age - 5.4 ;
//               }
//             else if(age > 18 ){
//               BFP = 1.20 * bmi + 0.23 * age - 16.2; 
//             } 
//         }
//         // print('Your body fat percentage is ${BFP}%');
//     }

  
//   fatCal(bmi, gender, age);

// }