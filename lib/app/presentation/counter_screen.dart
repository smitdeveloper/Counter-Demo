import 'package:flutter/material.dart';
import 'package:task2/app/db/app_db.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counterValue = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async => AppDb.getValue().then(
        (value) => setState(() => counterValue = value),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          counterValue.toString(),
          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () async => _increment(),
                child: const Icon(Icons.add),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    counterValue <= 0 ? Colors.grey : null,
                  ),
                ),
                onPressed: () async => _reset(),
                child: const Text("Reset"),
              ),
              FloatingActionButton(
                onPressed: () async => _decrement(),
                backgroundColor: counterValue <= 0 ? Colors.grey : null,
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// this function is used to set counter value
  /// in database
  Future<void> _setValue() async {
    await AppDb.setValue(counterValue);
  }

  /// this function is used to increment counter
  Future<void> _increment() async {
    setState(() => counterValue++);
    if (counterValue % 5 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You're reached at $counterValue!"),
          backgroundColor: Colors.green,
        ),
      );
    }
    await _setValue();
  }

  /// this function is used to decrement counter
  Future<void> _decrement() async {
    if (counterValue <= 0) return;
    setState(() => counterValue--);
    await _setValue();
  }

  /// this function is used to reset counter
  Future<void> _reset() async {
    if (counterValue <= 0) return;
    setState(() => counterValue = 0);
    await _setValue();
  }
}
