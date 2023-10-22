double calcDiscount(double value, double discount, bool percentage) {
  if (value <= 0) {
    throw ArgumentError("O valor do produto nao pode ser zero!");
  }
  if (discount <= 0) {
    throw ArgumentError("O valor do desconto nao pode ser zero!");
  }
  if (percentage) {
    return value - ((value * discount) / 100);
  }
  return value - discount;
}

String convertToUpper(String text) {
  return text.toUpperCase();
}

double returnValue(double value) {
  return value;
}
