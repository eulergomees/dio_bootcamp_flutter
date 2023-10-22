import 'dart:math';

class RandomNumberGeneratedService{
  static int generatedRandomNumber(int maxNumber) {
    var randomNum= Random();
    return randomNum.nextInt(maxNumber);
  }
}