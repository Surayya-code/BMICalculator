import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ResultPage extends StatefulWidget {
  final double result;
  const ResultPage({super.key, required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late String resultText;
  late Color textColor;
  @override
  void initState() {
    if (widget.result > 18 && widget.result < 25) {
      resultText = "NORMAL";
      textColor = Colors.green;
    } else if (widget.result < 18) {
      resultText = "WEEK";
      textColor = Colors.yellow;
    } else {
      resultText = "OVER WEIGHT";
      textColor = Colors.red;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Your result page",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              const SizedBox(height: 40),
              Container(
                width: mediaQuery.width,
                height: MediaQuery.of(context).size.height - 224,
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: AppConstants.kBoxStyle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(resultText,
                        style:  TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 40),
                    Text(
                      widget.result.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
