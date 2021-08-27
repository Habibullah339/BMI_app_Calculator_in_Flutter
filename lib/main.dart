import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'shifahub.ga',

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // the controller for the text field associated with "height"
  final _heightController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  // The BMI
  double? _bmi;

  // the message at the beginning
  String _message = 'Please enter your height an weight';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "You are underweight";

      } else if (_bmi! < 25) {
        _message = 'You body is fine';

      } else if (_bmi! < 30) {
        _message = 'You are overweight';

      } else {
        _message = 'You are obese';

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[750],
        appBar: AppBar(
          title: const Text('IBM Calculator'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: Center(
          child: Container(
            width: 320,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'Height (Meter)'),
                      controller: _heightController,
                    ),
                    TextField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Weight (Kg)',
                      ),
                      controller: _weightController,
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),

                    ElevatedButton(
                      onPressed: _calculate,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.cyan[600],
                          ),
                      child: Text('Calculate'),

                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                        style: TextStyle(fontSize: 50),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        _message,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text("Made By:"),
                    Text("Habibullah", style: new TextStyle(color: Colors.blue, decoration: TextDecoration.underline),),
                  ],

                ),
              ),
            ),
          ),
        ));
  }
}