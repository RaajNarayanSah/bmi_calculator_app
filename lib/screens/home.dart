// import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';
// import 'package:bmi/screens/home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(
                color: Color(0xFFff4004), fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Color(0xFF1C1C1C),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFCC91C)),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFCC91C)),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "You\'re over weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "You have normal weight";
                    } else {
                      _textResult = "You\'re under weight";
                    }
                  });
                },
                child: Container(
                  child: Card(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    color: Color(0xFFff4004),
                    borderOnForeground: true,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: Color(0xFFFCC91C)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFCC91C)),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Note: Fill the Height in meter.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ElevatedButton(
                  child: Text(
                    "Refresh",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: "times",
                    ),
                  ),

                  // style: ButtonStyle(backgroundColor: MaterialStateProperty(Colors.deepOrange)) ,
                  onPressed: () {
                    setState(() {
                      _heightController.clear();
                      _weightController.clear();
                      _bmiResult = 0;
                      _textResult = '';
                    });
                    // Navigator.push(context, MaterialPageRoute(builder: builder))
                  },
                ),
              ),
              SizedBox(
                height: 1,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 70),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 70),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
