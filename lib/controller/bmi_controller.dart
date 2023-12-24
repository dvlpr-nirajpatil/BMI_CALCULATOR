import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BmiController extends GetxController {
  RxInt gender = 3.obs;
  var height = 150.0.obs;
  RxInt weight = 30.obs;
  RxInt age = 18.obs;
  String review = "";
  double bmi = 0.0;
  late String feedback;

  calculateBmi() {
    calculateBMIStatus();
    generateBMIReview(bmi);
  }

  calculateBMIStatus() {
    double heightInMeters = height.value / 100.0;

    // Calculate BMI
    bmi = weight.value / (heightInMeters * heightInMeters);

    // Determine BMI status
    String status;
    if (bmi < 18.5) {
      status = 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      status = 'Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      status = 'Overweight';
    } else {
      status = 'Obese';
    }

    // Provide feedback based on BMI status
    feedback = status;
  }

  generateBMIReview(double bmi) {
    if (bmi < 18.5) {
      review = 'You may need to increase your weight in a healthy way.';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      review = 'Congratulations on maintaining a healthy weight!';
    } else if (bmi >= 25 && bmi < 29.9) {
      review = 'Consider adopting a balanced diet and regular exercise.';
    } else if (bmi >= 30) {
      review =
          'It is advisable to consult with a healthcare professional for guidance.';
    } else {
      review = 'Invalid BMI. Please provide a valid BMI value.';
    }
  }
}
