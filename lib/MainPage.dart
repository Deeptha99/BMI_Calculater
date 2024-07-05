import 'package:bmi_calculater/contstants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int height = 166;
  int weight = 55;

  String gender ='';

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gender = 'Male';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:gender == 'Male'?  Color.fromARGB(255, 46, 254, 53).withAlpha(150):Color.fromARGB(255, 46, 254, 53).withAlpha(50),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.male, size: 150),
                          Text("Male", style: kTitleLabelColor,),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'Female';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:gender == 'Female'?  Color.fromARGB(255, 46, 254, 53).withAlpha(150):Color.fromARGB(255, 46, 254, 53).withAlpha(50),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.female, size: 150),
                          Text("Female", style: kTitleLabelColor,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Heigh(cm)", style: kTitleLabelColor,),
                        Text(
                          "$height",
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if(height > 50) height--;
                                  bmi = calculateBMI(height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  if(height < 220) height++;
                                  bmi = calculateBMI(height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Weight(Kg)", style: kTitleLabelColor,),
                        Text(
                          "$weight",
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if(weight > 35) weight--;
                                  bmi = calculateBMI(height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if(weight < 300) weight++;
                                  bmi = calculateBMI(height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Text("BMI", style: kBmiLabelColor,),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: kInputLabelColor.copyWith(
                        color: kOutputTextColor, fontSize: 60),
                  ),
                  Text(getResult(bmi),style: TextStyle(color: getColor(bmi), fontSize: 60,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  double calculateBMI({required int height,required int weight}) {
    return (weight/(height*height))*10000;
  }

  String getResult(bmiValue){
    if(bmiValue >= 25){
      return 'OverWeight';
    }
    else if(bmiValue > 18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }
  Color getColor(double bmiValue) {
    if (bmiValue >= 25) {
      return Colors.red;
    } else if (bmiValue > 18.5) {
      return Colors.green;
    } else {
      return Colors.yellow;
    }
  }
}
