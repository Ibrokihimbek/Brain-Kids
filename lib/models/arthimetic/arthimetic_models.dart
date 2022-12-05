import 'dart:math';

class ArthimeticModels {
  int a;
  int b;

  ArthimeticModels({required this.a, required this.b});

  static List<ArthimeticModels> numbers = [
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
    ArthimeticModels(a: Random().nextInt(10), b: Random().nextInt(10)),
  ];
}
