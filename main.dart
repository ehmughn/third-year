import 'dart:io';

void main() {
  printOptions();
  while (true) {
    print('> Enter your number: ');
    try {
      int? chosenNumber = int.parse(stdin.readLineSync()!);
      if (chosenNumber == 1)
        square();
      else if (chosenNumber == 2)
        rectangle();
      else if (chosenNumber == 3)
        circle();
      else if (chosenNumber == 4)
        parallelogram();
      else if (chosenNumber == 5) {
        print('exited the program');
        break;
      } else {
        print('[!] Please only enter from numbers 1-5.');
      }
    } catch (e) {
      print('[!] Please enter a number.');
    }
  }
}

void printOptions() {
  print('=-=-=-=-=-=-=-=-=-=-=-=');
  print('Geometric Shapes');
  print('=-=-=-=-=-=-=-=-=-=-=-=');
  print('Enter from numbers 1-5');
  print('1. Square');
  print('2. Rectangle');
  print('3. Circle');
  print('4. Parallelogram');
  print('5. Exit');
  print('=-=-=-=-=-=-=-=-=-=-=-=');
}

void square() {
  while (true) {
    print('> Enter the size of the square: ');
    try {
      double? size = double.parse(stdin.readLineSync()!);
      double square = size * size;
      print('> Square: $square');
      print('Press enter to go back');
      stdin.readLineSync();
      printOptions();
      break;
    } catch (e) {
      print('[!] Please enter a number.');
    }
  }
}

void rectangle() {
  double length;
  double width;
  while (true) {
    print('> Enter the length of the rectangle: ');
    try {
      length = double.parse(stdin.readLineSync()!);
      break;
    } catch (e) {
      print('[!] Please enter a number.');
    }
  }
  while (true) {
    print('> Enter the width of the rectangle: ');
    try {
      width = double.parse(stdin.readLineSync()!);
      break;
    } catch (e) {
      print('[!] Please enter a number.');
    }
  }
  double rectangle = length * width;
  print('> Rectangle: $rectangle');
  print('Press enter to go back');
  stdin.readLineSync();
  printOptions();
}

void circle() {
  double radius;
  double pi = 3.14159;
  while (true) {
    print('> Enter the radius of the circle: ');
    try {
      radius = double.parse(stdin.readLineSync()!);
      break;
    } catch (e) {
      print('[!] Please enter a number.');
    }
  }
  double circle = radius * radius * pi;
  print('> Circle: $circle');
  print('Press enter to go back');
  stdin.readLineSync();
  printOptions();
}

void parallelogram() {
  double base;
  double height;
  while (true) {
    print('> Enter the base of the parallelogram: ');
    try {
      base = double.parse(stdin.readLineSync()!);
      break;
    } catch (e) {
      print('[!] Please enter a number.');
    }
  }
  while (true) {
    print('> Enter the height of the parallelogram: ');
    try {
      height = double.parse(stdin.readLineSync()!);
      break;
    } catch (e) {
      print('[!] Please enter a number.');
    }
  }
  double parallelogram = base * height;
  print('> Parallelogram: $parallelogram');
  print('Press enter to go back');
  stdin.readLineSync();
  printOptions();
}
