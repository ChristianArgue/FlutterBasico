import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 0;

  void increase(){
    counter++;
    setState(() {});
  }
  void decrease(){
    counter--;
    setState(() {});
  }
  void reset(){
    counter=0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    TextStyle fontSize30 = const TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen')),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Clicks Counter', style: fontSize30),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase, 
        decreaseFn: decrease, 
        resetFn: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key, 
    required this.increaseFn, 
    required this.decreaseFn, 
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1_rounded),
          onPressed: () => increaseFn()
        ),
        const SizedBox(width: 20,),
        FloatingActionButton(
          child: const Icon(Icons.restart_alt_outlined),
          onPressed: () => resetFn()
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_rounded),
          onPressed: () => decreaseFn()
        ),
      ],
    );
  }
}