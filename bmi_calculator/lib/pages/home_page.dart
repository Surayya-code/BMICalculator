import 'result_page.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double heightValue = 165;
  int weight = 65;
  int age = 25;
  Color maleColor = Colors.blueGrey;
  Color femaleColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(22, 3, 89, 1),
      child: SafeArea(
        bottom: true,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("BMI Calculator"),
            backgroundColor: const Color.fromARGB(255,3,29,50),
          ),
          //////////--------BODY--------//////////
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          genderBox(genderIcon: Icons.male, genderText: "MALE"),
                          const SizedBox(width: 16),
                          genderBox(
                              genderIcon: Icons.female, genderText: "FEMALE"),
                        ],
                      ),
                      const SizedBox(height: 24),
                      calculateHeight(),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          ageBox(text: 'WEIGHT', number: weight),
                          const SizedBox(width: 16),
                          ageBox(text: 'AGE', number: age),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              //////--------Next Page push------/////////
              calculateButton(),
            ],
          ),
        ),
      ),
    );
  }

  //method yaradiriq GenderBox

  ///Calculte Height
  ///
  Widget calculateHeight() {
    return Container(
      decoration: AppConstants.kBoxStyle,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            'HEIGHT',
            style: AppConstants.kTitleTextStyle,
          ),
          const SizedBox(height: 16),
          Text(
            '${heightValue.toStringAsFixed(0)}cm',
            style: AppConstants.ksizetextStyle,
          ),
          Slider(
            min: 150,
            max: 200,
            value: heightValue,
            onChanged: (value) {
              setState(() {
                heightValue = value;
              });
            },
          )
        ],
      ),
    );
  }

  ///AgeBox,WeightBox
  Widget ageBox({int? number, String? text}) {
    bool condition = text == 'WEIGHT';
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: AppConstants.kBoxStyle,
        child: Column(
          children: [
            Text(
              text!,
              style: AppConstants.kTitleTextStyle,
            ),
            const SizedBox(width: 16),
            Text(
              number.toString(),
              style: AppConstants.ksizetextStyle,
            ),
            const SizedBox(width: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    child: circleButton(Icons.remove),
                    onTap: () {
                      setState(() {
                        if (condition) {
                          weight--;
                        } else {
                          age--;
                        }
                      });
                    }),
                const SizedBox(width: 16),
                GestureDetector(
                    child: circleButton(Icons.add),
                    onTap: () {
                      setState(() {
                        if (condition) {
                          weight++;
                        } else {
                          age++;
                        }
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

//- + circleButtons
  Widget circleButton(IconData circleIcon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Icon(
        circleIcon,
        color: Colors.white,
      ),
    );
  }

  Widget calculateButton() {
    return GestureDetector(
      onTap: () {
        double result = weight / (heightValue / 100 * heightValue / 100);
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => ResultPage(result: result)));
      },
      child: Container(
        ////////////////------CALCUlATE BMI------///////////
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          color: Colors.pink,
        ),
        alignment: Alignment.center,
        child: Text(
          'CALCULATE',
          style: AppConstants.ksizetextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget genderBox({String? genderText, IconData? genderIcon}) {
    bool isMale = genderText == "MALE";
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isMale) {
              maleColor = Colors.pink;
              femaleColor = Colors.blueGrey;
            } else {
              maleColor = Colors.blueGrey;
              femaleColor = Colors.pink;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: isMale ? maleColor : femaleColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Icon(genderIcon, color: Colors.white, size: 95),
              Text(
                genderText!,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
