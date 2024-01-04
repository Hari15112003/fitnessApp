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
