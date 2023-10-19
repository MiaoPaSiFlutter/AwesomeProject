class MyModel {
  MyModel({this.counter = 0});

  int counter = 0;

  Future<void> incrementCounter() async {
    await Future.delayed(const Duration(seconds: 2));
    counter++;
    print(counter);
  }
}
