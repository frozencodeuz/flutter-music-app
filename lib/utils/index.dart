String convertToTenThousand(int number) {
  if (number < 1000 ) {
    return '$number';
  }
  if (number < 10000 ) {
    return '${number/1000}千';
  }
  if (number > 10000 ) {
    return '${(number/10000).toStringAsFixed(1)}万';
  }
  return '$number';
}

/// 生成类似于：95后，这样的字符串
String convertToFiveYear(String data) {
  final end = int.parse(data.substring(3, 4));
  if (end >= 5) {
    return '${data.substring(2, 3)}5后';
  }
  if (end < 5) {
    return '${data.substring(2, 3)}0后';
  }
  return data;
}
