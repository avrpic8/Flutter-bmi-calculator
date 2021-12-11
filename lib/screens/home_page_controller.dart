import 'package:get/state_manager.dart';

class HomePageController extends GetxController {
  var height = 180.obs;
  var weight = 75.obs;
  var age = 25.obs;
  var gender = false.obs;

  void updateHeight(int value) {
    height.value = value;
  }

  void increaseWeight() => weight.value++;
  void decreaseWeight() {
    if (weight > 0) weight.value--;
  }

  void increaseAge() => age.value++;
  void decreaseAge() {
    if (age > 0) age.value--;
  }

  void changeGender() {
    gender.value == false ? gender.value = true : gender.value = false;
  }
}
