import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/step_detail_row.dart';

class ExercisesStepDetails extends StatefulWidget {
  final Map eObj;
  final int exerciseIndex;
  final int workoutIndex;
  const ExercisesStepDetails({
    super.key,
    required this.eObj,
    required this.exerciseIndex,
    required this.workoutIndex,
  });

  @override
  State<ExercisesStepDetails> createState() => _ExercisesStepDetailsState();
}

class _ExercisesStepDetailsState extends State<ExercisesStepDetails> {
  List<dynamic> stepArr = [
    // array for the workouts
    [
      //array for the exercise
      {
        // 01
        "descriprion":
            "Squats are a fundamental lower-body exercise that targets the quadriceps, hamstrings, and glutes. By promoting strength and stability, squats contribute to overall lower body development. Maintain proper form by keeping your chest up, back straight, and lowering your body until your thighs are parallel to the ground. Push through your heels to return to the starting position.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Stance and Posture",
            "detail":
                "Stand with feet shoulder-width apart.Keep chest up and back straight."
          },
          {
            "no": '2',
            "title": "Lowering Phase",
            "detail":
                "Lower your body by bending knees and pushing hips back.Lower until thighs are parallel to the ground."
          },
          {
            "no": '3',
            "title": "Rising Phase",
            "detail": "Push through heels to return to the starting position."
          },
        ]
      },
      {
        // 02
        "descriprion":
            "Deadlifts are a compound movement that targets the hamstrings, glutes, and upper back. This exercise enhances overall strength and stability. Start with feet hip-width apart, bend at the hips and knees, grip the barbell, and lift by straightening your hips and knees simultaneously. Lower the barbell back to the ground with controlled movements",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Start with feet hip-width apart and a barbell in front.Bend at hips and knees, keeping back straight."
          },
          {
            "no": '2',
            "title": "Grip and Lift",
            "detail":
                "Grip the barbell with hands slightly wider than shoulders.Lift the bar by straightening hips and knees."
          },
          {
            "no": '3',
            "title": "Lowering Phase",
            "detail": "Stand tall, then lower the bar back to the ground."
          },
        ]
      },
      {
        // 03
        "descriprion":
            "The bench press is a classic upper-body exercise that focuses on the chest, shoulders, and triceps. Lie on a flat bench, grip the barbell with hands slightly wider than shoulders, lower the bar to your chest, and push it back up. This exercise is effective for building upper body strength and muscle mass.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Setup on the Bench",
            "detail":
                "Lie on a flat bench with feet flat on the floor.Grip the barbell with hands slightly wider than shoulders."
          },
          {
            "no": '2',
            "title": "Lowering the Bar",
            "detail":
                "Lower the bar to your chest with elbows at a 90-degree angle."
          },
          {
            "no": '3',
            "title": "Pressing Phase",
            "detail": "Push the bar back up to the starting position."
          },
        ]
      },
      {
        // 04
        "descriprion":
            "Pull-ups are an effective upper-body exercise targeting the back, lats, and biceps. Hang from a bar with palms facing away, pull your body upward until your chin clears the bar, and then lower your body back down with control. Engage your core throughout the movement for added stability.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Hanging Position",
            "detail": "Hang from a pull-up bar with palms facing away."
          },
          {
            "no": '2',
            "title": "Pulling Upward",
            "detail": "Pull body upward until chin passes the bar."
          },
          {
            "no": '3',
            "title": "Lowering Phase",
            "detail": "Lower body back to starting position with control"
          },
        ]
      },
      {
        // 05
        "descriprion":
            "The overhead press is a shoulder-strengthening exercise. Start with a barbell at shoulder height, press it overhead, fully extending your arms, and then lower it back to shoulder height. Maintain core stability and avoid arching your back during the movement to maximize effectiveness.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Barbell Position",
            "detail": "Start with a barbell at shoulder height."
          },
          {
            "no": '2',
            "title": "Pressing Overhead",
            "detail": "Press the barbell overhead, fully extending arms."
          },
          {
            "no": '3',
            "title": "Lowering Phase",
            "detail": "Lower the barbell back to shoulder height."
          },
        ]
      },
      {
        // 06
        "descriprion":
            "Lunges are dynamic exercises that target the quadriceps, hamstrings, and glutes while enhancing balance and stability. Take a step forward, lower your body until both knees form 90-degree angles, and push off the front foot to return to the starting position. Alternate legs for a comprehensive lower body workout.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Initial Stance",
            "detail": "Stand with feet together."
          },
          {
            "no": '2',
            "title": "Forward Step",
            "detail":
                "Take a step forward, lowering your body until both knees form 90-degree angles."
          },
          {
            "no": '3',
            "title": "Return to Starting",
            "detail":
                "Push off the front foot to return to the starting position."
          },
        ]
      },
      {
        // 07
        "descriprion":
            "Planks are fundamental for core strength and stability. Begin in a push-up position, lower onto your forearms, and hold your body in a straight line. Engage your core muscles throughout the exercise and avoid sagging hips. Planks contribute to overall core development and help improve posture.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail": "Start in a push-up position with arms straight."
          },
          {
            "no": '2',
            "title": "Lowering to Forearms",
            "detail":
                "Lower onto your forearms, keeping your body in a straight line."
          },
          {
            "no": '3',
            "title": "Engaging Core",
            "detail": "Engage your core and hold the plank position."
          },
        ]
      },
      {
        // 08
        "descriprion":
            "Russian twists are excellent for targeting the obliques and improving rotational strength. While seated, lean back slightly, lift your feet off the ground, and rotate your torso from side to side, tapping the ground beside you with your hands. This exercise enhances core stability and definition.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Seated Position",
            "detail": 'Sit on the ground with knees bent and feet flat.'
          },
          {
            "no": '2',
            "title": "Lifting Feet",
            "detail": "Lean back slightly, lifting feet off the ground."
          },
          {
            "no": '3',
            "title": "Rotational Movement",
            "detail":
                'Rotate your torso from side to side, tapping the ground beside you.'
          },
        ]
      },
      {
        // 09
        "descriprion":
            "Kettlebell swings are dynamic, full-body movements that target the hips, glutes, and core. Stand with feet shoulder-width apart, swing the kettlebell between your legs, then thrust your hips forward, swinging the kettlebell to shoulder height. Control the descent and repeat for an effective cardiovascular and strength workout.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding a kettlebell."
          },
          {
            "no": '2',
            "title": "Hinging at the Hips",
            "detail":
                "Hinge at the hips, swing the kettlebell between your legs."
          },
          {
            "no": '3',
            "title": "Swinging Motion",
            "detail":
                "Thrust hips forward, swinging the kettlebell to shoulder height."
          },
          {
            "no": '4',
            "title": "Controlled Descent",
            "detail": "Control the descent and repeat the swinging motion."
          },
        ]
      },
      {
        // 10
        "descriprion":
            "Burpees are a high-intensity, full-body exercise that combines strength and cardiovascular conditioning. Start in a standing position, drop into a plank, perform a push-up, jump your feet back towards your hands, and explosively jump into the air. This exercise is excellent for overall conditioning and calorie burning.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "From Standing to Plank",
            "detail": "Start in a standing position."
          },
          {
            "no": '2',
            "title": "Drop to Plank",
            "detail": "Drop into a plank position, perform a push-up."
          },
          {
            "no": '3',
            "title": "Jumping Back In",
            "detail": "Jump feet back towards your hands."
          },
          {
            "no": '4',
            "title": "Explosive Jump",
            "detail":
                "Explosively jump into the air, reaching arms overhead.y6y6"
          },
        ]
      },
      {
        // 11
        "descriprion":
            "Box jumps are plyometric exercises that target the lower body, specifically the quadriceps, hamstrings, and glutes. Stand in front of a sturdy box, jump onto the box, land with both feet, and then stand tall. Ensure proper landing mechanics to reduce impact on joints and muscles.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Positioning in Front of the Box",
            "detail": "Stand in front of a sturdy box or platform."
          },
          {
            "no": '2',
            "title": "Jumping Onto the Box",
            "detail": "Bend your knees and jump onto the box."
          },
          {
            "no": '3',
            "title": "Landing and Standing",
            "detail": "Land with both feet on the box, stand tall."
          },
          {
            "no": '4',
            "title": "Stepping or Jumping Down",
            "detail": "Step or jump back down with controlled movements."
          },
        ]
      },
      {
        // 12
        "descriprion":
            "Medicine ball slams are dynamic, explosive movements that engage the entire body. Lift a medicine ball overhead and slam it forcefully to the ground. Catch the ball on the bounce or after it rebounds. This exercise is excellent for cardiovascular fitness, core strength, and stress release.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Holding the Medicine Ball",
            "detail":
                "Stand with feet shoulder-width apart, holding a medicine ball overhead."
          },
          {
            "no": '2',
            "title": "Forceful Slam",
            "detail": "Slam the ball forcefully to the ground."
          },
          {
            "no": '3',
            "title": "Catching the Rebound",
            "detail": "Catch the ball on the bounce or after it rebounds."
          },
          {
            "no": '4',
            "title": "Maintaining Core Engagement",
            "detail": "Maintain a strong core throughout the slamming motion."
          },
        ]
      },
    ],
    // 2nd workout Upper Body WorkOut
    [
      {
        // 01
        "descriprion":
            "Push-ups are a classic bodyweight exercise that provides a versatile and effective means of building strength in the upper body. The exercise primarily targets the chest, shoulders, and triceps, while also engaging the core muscles.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Begin in a plank position, hands slightly wider than shoulder-width apart."
          },
          {
            "no": '2',
            "title": "Downward Phase",
            "detail":
                "Lower your body towards the ground by bending your elbows."
          },
          {
            "no": '3',
            "title": "Upward Phase:",
            "detail":
                "Push through your palms to return to the starting position."
          },
          {
            "no": '4',
            "title": "Core Engagement",
            "detail": "Keep your core tight for added stability."
          },
        ]
      },
      {
        // 02
        "descriprion":
            "Pull-ups are a classic and effective upper body exercise that primarily targets the muscles of the back, specifically the latissimus dorsi. Hanging from a horizontal bar with palms facing away, pull your body upwards until your chin clears the bar, engaging the biceps, upper back, and forearms. The controlled descent back down ensures a full range of motion and optimal muscle engagement. Pull-ups not only build strength in the back but also contribute to improved grip strength and overall upper body endurance.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Grip and Hang",
            "detail":
                "Grab a horizontal bar with palms facing away, hang with arms fully extended."
          },
          {
            "no": '2',
            "title": "Pulling Phase",
            "detail": "Pull your body upwards until your chin clears the bar."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail": "Lower your body back down with control"
          },
        ]
      },
      {
        // 03
        "descriprion":
            "The Overhead Press, also known as the Shoulder Press, is a fundamental compound exercise focusing on developing shoulder strength and stability. Stand with a barbell at shoulder height, press it overhead, and lower it back down in a controlled manner. This movement engages the deltoids, trapezius, and triceps. Maintaining proper form and core engagement is crucial to ensure shoulder stability. Overhead Press is versatile and can be performed with dumbbells or a seated position, providing a comprehensive upper body workout.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, hold a barbell at shoulder height."
          },
          {
            "no": '2',
            "title": "Pressing Phase",
            "detail": "Push the barbell overhead until arms are fully extended."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail": "Lower the barbell back to shoulder height with control."
          },
          {
            "no": '4',
            "title": "Core Engagement",
            "detail": "Engage your core to stabilize the movement."
          },
        ]
      },
      {
        // 04
        "descriprion":
            "The Bench Press is a cornerstone exercise for developing upper body strength, particularly targeting the chest, triceps, and shoulders. Lying on a flat bench, grip a barbell with hands slightly wider than shoulder-width, lower it to your chest, and press it back up. Emphasis on a stable body position and controlled movements is essential for optimal muscle activation. Bench Press variations, such as incline or decline, can be incorporated to target different areas of the chest and ensure well-rounded chest development.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on a flat bench, grip the barbell with hands slightly wider than shoulder-width."
          },
          {
            "no": '2',
            "title": 'Stable Body Position',
            "detail":
                "Maintain a stable body position with feet flat on the ground."
          },
          {
            "no": '3',
            "title": "Core Engagement",
            "detail": "Engage your core to stabilize the movement."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with incline or decline bench for diverse muscle engagement."
          },
        ]
      },
      {
        // 05
        "descriprion":
            "Dumbbell Flyes are a chest isolation exercise designed to enhance chest definition and stretch the pectoral muscles. Lie on a flat bench, holding dumbbells above your chest, and open your arms wide before bringing them back together. This motion emphasizes the stretch in the chest, promoting muscle growth and definition. Dumbbell Flyes are an excellent complement to compound chest exercises, offering targeted isolation and promoting a fuller chest appearance.",

        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on a flat bench, hold dumbbells above your chest with arms slightly bent."
          },
          {
            "no": '2',
            "title": "Opening Motion",
            "detail":
                " Open your arms wide, maintaining a slight bend in your elbows."
          },
          {
            "no": '3',
            "title": "Chest Stretch",
            "detail": "Emphasize the stretch in your chest during the movement."
          },
        ]
      },
      {
        // 06
        "descriprion":
            "Lat Pulldowns are a cable machine exercise targeting the latissimus dorsi, contributing to back width and strength. Sit at the lat pulldown machine, grip the bar with hands wider than shoulder-width, and pull it down towards your chest. Proper scapular retraction and controlled ascent are crucial for engaging the upper back effectively. Lat Pulldowns provide a versatile and controlled alternative to pull-ups, allowing for customizable resistance and focused muscle engagement.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": 'Starting Position',
            "detail":
                " Sit at a lat pulldown machine, grip the bar with hands wider than shoulder-width."
          },
          {
            "no": '2',
            "title": "Pulling Phase",
            "detail": "Pull the bar down to the chest, engaging the lats."
          },
          {
            "no": '3',
            "title": "Controlled Ascent",
            "detail": "Allow the bar to ascend with control."
          },
          {
            "no": '4',
            "title": "Scapular Retraction",
            "detail":
                "Emphasize scapular retraction for optimal lat engagement."
          },
        ]
      },
      {
        // 07
        "descriprion":
            "Bent Over Rows are a compound movement that targets the entire back musculature, including the lats, rhomboids, and traps. Stand with a barbell, hinge at the hips, and pull the barbell towards your lower chest. Emphasize scapular retraction for optimal muscle activation and control throughout the movement. Bent Over Rows contribute to overall back strength, muscle development, and improved posture when performed with proper form and technique.",

        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet hip-width apart, hold a barbell with an overhand grip."
          },
          {
            "no": '2',
            "title": "Bending Phase",
            "detail":
                "Hinge at the hips, keeping the back straight, and lower the barbell towards the ground."
          },
        ]
      },
      {
        // 08
        "descriprion":
            "Bicep Curls are a foundational exercise for developing bicep strength and definition. Stand with a dumbbell in each hand, arms fully extended, and curl the dumbbells towards your shoulders. Squeeze the biceps at the top of the movement and control the descent back down. Bicep Curls effectively isolate the biceps brachii, contributing to arm aesthetics and strength. Variations, such as alternating arms or different grips, can be incorporated for muscle diversity.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail": "Stand with a dumbbell in each hand, arms fully extended."
          },
          {
            "no": '2',
            "title": "Squeezing at the Top",
            "detail": "Squeeze your biceps at the top of the movement."
          },
        ]
      },
      {
        // 09
        "descriprion":
            "Tricep Dips are a bodyweight exercise targeting the triceps brachii for effective isolation and strength development. Sit on a bench with hands gripping the edge, lower your body towards the ground by bending your elbows, and press back up to the starting position. Keeping elbows close to the body enhances tricep isolation and engagement. Tricep Dips are versatile and can be adjusted in intensity by changing hand positioning or elevating the feet.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                " Sit on a bench with hands gripping the edge, fingers pointing forward."
          },
          {
            "no": '2',
            "title": "Lowering Phase",
            "detail":
                " Lower your body towards the ground by bending your elbows."
          },
          {
            "no": '3',
            "title": "Pressing Phase",
            "detail": "Push your body back up to the starting position."
          },
        ]
      },
      {
        // 10
        "descriprion":
            "Hammer Curls are a bicep exercise focusing on the brachialis and forearm muscles. Hold a dumbbell in each hand with palms facing your torso, curl the dumbbells towards your shoulders with a neutral grip, and control the descent. Hammer Curls provide balanced development to the biceps and brachialis, contributing to overall arm strength and aesthetics. Performing Hammer Curls alternately ensures muscle balance and engages the forearms effectively.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position:",
            "detail":
                "Hold a dumbbell in each hand with palms facing your torso."
          },
          {
            "no": '2',
            "title": "Curling Motion",
            "detail":
                "Curl the dumbbells towards your shoulders with a neutral grip."
          },
          {
            "no": '3',
            "title": "Forearm Emphasis",
            "detail":
                "Emphasize the contraction in your forearms during the curl."
          },
        ]
      },
      {
        // 11
        "descriprion":
            "Lateral Raises are a shoulder isolation exercise that targets the lateral deltoids for enhanced shoulder width and definition. Stand with a dumbbell in each hand, arms by your sides, and raise both arms laterally until they reach shoulder height. Controlled descent ensures muscle engagement throughout the movement.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail": "Stand with a dumbbell in each hand, arms by your sides."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Raise both arms laterally until they reach shoulder height."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail": "Lower the dumbbells with control."
          },
        ]
      },
      {
        // 12
        "descriprion":
            "Front Raises are a targeted exercise for developing the anterior deltoids, emphasizing the front part of the shoulder. Stand with a dumbbell in each hand, arms by your sides, and lift both arms in front until they reach shoulder height. Controlled descent is crucial to maximize muscle engagement.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail": "Stand with a dumbbell in each hand, arms by your sides"
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Raise both arms in front until they reach shoulder height."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail": "Lower the dumbbells with control."
          },
        ]
      },
    ],
    // 3rd workout Lower Body WorkOut
    [
      {
        // 01
        "descriprion":
            "Squats are a fundamental lower-body exercise targeting the quadriceps, hamstrings, and glutes. With feet shoulder-width apart, lower your body by bending your knees and pushing your hips back. Keep your chest up and back straight. Lower until your thighs are parallel to the ground, then push through your heels to return to the starting position. Squats enhance overall lower body strength, stability, and muscle development.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Stance and Posture",
            "detail":
                "Begin with your feet shoulder-width apart, ensuring your chest is up, and your back remains straight."
          },
          {
            "no": '2',
            "title": "Lowering Phase",
            "detail":
                "Bend your knees and push your hips back, lowering your body until your thighs are parallel to the ground."
          },
          {
            "no": '3',
            "title": "Rising Phase",
            "detail":
                "Powerfully push through your heels, returning to the starting position while maintaining proper form"
          },
          {
            "no": '4',
            "title": "Core Engagement",
            "detail":
                "Keep your core muscles engaged throughout the movement to enhance stability and protect your lower back."
          },
        ]
      },
      {
        // 02
        "descriprion":
            "Deadlifts engage multiple muscle groups, including the hamstrings, glutes, and lower back. Stand with feet hip-width apart, bend at the hips and knees, grip the barbell, and lift by straightening your hips and knees simultaneously. This powerful exercise contributes to overall strength and stability, promoting functional movement patterns.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with your feet hip-width apart, maintaining a neutral spine and placing the barbell in front of you."
          },
          {
            "no": '2',
            "title": "Grip and Lift",
            "detail":
                "Grasp the barbell with your hands slightly wider than shoulder-width, engaging your upper back."
          },
          {
            "no": '3',
            "title": "Lowering Phase",
            "detail":
                "Bend at the hips and knees, lifting the barbell by straightening your hips and knees; lower with control."
          },
          {
            "no": '4',
            "title": "Back Safety Tip",
            "detail":
                " Focus on keeping your back straight throughout the movement to protect your lower back."
          },
        ]
      },
      {
        // 03
        "descriprion":
            "Lunges are dynamic exercises targeting the quadriceps, hamstrings, and glutes while improving balance and stability. Take a step forward, lowering your body until both knees form 90-degree angles. Push off the front foot to return to the starting position. Lunges enhance unilateral strength and help address muscle imbalances.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Initial Stance",
            "detail":
                "Begin with your feet together and maintain an upright posture"
          },
          {
            "no": '2',
            "title": "Forward Step",
            "detail":
                "Take a controlled step forward, lowering your body until both knees form 90-degree angles."
          },
          {
            "no": '3',
            "title": "Return to Starting",
            "detail":
                " Push off the front foot to return, emphasizing balance and control."
          },
          {
            "no": '4',
            "title": "Balance Enhancement",
            "detail":
                "Engage your core for improved balance, making lunges effective for unilateral strength development."
          },
          {
            "no": '5',
            "title": "Unilateral Strength",
            "detail": "Lunges isolate each leg, addressing muscle imbalances."
          },
        ]
      },
      {
        // 04
        "descriprion":
            "Leg Press is a machine-based exercise that targets the quadriceps, hamstrings, and glutes. Sit on the machine, place your feet on the platform, and push the platform away by straightening your legs. Control the descent for a complete range of motion. Leg Press is effective for building lower body strength with less stress on the spine.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                " Sit comfortably on the leg press machine with your feet on the platform."
          },
          {
            "no": '2',
            "title": "Pressing Phase",
            "detail":
                " Push the platform away by straightening your legs, ensuring a full extension"
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the platform back down with controlled movements, allowing for a complete range of motion."
          },
          {
            "no": '4',
            "title": "Adjustable Intensity",
            "detail":
                "Modify the machine's weight to suit your fitness level, targeting the quadriceps effectively."
          },
        ]
      },
      {
        // 05
        "descriprion":
            "Leg Curls isolate the hamstrings. Lie facedown on the machine, curl your legs towards your glutes, and control the lowering phase. This exercise is crucial for hamstring development, promoting knee flexion strength and balance in the lower body.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Positioning",
            "detail": " Lie facedown on the machine with your legs extended."
          },
          {
            "no": '2',
            "title": "Curling Motion",
            "detail":
                " Curl your legs towards your glutes, emphasizing hamstring contraction."
          },
          {
            "no": '3',
            "title": "Lowering Phase",
            "detail": "Control the descent to maximize muscle engagement."
          },
          {
            "no": '4',
            "title": "Stretch Importance",
            "detail":
                " Allow for a full stretch at the bottom of each repetition."
          },
        ]
      },
      {
        // 06
        "descriprion":
            "Bodyweight Squats are a simple yet effective exercise for lower body conditioning. Perform squats without added resistance, focusing on maintaining proper form. This exercise is excellent for beginners and can be progressively intensified as strength improves.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Basic Execution",
            "detail": "Perform squats without added resistance."
          },
          {
            "no": '2',
            "title": "Proper Form Focus",
            "detail": "Emphasis on maintaining form."
          },
          {
            "no": '3',
            "title": "Progressive Intensity",
            "detail": "Suitable for beginners, progressive."
          },
          {
            "no": '4',
            "title": "Full Range of Motion",
            "detail": "Engage muscles effectively."
          },
          {
            "no": '5',
            "title": "Full Range of Motion",
            "detail": "Ideal for foundational conditioning."
          },
        ]
      },
      {
        // 07
        "descriprion":
            "Bulgarian Split Squats are unilateral exercises targeting each leg individually. Stand with one foot elevated behind you, lower your body by bending the front knee, and return to the starting position. This exercise improves balance, flexibility, and single-leg strength.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail": "Stand, one foot elevated behind."
          },
          {
            "no": '2',
            "title": "Lowering Phase",
            "detail": "Bend front knee, return."
          },
          {
            "no": '3',
            "title": "Balance Challenge",
            "detail": "Enhances balance and flexibility."
          },
        ]
      },
      {
        // 08
        "descriprion":
            "Box Jumps are plyometric exercises enhancing explosive power in the lower body. Jump onto a sturdy box, land softly, and stand tall. This exercise contributes to improved strength, coordination, and cardiovascular fitness.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Jumping Motion",
            "detail": "Jump onto a sturdy box, land softly."
          },
          {
            "no": '2',
            "title": "Explosive Strength",
            "detail": "Enhances lower body explosive strength."
          },
        ]
      },
      {
        // 09
        "descriprion":
            "Calf Raises isolate the calf muscles. Stand with feet hip-width apart, rise onto your toes, and lower your heels back down. This exercise is essential for developing the calves, contributing to overall lower leg strength and definition.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Stance and Motion",
            "detail":
                "Stand with your feet hip-width apart, rise onto your toes, and lower your heels."
          },
          {
            "no": '2',
            "title": "Calf Contraction",
            "detail":
                " Emphasize the contraction of your calf muscles at the top of the movement."
          },
          {
            "no": '3',
            "title": "Strength Development",
            "detail":
                "Calf raises strengthen your calves, contributing to lower leg definition."
          },
          {
            "no": '4',
            "title": "Frequency Consideration",
            "detail":
                "Include calf raises regularly in your routine for optimal calf development."
          },
        ]
      },
      {
        // 10
        "descriprion":
            "Glute Bridges target the gluteal muscles. Lie on your back, bend your knees, and lift your hips towards the ceiling. Squeeze your glutes at the top of the movement. This exercise is effective for strengthening the posterior chain and enhancing gluteal activation.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on your back, bend your knees, and place your feet hip-width apart on the ground."
          },
          {
            "no": '2',
            "title": "Glute Squeeze",
            "detail":
                " Lift your hips towards the ceiling, squeezing your glutes at the top of the movement.",
          },
          {
            "no": '3',
            "title": "Posterior Chain Engagement",
            "detail":
                "Glute bridges activate the entire posterior chain, including the glutes, hamstrings, and lower back."
          },
          {
            "no": '4',
            "title": "Core Stability",
            "detail":
                " Maintain core stability throughout the exercise to support the lower back."
          },
        ]
      },
      {
        // 11
        "descriprion":
            "Side Lunges work the inner and outer thighs. Take a lateral step, bending one knee while keeping the other leg straight. Push off the bent leg to return to the starting position. Side Lunges improve lateral movement and add diversity to lower body workouts.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Initial Stance",
            "detail":
                "Begin with your feet together, maintaining an upright posture."
          },
          {
            "no": '2',
            "title": "Lateral Step",
            "detail":
                "Take a lateral step to one side, keeping one leg straight and bending the other knee."
          },
          {
            "no": '3',
            "title": "Return to Center",
            "detail":
                " Push off the bent leg to return to the center, emphasizing control."
          },
          {
            "no": '4',
            "title": "Muscle Emphasis",
            "detail":
                "Side lunges emphasize inner and outer thigh activation, promoting lateral movement."
          },
        ]
      },
      {
        // 12
        "descriprion":
            "Step-Ups target the quadriceps and glutes. Step onto a bench or platform, lifting your body with one leg, then lower back down. This exercise enhances unilateral strength and can be adjusted by varying step height.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail": " Begin by stepping onto a bench or platform with one leg"
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail": " Begin by stepping onto a bench or platform with one leg"
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower your body back down with controlled movements, focusing on balance."
          },
          {
            "no": '4',
            "title": "Balance Enhancement",
            "detail":
                "Improve balance by concentrating on controlled stepping motions."
          },
        ]
      },
    ],
    // 4 th abs
    [
      {
        // 01
        "descriprion": "crunsh",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on your back with knees bent, feet flat on the ground, and hands behind your head. Ensure a comfortable and stable position."
          },
          {
            "no": '2',
            "title": "Crunching Motion",
            "detail":
                "Engage your core muscles and lift your upper body towards your knees. Exhale during the upward phase of the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower your upper body back down to the ground with control. Avoid pulling on your neck and focus on using your abdominal muscles."
          },
          {
            "no": '4',
            "title": "Full Range of Motion",
            "detail":
                "Ensure a full range of motion by lifting your shoulder blades off the ground. Feel the contraction in your abdominal muscles at the top."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different hand positions or perform crunches on an incline for added challenge. Adjust repetitions based on your fitness level."
          }
        ]
      },
      {
        // 02
        "descriprion": "plank",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Start in a forearm plank position with elbows directly beneath your shoulders. Keep your body in a straight line from head to heels."
          },
          {
            "no": '2',
            "title": "Engagement",
            "detail":
                "Engage your core muscles and hold the plank position. Keep your back straight, and avoid sagging or arching of the hips."
          },
          {
            "no": '3',
            "title": "Breathing",
            "detail":
                "Focus on steady breathing throughout the plank hold. Inhale and exhale slowly to maintain control and stability."
          },
          {
            "no": '4',
            "title": "Full Body Activation",
            "detail":
                "Feel the activation in your core, shoulders, and lower body. Planks effectively target multiple muscle groups for overall strength."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Explore plank variations, such as side planks or plank jacks, for added diversity. Gradually increase the duration as your core strength improves."
          }
        ]
      },
      {
        // 03
        "descriprion": "russian",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit on the ground with your knees bent, leaning back slightly. Hold your hands together in front of you, or use a weight for added resistance."
          },
          {
            "no": '2',
            "title": "Twisting Motion",
            "detail":
                "Twist your torso to one side, bringing your hands or the weight towards the ground. Engage your obliques during the twisting motion."
          },
          {
            "no": '3',
            "title": "Controlled Return",
            "detail":
                "Return to the center and then twist to the opposite side. Maintain control and balance throughout the exercise."
          },
          {
            "no": '4',
            "title": "Breathing",
            "detail":
                "Coordinate your breathing with the twisting motion. Exhale during the twist and inhale during the return to the center."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the intensity by using a heavier weight or increasing the speed of the twists. Focus on the quality of the movement for maximum benefit."
          }
        ]
      },
      {
        // 04
        "descriprion": "bicycle",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on your back with hands behind your head, legs lifted, and knees bent. Bring one knee towards your chest while extending the other leg."
          },
          {
            "no": '2',
            "title": "Crunching Motion",
            "detail":
                "Rotate your torso, bringing the opposite elbow towards the bent knee. Engage your core muscles and feel the contraction in the obliques."
          },
          {
            "no": '3',
            "title": "Controlled Extension",
            "detail":
                "Extend the bent leg while bringing the opposite knee towards your chest. Keep the movements controlled and maintain a steady pace."
          },
          {
            "no": '4',
            "title": "Breathing",
            "detail":
                "Coordinate your breathing with the bicycle crunches. Exhale during the crunch and inhale during the extension phase of the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Increase the challenge by extending the legs lower to the ground. Perform bicycle crunches with a slow and controlled tempo for optimal effectiveness."
          }
        ]
      },
      {
        // 05
        "descriprion": "hanging leg",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Hang from a pull-up bar with an overhand grip, arms fully extended. Keep your legs straight and feet together."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift your legs towards the ceiling, using your lower abdominal muscles. Keep the movement controlled and avoid swinging."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower your legs back down with control, maintaining stability. Avoid arching your back and focus on engaging the core."
          },
          {
            "no": '4',
            "title": "Breathing",
            "detail":
                "Exhale during the leg lift and inhale during the controlled descent. Focus on maintaining a steady breathing rhythm throughout."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Perform hanging leg raises with bent knees for added difficulty. Gradually increase the range of motion as your core strength improves."
          }
        ]
      },
      {
        // 06
        "descriprion": " ab rolloutrs",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Kneel on the ground with an ab roller in front of you. Hold the handles with an overhand grip and extend your arms forward."
          },
          {
            "no": '2',
            "title": "Rolling Motion",
            "detail":
                "Engage your core and roll the ab roller forward, extending your body into a plank position. Maintain a straight line from head to heels."
          },
          {
            "no": '3',
            "title": "Controlled Return",
            "detail":
                "Roll the ab roller back towards your knees with control. Keep your core tight and prevent arching or sagging of the back."
          },
          {
            "no": '4',
            "title": "Breathing",
            "detail":
                "Exhale during the rolling motion and inhale during the return. Focus on controlled breathing to enhance core engagement."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the difficulty by extending the rollout distance or using an ab roller with resistance. Perform ab rollouts on an incline for added challenge."
          }
        ]
      },
      {
        // 07
        "descriprion": "mountain climbers",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Begin in a plank position with your hands beneath your shoulders. Keep your body in a straight line from head to heels."
          },
          {
            "no": '2',
            "title": "Alternating Knee Drive",
            "detail":
                "Drive one knee towards your chest while keeping the other leg extended. Maintain a quick and controlled pace throughout the movement."
          },
          {
            "no": '3',
            "title": "Dynamic Movement",
            "detail":
                "Switch the position of your legs in a fluid and dynamic motion. Keep your core engaged and maintain a consistent tempo."
          },
          {
            "no": '4',
            "title": "Breathing",
            "detail":
                "Coordinate your breathing with the mountain climbers. Exhale during the knee drive and inhale during the extension phase of the movement."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Increase intensity by performing mountain climbers at a faster pace or incorporating cross-body knee drives. Focus on core stability for optimal results."
          }
        ]
      },
      {
        // 08
        "descriprion": "reverse crunches",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on your back with legs lifted, knees bent, and hands by your sides. Ensure a stable position and engage your core muscles."
          },
          {
            "no": '2',
            "title": "Crunching Motion",
            "detail":
                "Lift your hips towards your chest, emphasizing the lower abdominal muscles. Keep the movement controlled and avoid using momentum."
          },
          {
            "no": '3',
            "title": "Controlled Extension",
            "detail":
                "Lower your hips back down with control, maintaining stability. Focus on engaging the core throughout the entire range of motion."
          },
          {
            "no": '4',
            "title": "Breathing",
            "detail":
                "Exhale during the hip lift and inhale during the controlled descent. Maintain a steady breathing rhythm for optimal core activation."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Perform reverse crunches with straight legs for added challenge. Gradually increase the difficulty by extending the range of motion."
          }
        ]
      },
      {
        // 09
        "descriprion": "wood choopers",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding a weight or medicine ball with both hands. Position the weight on one side of your body."
          },
          {
            "no": '2',
            "title": "Chopping Motion",
            "detail":
                "Engage your core and lift the weight diagonally across your body, ending above the opposite shoulder. Rotate your torso during the movement."
          },
          {
            "no": '3',
            "title": "Controlled Return",
            "detail":
                "Lower the weight back to the starting position with control. Keep your core tight and maintain stability throughout the woodchopping motion."
          },
          {
            "no": '4',
            "title": "Breathing",
            "detail":
                "Exhale during the chopping motion and inhale during the return. Focus on controlled breathing to enhance core engagement and coordination."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the weight and intensity based on your fitness level. Perform woodchoppers in both directions to target different muscle groups."
          }
        ]
      },
      {
        // 10
        "descriprion": "flutter kicks",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on your back with legs extended and hands by your sides. Lift your legs off the ground, keeping them straight or slightly bent."
          },
          {
            "no": '2',
            "title": "Fluttering Motion",
            "detail":
                "Perform small, quick kicks with your legs, alternating between lifting one leg higher than the other. Keep your core engaged throughout."
          },
          {
            "no": '3',
            "title": "Controlled Movement",
            "detail":
                "Maintain control and stability during the flutter kicks. Avoid excessive arching of the back and focus on using your lower abdominal muscles."
          },
          {
            "no": '4',
            "title": "Breathing",
            "detail":
                "Coordinate your breathing with the fluttering motion. Exhale and inhale in a rhythmic pattern to enhance core engagement."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Increase the challenge by extending the duration of flutter kicks or incorporating them into a full ab workout routine. Focus on quality over quantity."
          }
        ]
      },
      {
        // 11
        "descriprion": "side planks",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on your side with your elbow directly beneath your shoulder. Stack your legs on top of each other, forming a straight line from head to heels."
          },
          {
            "no": '2',
            "title": "Lift and Hold",
            "detail":
                "Lift your hips off the ground, forming a straight line with your body. Support your body weight on your forearm and the side of your foot."
          },
          {
            "no": '3',
            "title": "Core Engagement",
            "detail":
                "Engage your core muscles to maintain stability. Ensure your body remains in a straight line, avoiding sagging or lifting of the hips."
          },
          {
            "no": '4',
            "title": "Duration",
            "detail":
                "Hold the side plank position for a specified duration, gradually increasing over time. Focus on steady breathing and proper form throughout."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with lifting the top leg or adding a lateral raise for increased difficulty. Adjust the intensity based on your fitness level and goals."
          }
        ]
      },
      {
        // 12
        "descriprion": "toe touches",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on your back with legs extended and arms reaching overhead. Ensure your lower back is pressed against the floor for proper spinal alignment."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift your legs and upper body simultaneously, aiming to touch your toes. Engage your abdominal muscles to initiate the lifting motion."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower your legs and upper body back to the starting position with control. Avoid jerky movements and maintain tension in the core."
          },
          {
            "no": '4',
            "title": "Abdominal Contraction",
            "detail":
                "Emphasize the contraction in your abdominal muscles during the upward phase. Focus on using the core to lift rather than momentum."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different hand positions or use ankle weights for added resistance. Modify the range of motion based on your flexibility and comfort."
          }
        ]
      },
    ],
    // 5 th leg
    [
      {
        // 1
        "descriprion": "squats",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, toes pointing forward. Keep your chest up, shoulders back, and engage your core for stability."
          },
          {
            "no": '2',
            "title": "Descending Phase",
            "detail":
                "Initiate the squat by bending at your hips and knees. Lower your body as if sitting back into a chair, keeping your knees in line with your toes."
          },
          {
            "no": '3',
            "title": "Full Range of Motion",
            "detail":
                "Lower your body until your thighs are parallel to the ground or as far as comfortably possible. Ensure a smooth and controlled descent."
          },
          {
            "no": '4',
            "title": "Ascending Phase",
            "detail":
                "Push through your heels to return to the starting position. Fully extend your hips and knees at the top of the movement."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different squat variations like sumo squats or front squats. Adjust foot positioning for varied muscle engagement."
          }
        ],
      },
      {
        // 2
        "descriprion": "lunges",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet together. Take a step forward with one foot, ensuring a stride length that allows a 90-degree bend in both knees."
          },
          {
            "no": '2',
            "title": "Descending Phase",
            "detail":
                "Lower your body by bending both knees until they form 90-degree angles. Ensure your front knee is directly above your ankle."
          },
          {
            "no": '3',
            "title": "Pushing Motion",
            "detail":
                "Push off the front foot to return to the starting position. Maintain a controlled and balanced movement throughout."
          },
          {
            "no": '4',
            "title": "Alternating Legs",
            "detail":
                "Perform lunges alternately with each leg forward. Keep your torso upright, engaging your core for stability."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with walking lunges or add resistance with dumbbells. Adjust the length of your strides for varied muscle activation."
          }
        ],
      },
      {
        // 3
        "descriprion": "leg press",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit on a leg press machine with your back against the padded support. Place your feet hip-width apart on the platform."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Press the platform away by extending your hips and knees. Keep your knees in line with your toes throughout the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the platform back towards you with control. Avoid locking your knees at the top of the movement."
          },
          {
            "no": '4',
            "title": "Full Range of Motion",
            "detail":
                "Ensure a full range of motion by allowing your knees to bend to approximately 90 degrees. Maintain a smooth and controlled press."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different foot positions for varied muscle emphasis. Adjust the weight based on your strength and fitness level."
          }
        ],
      },
      {
        // 4
        "descriprion": "leg curls",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie facedown on a leg curl machine, with your ankles hooked under the padded lever. Align your knees with the machine's axis."
          },
          {
            "no": '2',
            "title": "Curling Motion",
            "detail":
                "Curl your legs towards your glutes by flexing your knees. Keep your hips and torso in contact with the bench throughout the movement."
          },
          {
            "no": '3',
            "title": "Controlled Return",
            "detail":
                "Lower the lever back down with control, fully extending your legs. Maintain a smooth and deliberate curling motion."
          },
          {
            "no": '4',
            "title": "Isolating Hamstrings",
            "detail":
                "Focus on engaging your hamstrings during the curl. Ensure your lower back stays flat, avoiding excessive arching."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with single-leg leg curls for increased isolation. Adjust the machine settings to suit your leg length and comfort."
          }
        ],
      },
      {
        // 5
        "descriprion": "bulgarian split squats",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand facing away from a bench, about two feet away. Place one foot behind you on the bench, toes pointing downward."
          },
          {
            "no": '2',
            "title": "Descending Phase",
            "detail":
                "Lower your body by bending your front knee, keeping your torso upright. Ensure your back knee descends towards the ground."
          },
          {
            "no": '3',
            "title": "Pushing Motion",
            "detail":
                "Push through the heel of your front foot to return to the starting position. Engage your glutes and quadriceps throughout."
          },
          {
            "no": '4',
            "title": "Single-Leg Focus",
            "detail":
                "Perform Bulgarian split squats on one leg at a time. Maintain balance and stability, utilizing the bench for support."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with adding dumbbells for resistance or elevate your front foot for an increased challenge. Adjust the bench distance for varied difficulty."
          }
        ],
      },
      {
        // 6
        "descriprion": "box jum",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand in front of a sturdy box or platform with feet shoulder-width apart. Keep your chest up and shoulders back."
          },
          {
            "no": '2',
            "title": "Jumping Motion",
            "detail":
                "Jump onto the box explosively, using your arms for momentum. Land softly with your knees slightly bent to absorb the impact."
          },
          {
            "no": '3',
            "title": "Step Down",
            "detail":
                "Step down from the box with control, landing on both feet. Ensure a stable and controlled descent to minimize stress on joints."
          },
          {
            "no": '4',
            "title": "Height Variation",
            "detail":
                "Adjust the height of the box based on your fitness level. Gradually increase the height for progressive challenges in explosive power."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with lateral box jumps or add weights for increased resistance. Focus on proper landing mechanics for joint safety."
          }
        ],
      },
      {
        // 7
        "descriprion": "calf raises",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet hip-width apart, ensuring a stable base. You can perform calf raises on flat ground or on an elevated surface."
          },
          {
            "no": '2',
            "title": "Rising Phase",
            "detail":
                "Rise onto your toes by lifting your heels off the ground. Squeeze your calf muscles at the top of the movement for full contraction."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower your heels back down to the starting position with control. Ensure a smooth and deliberate movement throughout."
          },
          {
            "no": '4',
            "title": "Single-Leg Focus",
            "detail":
                "Perform calf raises on one leg at a time for increased focus and balance. Maintain proper alignment and engage your core."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different foot positions, such as toes pointed inward or outward. Add resistance with dumbbells or a calf raise machine."
          }
        ],
      },
      {
        // 8
        "descriprion": "glute bridges",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on your back with knees bent and feet hip-width apart. Place your arms at your sides with palms facing down for stability."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift your hips towards the ceiling, engaging your glutes. Ensure your shoulders, hips, and knees form a straight line at the top of the bridge."
          },
          {
            "no": '3',
            "title": "Squeezing Glutes",
            "detail":
                "Squeeze your glutes at the top of the movement for maximum activation. Maintain a stable and controlled lifting motion throughout."
          },
          {
            "no": '4',
            "title": "Controlled Descent",
            "detail":
                "Lower your hips back down to the starting position with control. Avoid arching your lower back excessively during the descent."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with single-leg glute bridges or elevate your feet for added difficulty. Focus on the mind-muscle connection for optimal results."
          }
        ],
      },
      {
        // 9
        "descriprion": "step ups",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand in front of a sturdy bench or platform. Step onto the surface with one foot, ensuring it is fully placed on the platform."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift your body by extending the stepping leg. Ensure a straight line from head to heel during the upward phase of the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower your body back down to the starting position with control. Avoid rapid or jerky movements to maintain stability."
          },
          {
            "no": '4',
            "title": "Balance Enhancement",
            "detail":
                "Improve balance by focusing on controlled stepping motions. Engage your core throughout the exercise for added stability."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different step heights or add resistance with dumbbells. Perform step-ups alternately for balanced muscle development."
          }
        ],
      },
      {
        // 10
        "descriprion": "deadlifts",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet hip-width apart, toes pointing forward. Hold a barbell in front of you with an overhand grip, hands slightly wider than shoulder-width."
          },
          {
            "no": '2',
            "title": "Hip Hinge",
            "detail":
                "Hinge at your hips, pushing them back while maintaining a flat back. Lower the barbell towards the ground, keeping it close to your body."
          },
          {
            "no": '3',
            "title": "Lifting Motion",
            "detail":
                "Lift the barbell by extending your hips and knees simultaneously. Keep the barbell close to your body throughout the upward motion."
          },
          {
            "no": '4',
            "title": "Full Extension",
            "detail":
                "Stand tall, fully extending your hips and straightening your back. Ensure a straight line from head to heels at the top of the deadlift."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different deadlift variations, such as Romanian deadlifts or sumo deadlifts. Adjust the grip width based on comfort and goals."
          }
        ],
      },
      {
        // 11
        "descriprion": "side lunges",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet together. Take a step to the side with one foot, ensuring a wide stance. Keep toes pointing forward."
          },
          {
            "no": '2',
            "title": "Lateral Lunge",
            "detail":
                "Shift your body weight to the side, bending the knee of the lunging leg. Keep the opposite leg straight and toes pointing forward."
          },
          {
            "no": '3',
            "title": "Pushing Motion",
            "detail":
                "Push off the lunging foot to return to the starting position. Engage your inner thigh muscles during the pushing phase."
          },
          {
            "no": '4',
            "title": "Alternating Sides",
            "detail":
                "Perform side lunges alternately, focusing on proper form and control. Maintain an upright torso throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with adding dumbbells for resistance or incorporating a lateral raise. Adjust the depth of the lunge based on your flexibility."
          }
        ],
      },
      {
        // 12
        "descriprion": "sumo sqauts",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet wider than shoulder-width apart, toes pointing outward. Ensure a comfortable and stable stance for the sumo squat."
          },
          {
            "no": '2',
            "title": "Descending Phase",
            "detail":
                "Lower your body by bending at your hips and knees. Keep your chest up and back straight during the descent into the sumo squat."
          },
          {
            "no": '3',
            "title": "Full Range of Motion",
            "detail":
                "Lower your body until your thighs are parallel to the ground or as far as comfortably possible. Maintain a smooth and controlled descent."
          },
          {
            "no": '4',
            "title": "Ascending Phase",
            "detail":
                "Push through your heels to return to the starting position. Fully extend your hips and knees at the top of the sumo squat movement."
          }
        ],
      },
    ],
    // 6 th chest4
    [
      {
        // 1
        "descriprion": "bench",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on a flat bench with your back, shoulders, and buttocks in contact with the bench. Grip the barbell with hands slightly wider than shoulder-width."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Unrack the barbell and lower it to your chest, keeping elbows at a 90-degree angle. Press the barbell back to the starting position, fully extending your arms."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell with control, feeling a stretch in the chest. Avoid bouncing the bar off the chest and maintain stability throughout."
          },
          {
            "no": '4',
            "title": "Chest Engagement",
            "detail":
                "Emphasize the contraction in your chest muscles during the pressing phase. Focus on a smooth and controlled movement for optimal muscle activation."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different grip widths or use dumbbells for unilateral chest activation. Adjust weight based on your chest strength and overall fitness level."
          }
        ]
      },
      {
        // 2
        "descriprion": "push ups",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Form a plank position with hands placed slightly wider than shoulder-width. Keep your body straight from head to heels, engaging your core."
          },
          {
            "no": '2',
            "title": "Downward Phase",
            "detail":
                "Lower your body towards the ground by bending your elbows. Maintain a straight line and avoid sagging or arching during the descent."
          },
          {
            "no": '3',
            "title": "Upward Phase",
            "detail":
                "Push through your palms to extend your arms and return to the starting position. Engage your chest, shoulders, and triceps throughout the movement."
          },
          {
            "no": '4',
            "title": "Core Stability",
            "detail":
                "Keep your core tight to maintain stability during the exercise. Focus on a full range of motion and controlled movement for optimal results."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with hand positioning for varied muscle emphasis. Adjust difficulty by elevating your feet or adding a weighted vest."
          }
        ]
      },
      {
        // 3
        "descriprion": "dumbbell",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on a flat bench with a dumbbell in each hand, arms extended above your chest. Maintain a slight bend in the elbows and a neutral grip."
          },
          {
            "no": '2',
            "title": "Flye Motion",
            "detail":
                "Lower the dumbbells to your sides, keeping a slight bend in the elbows. Feel a stretch in your chest muscles during the descent."
          },
          {
            "no": '3',
            "title": "Pressing Phase",
            "detail":
                "Bring the dumbbells back to the starting position by squeezing your chest muscles. Fully extend your arms without locking the elbows."
          },
          {
            "no": '4',
            "title": "Chest Engagement",
            "detail":
                "Emphasize the contraction in your chest muscles during the flye motion. Focus on a controlled movement and avoid excessive swinging."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with an incline or decline bench for varied angles of chest activation. Adjust the weight based on your chest strength and comfort."
          }
        ]
      },
      {
        // 4
        "descriprion": "cable crossover",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand in the center of a cable machine with the pulleys set to the highest position. Hold a cable handle in each hand, arms extended to your sides."
          },
          {
            "no": '2',
            "title": "Crossing Motion",
            "detail":
                "Bring the cable handles towards the front, crossing them over each other. Feel a stretch in your chest muscles during the crossing motion."
          },
          {
            "no": '3',
            "title": "Return Phase",
            "detail":
                "Return the handles to the starting position by controlling the movement. Keep a slight bend in the elbows throughout the exercise."
          },
          {
            "no": '4',
            "title": "Chest Engagement",
            "detail":
                "Emphasize the contraction in your chest muscles during the crossing motion. Focus on a smooth and controlled movement for optimal results."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different cable heights and angles for varied chest activation. Adjust the weight based on your chest strength and overall fitness level."
          }
        ]
      },
      {
        // 5
        "descriprion": "incline",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on an inclined bench with your back, shoulders, and buttocks in contact. Grip the barbell with hands slightly wider than shoulder-width."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Unrack the barbell and lower it to your upper chest, keeping elbows at a 90-degree angle. Press the barbell back to the starting position, fully extending your arms."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell with control, feeling a stretch in the upper chest. Avoid bouncing the bar off the chest and maintain stability throughout."
          },
          {
            "no": '4',
            "title": "Chest Engagement",
            "detail":
                "Emphasize the contraction in your chest muscles during the pressing phase. Focus on a smooth and controlled movement for optimal muscle activation."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different incline angles for varied chest activation. Adjust weight based on your chest strength and overall fitness level."
          }
        ]
      },
      {
        // 6
        "descriprion": "chest",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Grab parallel bars with hands slightly wider than shoulder-width. Lift your body off the ground, arms fully extended, and lean slightly forward."
          },
          {
            "no": '2',
            "title": "Downward Phase",
            "detail":
                "Lower your body by bending your elbows, keeping them close to your body. Lower until your upper arms are parallel to the ground."
          },
          {
            "no": '3',
            "title": "Upward Phase",
            "detail":
                "Press your body back up to the starting position, fully extending your arms. Emphasize the contraction in the chest and triceps."
          },
          {
            "no": '4',
            "title": "Controlled Execution",
            "detail":
                "Execute each repetition with a slow and controlled motion. Avoid swinging or using momentum during the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different hand positions for varied chest and tricep activation. Adjust difficulty by adding weight or using an assisted dip machine."
          }
        ]
      },
      {
        // 7
        "descriprion": "chest press",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Adjust the chest press machine seat and handles to align with your chest. Sit with your back against the pad and grip the handles with a comfortable width."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Press the handles forward, extending your arms fully. Feel the contraction in your chest muscles during the pressing phase."
          },
          {
            "no": '3',
            "title": "Controlled Return",
            "detail":
                "Return the handles to the starting position with a controlled motion. Avoid slamming the handles back and maintain stability."
          },
          {
            "no": '4',
            "title": "Chest Engagement",
            "detail":
                "Emphasize the contraction in your chest muscles during the pressing phase. Focus on a smooth and controlled movement for optimal muscle activation."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different grip variations for varied chest activation. Adjust the weight based on your chest strength and overall fitness level."
          }
        ]
      },
      {
        // 8
        "descriprion": "pec deck",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Adjust the pec deck machine seat and arms to align with your chest. Sit with your back against the pad and place your forearms on the machine's pads."
          },
          {
            "no": '2',
            "title": "Chest Contraction",
            "detail":
                "Bring the machine's arms together in front of your chest, squeezing your pectoral muscles. Emphasize the contraction at the center of the motion."
          },
          {
            "no": '3',
            "title": "Controlled Return",
            "detail":
                "Return the machine's arms to the starting position with a controlled motion. Avoid rapid or jerky movements for optimal muscle engagement."
          },
          {
            "no": '4',
            "title": "Chest Engagement",
            "detail":
                "Emphasize the contraction in your chest muscles during the squeezing motion. Focus on maintaining stability and proper form throughout."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different grip positions for varied chest activation. Adjust the machine settings and weight based on your chest strength."
          }
        ]
      },
      {
        // 9
        "descriprion": "medicine ball",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand facing a partner or a wall with feet shoulder-width apart. Hold a medicine ball at chest level with both hands."
          },
          {
            "no": '2',
            "title": "Explosive Pass",
            "detail":
                "Explosively pass the medicine ball to your partner or against the wall, using your chest muscles. Keep a slight bend in your elbows during the pass."
          },
          {
            "no": '3',
            "title": "Chest Engagement",
            "detail":
                "Engage your chest muscles throughout the explosive pass. Emphasize the power generated from your chest for an effective workout."
          },
          {
            "no": '4',
            "title": "Partner Interaction",
            "detail":
                "Coordinate with your partner for a seamless exchange. Focus on a quick and explosive transfer of the medicine ball for maximum benefit."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different distances and weights of medicine balls for varied intensity. Ensure proper communication with your partner for safety."
          }
        ]
      },
      {
        // 10
        "descriprion": "plyome",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Assume a plank position with hands placed slightly wider than shoulder-width. Keep your body straight from head to heels, engaging your core."
          },
          {
            "no": '2',
            "title": "Explosive Push",
            "detail":
                "Perform a push-up, then explosively push your body off the ground. Aim to lift your hands off the floor before landing softly back in the starting position."
          },
          {
            "no": '3',
            "title": "Chest Activation",
            "detail":
                "Emphasize the explosive push for increased chest activation. Focus on a quick and powerful upward movement during each repetition."
          },
          {
            "no": '4',
            "title": "Controlled Landing",
            "detail":
                "Land softly and immediately move into the next push-up. Maintain control to reduce impact on joints and ensure a safe and effective workout."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with hand positioning and adjust the difficulty by elevating your hands. Incorporate plyometric push-ups for an added challenge to your chest workout."
          }
        ]
      },
      {
        // 11
        "descriprion": "decline",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on a decline bench with your back, shoulders, and buttocks in contact. Grip the barbell with hands slightly wider than shoulder-width."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Unrack the barbell and lower it to your lower chest, keeping elbows at a 90-degree angle. Press the barbell back to the starting position, fully extending your arms."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell with control, feeling a stretch in the lower chest. Avoid bouncing the bar off the chest and maintain stability throughout."
          },
          {
            "no": '4',
            "title": "Chest Engagement",
            "detail":
                "Emphasize the contraction in your chest muscles during the pressing phase. Focus on a smooth and controlled movement for optimal muscle activation."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different decline angles for varied chest activation. Adjust weight based on your chest strength and overall fitness level."
          }
        ]
      },
      {
        // 12
        "descriprion": "squeeze",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on a bench with dumbbells in hand, palms facing each other. Position the dumbbells close together, creating resistance between them."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Press the dumbbells upward, squeezing them together throughout the movement. Focus on chest engagement and controlled pressing."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells back to the starting position, maintaining the squeeze. Avoid letting the dumbbells separate during the descent."
          },
          {
            "no": '4',
            "title": "Pectoral Contraction",
            "detail":
                "Emphasize the contraction in your pectoral muscles during the pressing motion. Keep consistent tension on the chest for optimal muscle activation."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different angles or use resistance bands for varied chest stimulation. Adjust the weight based on your chest strength and fitness level."
          }
        ]
      },
    ],
    // 7 th shoulder
    [
      {
        // 01
        "descriprion": "over head",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding a barbell at shoulder height. Ensure a firm grip with palms facing forward and elbows slightly in front of the body."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Press the barbell overhead, fully extending your arms. Keep the core engaged and maintain a neutral spine throughout the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell back to shoulder height with control. Avoid arching the lower back and ensure a controlled descent."
          },
          {
            "no": '4',
            "title": "Shoulder Engagement",
            "detail":
                "Emphasize the engagement of the shoulder muscles during both the upward and downward phases. Focus on a smooth, controlled press."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with a seated position or use dumbbells for unilateral shoulder work. Adjust the weight based on your shoulder strength and goals."
          }
        ]
      },
      {
        // 02
        "descriprion": "lateral raises",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding dumbbells at your sides. Maintain a slight bend in your elbows with palms facing your body."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift the dumbbells to the sides until your arms are parallel to the ground. Keep a slight bend in the elbows and avoid excessive swinging."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells back to the starting position with control. Resist the urge to drop the weights and maintain tension in the shoulders."
          },
          {
            "no": '4',
            "title": "Lateral Shoulder Activation",
            "detail":
                "Emphasize the activation of the lateral deltoids during the lifting phase. Keep the core engaged for stability throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with cable lateral raises or perform the exercise seated for variation. Adjust the weight to challenge your lateral shoulder muscles effectively."
          }
        ]
      },
      {
        // 03
        "descriprion": "front rasises",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding dumbbells in front of your thighs. Ensure a slight bend in your elbows with palms facing your body."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift the dumbbells to the front until your arms are parallel to the ground. Keep a controlled and deliberate motion throughout the lift."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells back to the starting position with control. Resist the urge to drop the weights and maintain tension in the front deltoids."
          },
          {
            "no": '4',
            "title": "Front Shoulder Activation",
            "detail":
                "Emphasize the activation of the front deltoids during the lifting phase. Keep the core engaged for stability throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with alternating front raises or perform the exercise seated for variation. Adjust the weight to challenge your front shoulder muscles effectively."
          }
        ]
      },
      {
        // 04
        "descriprion": "shrugs",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding dumbbells or a barbell at your sides. Keep a slight bend in your elbows with palms facing your body."
          },
          {
            "no": '2',
            "title": "Elevating Motion",
            "detail":
                "Elevate your shoulders toward your ears in a controlled motion. Avoid rolling your shoulders forward or backward during the lift."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower your shoulders back to the starting position with control. Maintain tension in the trapezius muscles throughout the exercise."
          },
          {
            "no": '4',
            "title": "Trapezius Activation",
            "detail":
                "Emphasize the activation of the trapezius muscles during the lifting phase. Keep the core engaged for stability throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with barbell or dumbbell shrugs and adjust the weight to challenge your trapezius muscles effectively. Focus on a controlled and deliberate motion."
          }
        ]
      },
      {
        // 05
        "descriprion": "upright rows",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding a barbell or dumbbells in front of your thighs. Ensure a slight bend in your elbows with palms facing your body."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift the barbell or dumbbells towards your chin, keeping them close to your body. Lead with your elbows and avoid excessive shoulder rotation."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell or dumbbells back to the starting position with control. Resist the urge to drop the weight and maintain tension in the shoulders."
          },
          {
            "no": '4',
            "title": "Shoulder Activation",
            "detail":
                "Emphasize the activation of the lateral deltoids and traps during the lifting phase. Keep the core engaged for stability throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different hand grips or use a cable machine for variation. Adjust the weight to challenge your shoulder muscles effectively."
          }
        ]
      },
      {
        // 06
        "descriprion": "face pulls",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Set up a cable machine with a rope attachment at face level. Stand with feet shoulder-width apart and hold the rope with an overhand grip."
          },
          {
            "no": '2',
            "title": "Pulling Motion",
            "detail":
                "Pull the rope towards your face, keeping your upper arms parallel to the ground. Focus on squeezing your rear deltoids and upper traps."
          },
          {
            "no": '3',
            "title": "Controlled Return",
            "detail":
                "Return the rope to the starting position with control. Resist the urge to let the weight pull your arms backward and maintain proper form."
          },
          {
            "no": '4',
            "title": "Rear Deltoid Activation",
            "detail":
                "Emphasize the activation of the rear deltoids during the pulling phase. Keep the core engaged for stability throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the cable height or experiment with different grip variations. Focus on a controlled and deliberate motion to effectively target the rear delts."
          }
        ]
      },
      {
        // 07
        "descriprion": "revrese flyes",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding dumbbells in front of your thighs. Ensure a slight bend in your elbows with palms facing each other."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift the dumbbells to the sides until your arms are parallel to the ground. Keep a slight bend in the elbows and avoid excessive swinging."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells back to the starting position with control. Resist the urge to drop the weights and maintain tension in the rear deltoids."
          },
          {
            "no": '4',
            "title": "Rear Deltoid Activation",
            "detail":
                "Emphasize the activation of the rear deltoids during the lifting phase. Keep the core engaged for stability throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with a bent-over position or perform the exercise on an incline bench for variation. Adjust the weight to challenge your rear deltoids effectively."
          }
        ]
      },
      {
        // 08
        "descriprion": "seared",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit on a bench with a dumbbell in each hand, palms facing forward. Ensure a stable grip and keep your back straight against the bench."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Press the dumbbells overhead, fully extending your arms. Keep the core engaged and maintain a neutral spine throughout the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells back to shoulder height with control. Avoid arching the lower back and ensure a controlled descent."
          },
          {
            "no": '4',
            "title": "Shoulder Engagement",
            "detail":
                "Emphasize the engagement of the shoulder muscles during both the upward and downward phases. Focus on a smooth, controlled press."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with an incline or decline bench for varied muscle activation. Adjust the weight based on your shoulder strength and goals."
          }
        ]
      },
      {
        // 09
        "descriprion": "arnold press",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit or stand with a dumbbell in each hand, palms facing your body. Begin with the dumbbells at shoulder height and elbows bent."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Press the dumbbells overhead while simultaneously rotating your palms to face forward. Extend your arms fully at the top of the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells back to shoulder height with control. Maintain a controlled motion throughout the lowering phase."
          },
          {
            "no": '4',
            "title": "Shoulder and Rotator Cuff Activation",
            "detail":
                "Emphasize the activation of the shoulder muscles and rotator cuffs during the pressing and rotating phases. Focus on a smooth, controlled press."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the angle of rotation or experiment with alternating Arnold presses. Modify the weight to challenge your shoulder muscles effectively."
          }
        ]
      },
      {
        // 10
        "descriprion": "lateral dubb",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding dumbbells at your sides. Maintain a slight bend in your elbows with palms facing your body."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift the dumbbells to the sides until your arms are parallel to the ground. Keep a slight bend in the elbows and avoid excessive swinging."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells back to the starting position with control. Resist the urge to drop the weights and maintain tension in the lateral deltoids."
          },
          {
            "no": '4',
            "title": "Lateral Shoulder Activation",
            "detail":
                "Emphasize the activation of the lateral deltoids during the lifting phase. Keep the core engaged for stability throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with cable lateral raises or perform the exercise seated for variation. Adjust the weight to challenge your lateral shoulder muscles effectively."
          }
        ]
      },
      {
        // 11
        "descriprion": "barbell sou",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit or stand with a barbell in front of you, palms facing forward, and grip slightly wider than shoulder-width. Lift the barbell to shoulder height."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Press the barbell overhead, fully extending your arms. Keep the core engaged and maintain a neutral spine throughout the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell back to shoulder height with control. Avoid arching the lower back and ensure a controlled descent."
          },
          {
            "no": '4',
            "title": "Shoulder Engagement",
            "detail":
                "Emphasize the engagement of the shoulder muscles during both the upward and downward phases. Focus on a smooth, controlled press."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the grip width or experiment with a Smith machine for varied muscle activation. Adjust the weight based on your shoulder strength and goals."
          }
        ]
      },
      {
        // 12
        "descriprion": "curban",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Begin in the side plank position with your elbow beneath your shoulder. Stack your legs and engage your core for stability."
          },
          {
            "no": '2',
            "title": "Lift and Rotate",
            "detail":
                "Lift your free arm toward the ceiling, then rotate it downward, threading it beneath your torso. Keep your core engaged throughout."
          },
          {
            "no": '3',
            "title": "Return to Starting",
            "detail":
                "Reverse the rotation, lifting your arm back toward the ceiling. Return to the starting position with control, maintaining balance."
          },
          {
            "no": '4',
            "title": "Repetitions",
            "detail":
                "Perform the Cuban Press for a specific number of repetitions on one side before switching. Focus on smooth, controlled movements."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with adding a lightweight dumbbell for increased resistance. Adjust the difficulty based on your strength and stability levels."
          }
        ]
      },
    ],
    // 8 th workout -abs
    [
      {
        // 01
        "descriprion":
            "Bicep Curls are a fundamental exercise for isolating and developing the biceps brachii muscles. Stand with a dumbbell in each hand, arms fully extended, and curl the weights towards your shoulders. The controlled motion, emphasizing the contraction at the top, effectively targets the biceps. Bicep Curls are versatile and can be performed with various grips, allowing for comprehensive bicep development.",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with a dumbbell in each hand, arms fully extended, and palms facing forward. Maintain a stable stance with feet shoulder-width apart."
          },
          {
            "no": '2',
            "title": "Curling Motion",
            "detail":
                "Curl the dumbbells towards your shoulders, keeping your upper arms stationary. Squeeze your biceps at the top of the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells back to the starting position with a controlled motion. Avoid swinging or using momentum."
          },
          {
            "no": '4',
            "title": "Neutral Grip Variation",
            "detail":
                "Experiment with a neutral grip (palms facing each other) for brachialis engagement. Ensure a full range of motion for maximum bicep activation."
          },
          {
            "no": '5',
            "title": "Alternating Arm Focus",
            "detail":
                "Consider performing alternating bicep curls to enhance muscle balance. This variation also helps prevent potential muscle imbalances."
          }
        ]
      },
      {
        // 02
        "descriprion":
            "Tricep Dips are a bodyweight exercise that focuses on isolating the triceps brachii. Position yourself on parallel bars or a stable surface, lower your body by bending your elbows, and then press back up. Tricep Dips effectively engage and strengthen the triceps while also working the chest and shoulders. Proper form, with elbows close to the body, is crucial for maximizing tricep activation.",

        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit on parallel bars or a stable surface with hands gripping the edges. Keep your legs extended or bent, depending on your fitness level."
          },
          {
            "no": '2',
            "title": "Lowering Phase",
            "detail":
                "Lower your body by bending your elbows, ensuring they stay close to your body. Lower until your upper arms are parallel to the ground."
          },
          {
            "no": '3',
            "title": "Pressing Phase",
            "detail":
                "Press your body back up to the starting position, fully extending your arms. Emphasize the contraction in the triceps."
          },
          {
            "no": '4',
            "title": "Elbow Positioning",
            "detail":
                "Maintain proper elbow positioning for effective tricep isolation. Avoid excessive flaring or strain on the shoulder joints."
          },
          {
            "no": '5',
            "title": "Variation Intensity",
            "detail":
                "Adjust intensity by altering hand positioning or elevating your feet. Experiment with different angles for targeted tricep engagement."
          }
        ]
      },
      {
        // 03
        "descriprion":
            "Hammer Curls target the brachialis and forearms. Hold a dumbbell in each hand with palms facing your torso, and curl the weights towards your shoulders. The neutral grip emphasizes the brachialis, contributing to well-rounded arm development. Hammer Curls offer a variation to traditional bicep exercises, promoting balanced muscle engagement.",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Hold a dumbbell in each hand with palms facing your torso. Stand with a stable stance, shoulders relaxed."
          },
          {
            "no": '2',
            "title": "Curling Motion",
            "detail":
                "Curl the dumbbells towards your shoulders with a neutral grip. Keep your elbows close to your body throughout the movement."
          },
          {
            "no": '3',
            "title": "Forearm Emphasis",
            "detail":
                "Emphasize the contraction in your forearms during the curl. This grip variation targets the brachialis, contributing to well-rounded arm development."
          },
          {
            "no": '4',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells with control to the starting position. Avoid rapid or jerky movements."
          },
          {
            "no": '5',
            "title": "Alternating Arm Focus",
            "detail":
                "Perform hammer curls alternately for balanced development. Focus on maintaining symmetry in both arms."
          }
        ]
      },
      {
        // 04
        "descriprion":
            "Skull Crushers, or lying tricep extensions, target the long head of the triceps. Lie on a bench, hold a barbell or dumbbells overhead, and lower the weights towards your forehead. The controlled descent and extension engage the triceps effectively. Skull Crushers are valuable for isolating the triceps while lying on a stable surface.",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on a bench with a barbell or dumbbells held overhead. Ensure a stable grip and a neutral wrist position."
          },
          {
            "no": '2',
            "title": "Lowering Phase",
            "detail":
                "Lower the weights towards your forehead, emphasizing the tricep stretch. Keep upper arms perpendicular to the ground."
          },
          {
            "no": '3',
            "title": "Pressing Phase",
            "detail":
                "Extend your arms, returning the weights to the starting position. Focus on engaging the tricep long head."
          },
          {
            "no": '4',
            "title": "Controlled Execution",
            "detail":
                "Execute each repetition with a slow and controlled motion. Avoid locking the elbows at the top of the movement."
          },
          {
            "no": '5',
            "title": "Alternatives",
            "detail":
                "Experiment with different grip variations for varied tricep activation. Use an EZ-bar for added comfort during the exercise."
          }
        ]
      },
      {
        // 05
        "descriprion":
            "Preacher Curls are performed on a preacher bench, isolating the biceps. Position your upper arms on the angled pad, grip a barbell or dumbbells, and curl the weights towards your shoulders. The preacher bench eliminates momentum, ensuring strict bicep engagement. Preacher Curls contribute to peak bicep development and form a crucial part of comprehensive bicep training.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Position yourself on a preacher bench with upper arms resting on the pad. Hold a barbell or dumbbells with palms facing up."
          },
          {
            "no": '2',
            "title": "Curling Motion",
            "detail":
                "Curl the weights towards your shoulders, focusing on bicep contraction. The preacher bench minimizes swinging and momentum."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the weights in a controlled manner to the starting position. Ensure a full range of motion for optimal muscle engagement."
          },
          {
            "no": '4',
            "title": "Peak Bicep Emphasis",
            "detail":
                "Emphasize the peak contraction at the top of each repetition. This targets the upper portion of the biceps."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different grip widths for varied bicep emphasis. Use dumbbells for unilateral bicep isolation."
          }
        ]
      },
      {
        // 06
        "descriprion":
            "Tricep Kickbacks isolate the triceps by extending the arm fully. Hold a dumbbell in each hand, hinge at the hips, and extend your arms backward. The controlled motion targets the triceps effectively. Tricep Kickbacks are beneficial for toning and strengthening the back of the arms.",

        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Hold a dumbbell in each hand, hinge at the hips, and keep a flat back. Fully extend your arms backward."
          },
          {
            "no": '2',
            "title": "Kickback Motion",
            "detail":
                "Kick the dumbbells backward, fully extending your arms. Emphasize the tricep contraction at the top of the movement."
          },
          {
            "no": '3',
            "title": "Controlled Return",
            "detail":
                "Return the weights to the starting position with control. Avoid swinging the arms or using momentum."
          },
          {
            "no": '4',
            "title": "Elbow Positioning",
            "detail":
                "Keep your elbows close to your body throughout the exercise. This ensures targeted tricep activation."
          },
          {
            "no": '5',
            "title": "Variation Intensity",
            "detail":
                "Adjust intensity by varying the weight and repetitions. Incorporate tricep kickbacks for definition in your tricep routine."
          }
        ]
      },
      {
        // 07
        "descriprion":
            "Concentration Curls emphasize isolating the biceps through a seated or standing position. Sit or stand with a dumbbell in one hand, elbow braced against the inner thigh, and curl the weight towards the shoulder. This concentrated movement enhances bicep activation, aiding in peak development.",

        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit or stand with a dumbbell in one hand, elbow braced against the inner thigh. Keep the non-working arm on your opposite knee for support."
          },
          {
            "no": '2',
            "title": "Curling Motion",
            "detail":
                "Curl the dumbbell towards your shoulder, isolating the bicep. Maintain a stable position to prevent body movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbell back down to the starting position. Control the movement to maximize bicep engagement."
          },
          {
            "no": '4',
            "title": "Peak Contraction",
            "detail":
                "Emphasize the peak contraction at the top of the curl. This targets the full length of the bicep."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Use different grips or dumbbell variations for diversity. Focus on maintaining strict form for effective concentration curls."
          }
        ]
      },
      {
        // 08
        "descriprion":
            "Diamond Push-ups are a bodyweight exercise that places emphasis on the triceps and inner chest. Form a diamond shape with your hands beneath your chest, lower your body, and push back up. This variation intensifies tricep engagement while also targeting the pectoral muscles.",

        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Form a diamond shape with your hands beneath your chest. Maintain a plank position with your body straight from head to heels."
          },
          {
            "no": '2',
            "title": "Downward Phase",
            "detail":
                "Lower your body towards the ground by bending your elbows. Keep your elbows close to your body for tricep emphasis."
          },
          {
            "no": '3',
            "title": "Upward Phase",
            "detail":
                "Push through your palms to extend your arms and return to the starting position. Engage your triceps and inner chest throughout the movement."
          },
          {
            "no": '4',
            "title": "Core Stability",
            "detail":
                "Keep your core tight to maintain stability during the exercise. Avoid sagging or arching."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with hand positioning for varied muscle emphasis. Adjust difficulty by elevating your feet or adding a weighted vest."
          }
        ]
      },
      {
        // 09
        "descriprion":
            "Barbell Curls are a foundational bicep exercise. Stand with a barbell in hand, arms fully extended, and curl the bar towards your shoulders. This compound movement engages the biceps, forearms, and stabilizing muscles. Barbell Curls are effective for overall bicep strength and mass development.",

        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with a barbell in hand, arms fully extended, and palms facing forward. Maintain a hip-width stance for stability."
          },
          {
            "no": '2',
            "title": "Curling Motion",
            "detail":
                "Curl the barbell towards your shoulders, keeping your upper arms stationary. Squeeze your biceps at the top of the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell back to the starting position with a controlled motion. Avoid swinging or using momentum."
          },
          {
            "no": '4',
            "title": "Neutral Grip Variation",
            "detail":
                "Experiment with a narrow or wide grip for varied bicep engagement. Ensure a full range of motion for optimal muscle activation."
          },
          {
            "no": '5',
            "title": "Alternating Arm Focus",
            "detail":
                "Consider performing alternating barbell curls to enhance muscle balance. This variation helps prevent potential muscle imbalances."
          }
        ]
      },
      {
        // 10
        "descriprion":
            "Overhead Tricep Extension targets the triceps through an overhead movement. Hold a dumbbell or barbell overhead and lower it behind your head. The extension motion effectively engages the triceps' long head, contributing to overall tricep development.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Hold a dumbbell or barbell overhead with both hands, arms fully extended. Ensure a stable grip and a neutral wrist position."
          },
          {
            "no": '2',
            "title": "Lowering Phase",
            "detail":
                "Lower the weight behind your head, bending at the elbows. Feel a stretch in the triceps while maintaining upper arms perpendicular to the ground."
          },
          {
            "no": '3',
            "title": "Pressing Phase",
            "detail":
                "Extend your arms, returning the weight to the starting position. Emphasize the tricep contraction at the top of each repetition."
          },
          {
            "no": '4',
            "title": "Controlled Execution",
            "detail":
                "Execute each repetition with a slow and controlled motion. Avoid locking the elbows at the top of the movement."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different grip variations or use an EZ-bar for comfort. Adjust weight and repetitions based on your tricep strength."
          }
        ]
      },
      {
        // 11
        "descriprion":
            "Cable Hammer Curls involve a cable machine, emphasizing the brachialis and brachioradialis. Stand with a cable in each hand, palms facing each other, and curl the handles towards your shoulders. Cable resistance provides constant tension, promoting muscle engagement throughout the range of motion.",

        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with a cable in each hand, palms facing each other. Position yourself at a cable machine with the pulleys set at a low position."
          },
          {
            "no": '2',
            "title": "Curling Motion",
            "detail":
                "Curl the handles towards your shoulders, keeping your upper arms stationary. Maintain a neutral grip for emphasis on the brachialis."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the handles with control to the starting position. Avoid rapid or jerky movements for optimal muscle engagement."
          },
          {
            "no": '4',
            "title": "Brachialis Emphasis",
            "detail":
                "Emphasize the contraction in the brachialis during the curl. This variation contributes to overall arm development and symmetry."
          },
          {
            "no": '5',
            "title": "Alternating Arm Focus",
            "detail":
                "Perform cable hammer curls alternately to enhance muscle balance. Focus on maintaining symmetry and stability in both arms."
          }
        ]
      },
      {
        // 12
        "descriprion":
            "Close Grip Bench Press is a compound exercise that targets the triceps, inner chest, and shoulders. Perform a bench press with a narrow grip, keeping hands closer together. This variation shifts emphasis to the triceps, aiding in their strength and development. Proper form is crucial for maximizing tricep activation and safety.",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Lie on a bench with a barbell gripped with hands closer together than shoulder-width. Ensure a secure grip and a stable bench position."
          },
          {
            "no": '2',
            "title": "Pressing Motion",
            "detail":
                "Press the barbell upward, fully extending your arms. Emphasize the triceps during the upward phase of the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell with control to the chest, feeling a stretch in the triceps. Keep elbows close to the body for effective tricep engagement."
          },
          {
            "no": '4',
            "title": "Tricep Emphasis",
            "detail":
                "Focus on the contraction in the triceps throughout the movement. This variation shifts emphasis to the triceps for targeted strength development."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different grip widths or use an EZ-bar for comfort. Adjust weight based on your tricep strength and overall fitness level."
          }
        ]
      },
    ],
    // 9-  back workout
    [
      {
        // 01
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit on the lat pulldown machine with your knees secured under the pads. Grab the bar with a wide overhand grip, arms fully extended."
          },
          {
            "no": '2',
            "title": "Pulling Motion",
            "detail":
                "Pull the bar down towards your chest, squeezing your shoulder blades together. Keep your back straight and engage your lat muscles."
          },
          {
            "no": '3',
            "title": "Controlled Release",
            "detail":
                "Slowly release the bar back to the starting position with controlled movements. Avoid rapid or jerky motions for optimal muscle engagement."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different grip variations or handle attachments. Adjust the weight based on your lat strength and overall fitness level."
          }
        ]
      },
      {
        // 02
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart, holding a barbell with an overhand grip. Hinge at your hips, keeping your back straight and chest up."
          },
          {
            "no": '2',
            "title": "Pulling Motion",
            "detail":
                "Pull the barbell towards your lower chest, keeping elbows close to your body. Squeeze your back muscles at the top of the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell back to the starting position with a controlled motion. Maintain tension in your back muscles throughout the exercise."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Explore different grip widths or use dumbbells for unilateral rowing. Adjust weight based on your back strength and workout goals."
          }
        ]
      },
      {
        // 03
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Straddle the T-bar machine with a loaded barbell in front of you. Grip the handles with both hands, maintaining a flat back and bent knees."
          },
          {
            "no": '2',
            "title": "Pulling Motion",
            "detail":
                "Pull the barbell towards your chest, retracting your shoulder blades. Keep your back straight and engage your upper back muscles."
          },
          {
            "no": '3',
            "title": "Controlled Release",
            "detail":
                "Lower the barbell back to the starting position with control. Avoid letting the weight drop rapidly for sustained muscle tension."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different grip variations or use a V-bar attachment. Adjust the weight based on your upper back strength and workout objectives."
          }
        ]
      },
      {
        // 04
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Hang from a pull-up bar with hands slightly wider than shoulder-width apart. Keep your body straight, legs together, and engage your core."
          },
          {
            "no": '2',
            "title": "Pulling Motion",
            "detail":
                "Pull your body upward, leading with your chest and squeezing your shoulder blades. Aim to bring your chin above the bar."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower your body back to the starting position with a controlled motion. Maintain tension in your back and arms throughout the movement."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different hand grips or use resistance bands for assistance. Adjust difficulty by adding weight or modifying hand positioning."
          }
        ]
      },
      {
        // 05
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet hip-width apart, toes under the barbell. Grip the barbell with hands shoulder-width apart, keeping a neutral spine."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Push through your heels, lift the barbell by extending your hips and knees. Keep the bar close to your body throughout the lift."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the barbell back to the ground with a controlled motion. Maintain a straight back and hinge at the hips and knees simultaneously."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Explore different deadlift variations like sumo or Romanian. Adjust weight based on your strength level and focus on proper form."
          }
        ]
      },
      {
        // 06
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Attach a rope to a cable machine at head height. Stand facing the machine, grab the rope with both hands, and step back to create tension."
          },
          {
            "no": '2',
            "title": "Pulling Motion",
            "detail":
                "Pull the rope towards your face, retracting your shoulder blades. Keep your elbows high and upper arms parallel to the ground."
          },
          {
            "no": '3',
            "title": "Controlled Release",
            "detail":
                "Release the rope back to the starting position with control. Focus on squeezing your rear deltoids and upper traps during the movement."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different attachment handles or use a straight bar. Adjust weight based on your shoulder strength and workout preferences."
          }
        ]
      },
      {
        // 07
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit at a cable row machine, feet flat on the platform, and knees slightly bent. Grab the handle with a neutral grip, arms fully extended."
          },
          {
            "no": '2',
            "title": "Pulling Motion",
            "detail":
                "Pull the handle towards your torso, retracting your shoulder blades. Keep your back straight and engage your middle back muscles."
          },
          {
            "no": '3',
            "title": "Controlled Release",
            "detail":
                "Extend your arms back to the starting position with controlled movements. Avoid rounding your back and maintain a stable seated position."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different grip attachments or hand positions. Adjust the weight based on your back strength and training objectives."
          }
        ]
      },
      {
        // 08
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with one knee and one hand on a bench, opposite leg extended. Hold a dumbbell in the free hand, allowing it to hang straight down."
          },
          {
            "no": '2',
            "title": "Pulling Motion",
            "detail":
                "Pull the dumbbell towards your hip, retracting your shoulder blade. Keep your back straight and engage your lat muscles."
          },
          {
            "no": '3',
            "title": "Controlled Release",
            "detail":
                "Lower the dumbbell back to the starting position with control. Avoid excessive rotation and maintain stability on the supporting arm."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different bench heights or use an incline bench. Adjust the weight based on your back strength and training goals."
          }
        ]
      },
      {
        // 09
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Sit at a cable row machine with feet secured on the platform. Grab the handle with an overhand grip, arms fully extended in front of you."
          },
          {
            "no": '2',
            "title": "Pulling Motion",
            "detail":
                "Pull the handle towards your torso, retracting your shoulder blades. Keep your back straight and engage your middle back muscles."
          },
          {
            "no": '3',
            "title": "Controlled Release",
            "detail":
                "Extend your arms back to the starting position with controlled movements. Maintain proper posture and avoid using excessive body momentum."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different grip attachments or hand positions. Adjust the weight based on your back strength and workout preferences."
          }
        ]
      },
      {
        // 10
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Position yourself face down on a hyperextension bench, with your hips at the edge. Cross your arms in front of you or place them behind your head."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift your upper body by extending your hips, engaging your lower back muscles. Maintain a straight line from your head to heels throughout."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower your upper body back to the starting position with control. Avoid hyperextension and focus on using your lower back muscles."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different hand positions or use additional resistance. Adjust the intensity based on your lower back strength and fitness level."
          }
        ]
      },
      {
        // 11
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand or sit with a dumbbell in each hand, palms facing each other. Bend at your hips, keeping a slight bend in your elbows."
          },
          {
            "no": '2',
            "title": "Lifting Motion",
            "detail":
                "Lift your arms to the sides until they are parallel to the ground. Squeeze your shoulder blades together at the top of the movement."
          },
          {
            "no": '3',
            "title": "Controlled Descent",
            "detail":
                "Lower the dumbbells back to the starting position with controlled movements. Maintain a stable posture throughout the exercise."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different angles or use cables for resistance. Adjust the weight based on your rear deltoid strength and workout objectives."
          }
        ]
      },
      {
        // 12
        "descriprion": ".",
        "no": [
          // steps here
          {
            "no": '1',
            "title": "Conventional Deadlift",
            "detail":
                "Perform the standard deadlift with feet hip-width apart and hands gripping the barbell outside the knees. Focus on a neutral spine throughout the lift."
          },
          {
            "no": '2',
            "title": "Sumo Deadlift",
            "detail":
                "Widen your stance with toes pointing outward, and grip the barbell between your legs. This variation emphasizes the inner thighs and lower back."
          },
          {
            "no": '3',
            "title": "Romanian Deadlift",
            "detail":
                "Maintain a slight bend in the knees while hinging at the hips. Lower the barbell along your shins, keeping the back straight. Focus on hamstring engagement."
          },
          {
            "no": '4',
            "title": "Trap Bar Deadlift",
            "detail":
                "Use a trap or hex bar for a neutral grip deadlift. This variation is often more comfortable on the lower back and engages the quadriceps and glutes."
          },
          {
            "no": '5',
            "title": "Stiff-Legged Deadlift",
            "detail":
                "Perform the deadlift with straight legs and a slight bend at the hips. Keep the barbell close to your body, emphasizing the stretch in the hamstrings."
          }
        ]
      },
    ],
    // 10 - plyometric exericse
    [
      {
        // 01
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand in front of a sturdy box with feet hip-width apart. Maintain an athletic stance with knees slightly bent and arms at your sides."
          },
          {
            "no": '2',
            "title": "Jumping Motion",
            "detail":
                "Jump onto the box, landing softly with both feet. Ensure a stable landing and stand fully upright on the box."
          },
          {
            "no": '3',
            "title": "Box Landing",
            "detail":
                "Step back down from the box with control. Land softly on the ground, bending your knees to absorb the impact."
          },
          {
            "no": '4',
            "title": "Repetition",
            "detail":
                "Perform the desired number of repetitions, focusing on explosive power during each jump. Adjust box height based on your fitness level."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different box heights and jump techniques. Incorporate box jumps into circuit training for a dynamic workout."
          }
        ]
      },
      {
        // 02
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet together and step one foot forward into a lunge position. Ensure both knees are bent at a 90-degree angle."
          },
          {
            "no": '2',
            "title": "Jumping Motion",
            "detail":
                "Jump explosively, switching the position of your feet in mid-air. Land in a lunge position with the opposite foot forward."
          },
          {
            "no": '3',
            "title": "Continuous Lunges",
            "detail":
                "Continue jumping and alternating legs with each repetition. Keep a steady and controlled rhythm throughout the exercise."
          },
          {
            "no": '4',
            "title": "Balance and Control",
            "detail":
                "Maintain balance and control during each jump, ensuring proper alignment of the knees and ankles. Engage your core for stability."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the depth of your lunges and increase speed for added intensity. Incorporate jumping lunges into HIIT routines for cardiovascular benefits."
          }
        ]
      },
      {
        // 03
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Assume a standard push-up position with hands slightly wider than shoulder-width apart. Ensure a straight line from head to heels."
          },
          {
            "no": '2',
            "title": "Explosive Push-up",
            "detail":
                "Lower your body towards the ground in a controlled manner. Push off the ground explosively, allowing your hands to leave the surface."
          },
          {
            "no": '3',
            "title": "Mid-Air Clap",
            "detail":
                "Perform a mid-air clap by bringing your hands together before landing. Land with soft elbows to absorb the impact."
          },
          {
            "no": '4',
            "title": "Continuous Repetitions",
            "detail":
                "Continue performing plyometric push-ups with a quick and explosive rhythm. Focus on maintaining proper form and alignment."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different hand positions and increase the speed for added intensity. Incorporate plyometric push-ups into upper body workouts."
          }
        ]
      },
      {
        // 04
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet hip-width apart and arms at your sides. Lower into a squat position, placing your hands on the ground."
          },
          {
            "no": '2',
            "title": "Jumping Motion",
            "detail":
                "Jump both feet back, landing in a plank position. Perform a push-up, then immediately jump your feet towards your hands."
          },
          {
            "no": '3',
            "title": "Vertical Jump",
            "detail":
                "Explode into a vertical jump, reaching towards the ceiling. Land softly and transition into the next repetition."
          },
          {
            "no": '4',
            "title": "Continuous Flow",
            "detail":
                "Perform burpees in a continuous and fluid motion, maintaining a steady pace. Focus on engaging the core throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Modify the intensity by adjusting the speed and adding a push-up. Burpees are an excellent full-body exercise suitable for HIIT workouts."
          }
        ]
      },
      {
        // 05
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart and arms at your sides. Lower into a squat position, keeping your back straight and chest lifted."
          },
          {
            "no": '2',
            "title": "Jumping Motion",
            "detail":
                "Explosively jump straight up, reaching towards the ceiling. Extend your hips and knees fully during the jump."
          },
          {
            "no": '3',
            "title": "Squat Landing",
            "detail":
                "Land softly, bending your knees to absorb the impact. Transition immediately into the next squat and jump sequence."
          },
          {
            "no": '4',
            "title": "Continuous Repetitions",
            "detail":
                "Perform jump squats in a continuous and rhythmic manner. Focus on maintaining proper squat form and controlled landings."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the depth of your squat and increase the speed for added intensity. Incorporate jump squats into lower body or full-body workouts."
          }
        ]
      },
      {
        // 06
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Holding the Medicine Ball",
            "detail":
                "Stand with feet shoulder-width apart, holding a medicine ball overhead. Ensure a firm grip on the ball with both hands."
          },
          {
            "no": '2',
            "title": "Forceful Slam",
            "detail":
                "Slam the ball forcefully to the ground. Engage your core and use your entire body for a powerful and dynamic slam."
          },
          {
            "no": '3',
            "title": "Catching the Rebound",
            "detail":
                "Catch the ball on the bounce or after it rebounds. Maintain readiness for the next slam by staying in an athletic stance."
          },
          {
            "no": '4',
            "title": "Maintaining Core Engagement",
            "detail":
                "Maintain a strong core throughout the slamming motion. Control the ball with your entire body, avoiding excessive strain on the lower back."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different ball weights and surfaces for varied resistance. Medicine ball slams are excellent for building explosive power."
          }
        ]
      },
      {
        // 07
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Proper Grip",
            "detail":
                "Hold the handles of the jump rope with a comfortable grip. Ensure the rope is of appropriate length, allowing for efficient rotation."
          },
          {
            "no": '2',
            "title": "Basic Jumping Motion",
            "detail":
                "Rotate the jump rope using your wrists, allowing it to pass beneath your feet. Jump over the rope with both feet together."
          },
          {
            "no": '3',
            "title": "Consistent Rhythm",
            "detail":
                "Maintain a consistent rhythm as you continue jumping. Land softly on the balls of your feet, minimizing impact on joints."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with different jump rope techniques, such as double-unders or alternating feet. Jump rope is an effective cardiovascular exercise."
          },
          {
            "no": '5',
            "title": "Duration and Intensity",
            "detail":
                "Gradually increase the duration and intensity of your jump rope sessions. It's an excellent full-body workout suitable for warm-ups or intense cardio."
          }
        ]
      },
      {
        // 08
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet together and arms at your sides. Maintain an upright posture with shoulders relaxed."
          },
          {
            "no": '2',
            "title": "Jumping Motion",
            "detail":
                "Simultaneously jump your feet out to the sides and raise your arms overhead. Keep the movement controlled and rhythmical."
          },
          {
            "no": '3',
            "title": "Return to Starting Position",
            "detail":
                "Jump your feet back together and lower your arms to the sides. Ensure a smooth and coordinated motion throughout the exercise."
          },
          {
            "no": '4',
            "title": "Continuous Flow",
            "detail":
                "Perform jumping jacks in a continuous and fluid motion. Focus on engaging your core and maintaining a steady pace."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the speed and intensity of jumping jacks based on your fitness level. Incorporate them into warm-up routines or cardiovascular workouts."
          }
        ]
      },
      {
        // 09
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet hip-width apart and arms at your sides. Lift one knee towards your chest, alternating rapidly with the other knee."
          },
          {
            "no": '2',
            "title": "Rapid Knee Lifts",
            "detail":
                "Engage your core and lift your knees towards your chest in a rapid and controlled manner. Use your arms for balance and momentum."
          },
          {
            "no": '3',
            "title": "Continuous Motion",
            "detail":
                "Perform high knees in a continuous and rhythmic motion. Aim for a brisk pace, keeping your heart rate elevated throughout."
          },
          {
            "no": '4',
            "title": "Variations",
            "detail":
                "Experiment with variations, such as jogging in place or incorporating high knees into interval training. Focus on maintaining proper form and intensity."
          },
          {
            "no": '5',
            "title": "Cardiovascular Endurance",
            "detail":
                "Incorporate high knees into cardio workouts to enhance cardiovascular endurance. Gradually increase the duration and intensity for optimal benefits."
          }
        ]
      },
      {
        // 10
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand with feet shoulder-width apart and arms at your sides. Lower your body into a squat position, loading power in your legs."
          },
          {
            "no": '2',
            "title": "Explosive Jump",
            "detail":
                "Jump forward explosively, extending your hips and knees fully. Aim for maximum distance while maintaining balance."
          },
          {
            "no": '3',
            "title": "Landing",
            "detail":
                "Land with soft knees, absorbing the impact with your leg muscles. Maintain stability and immediately prepare for the next jump."
          },
          {
            "no": '4',
            "title": "Continuous Jumps",
            "detail":
                "Perform broad jumps in a continuous and fluid motion. Focus on explosive power and controlled landings throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different distances and intensities. Broad jumps are an excellent plyometric exercise for lower body strength and power."
          }
        ]
      },
      {
        // 11
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand on an elevated surface, such as a box or bench, with feet shoulder-width apart. Ensure a stable and secure stance."
          },
          {
            "no": '2',
            "title": "Drop and Jump",
            "detail":
                "Step off the elevated surface and immediately jump upward upon landing. Focus on a quick and explosive upward motion."
          },
          {
            "no": '3',
            "title": "Landing",
            "detail":
                "Land with soft knees, absorbing the impact with your leg muscles. Maintain stability and prepare for the next repetition."
          },
          {
            "no": '4',
            "title": "Continuous Jumps",
            "detail":
                "Perform depth jumps in a continuous and rhythmic motion. Emphasize explosive power and controlled landings throughout the exercise."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Adjust the height of the elevated surface for varied intensity. Depth jumps enhance lower body strength and improve vertical jump performance."
          }
        ]
      },
      {
        // 12
        "descriprion": ".",
        "no": [
          {
            "no": '1',
            "title": "Starting Position",
            "detail":
                "Stand alongside a sturdy box with feet shoulder-width apart. Maintain an athletic stance with knees slightly bent and arms at your sides."
          },
          {
            "no": '2',
            "title": "Lateral Jump",
            "detail":
                "Jump laterally onto the box, landing softly with both feet. Ensure a stable landing and stand fully upright on the box."
          },
          {
            "no": '3',
            "title": "Box Landing",
            "detail":
                "Step back down from the box with control. Land softly on the ground, bending your knees to absorb the impact."
          },
          {
            "no": '4',
            "title": "Repetition",
            "detail":
                "Perform the desired number of repetitions, alternating sides with each jump. Adjust box height based on your fitness level."
          },
          {
            "no": '5',
            "title": "Variations",
            "detail":
                "Experiment with different box heights and jump techniques. "
          }
        ]
      },
    ]
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primaryG),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/img/video_temp.png",
                      width: media.width,
                      height: media.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        color: TColor.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/img/Play.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.eObj["title"].toString(),
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Easy | 390 Calories Burn",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Descriptions",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              ReadMoreText(
                stepArr[widget.workoutIndex][widget.exerciseIndex]
                        ['descriprion']
                    .toString(),
                trimLines: 4,
                colorClickableText: TColor.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read More ...',
                trimExpandedText: ' Read Less',
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
                moreStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How To Do It",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "${stepArr[widget.workoutIndex][widget.exerciseIndex]['no'].length} Steps",
                      style: TextStyle(color: TColor.gray, fontSize: 12),
                    ),
                  )
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: stepArr[widget.workoutIndex][widget.exerciseIndex]
                        ['no']
                    .length,
                itemBuilder: ((context, index) {
                  var sObj = stepArr[widget.workoutIndex][widget.exerciseIndex]
                          ['no'][index] as Map? ??
                      {};

                  return StepDetailRow(
                    sObj: sObj,
                    isLast: stepArr.last == sObj,
                  );
                }),
              ),
              Text(
                "Custom Repetitions",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 150,
                child: CupertinoPicker.builder(
                  itemExtent: 40,
                  selectionOverlay: Container(
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: TColor.gray.withOpacity(0.2), width: 2),
                        bottom: BorderSide(
                            color: TColor.gray.withOpacity(0.2), width: 2),
                      ),
                    ),
                  ),
                  onSelectedItemChanged: (index) {
                    print((index + 1) * 15);
                  },
                  childCount: 60,
                  itemBuilder: (context, index) {
                    // TODO: excerise calories here
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/burn.png",
                          width: 15,
                          height: 15,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          " ${(index + 1) * 15} Calories Burn",
                          style: TextStyle(color: TColor.gray, fontSize: 14),
                        ),
                        Text(
                          " ${index + 1} ",
                          style: TextStyle(
                              color: TColor.gray,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " times",
                          style: TextStyle(color: TColor.gray, fontSize: 16),
                        )
                      ],
                    );
                  },
                ),
              ),
              RoundButton(
                  title: "Save",
                  elevation: 0,
                  onPressed: () {
                    // save to firebase here
                  }),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
