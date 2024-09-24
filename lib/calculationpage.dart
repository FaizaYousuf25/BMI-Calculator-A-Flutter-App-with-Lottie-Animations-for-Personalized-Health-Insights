import 'package:flutter/material.dart';

import 'ResultPage.dart';

void main() {
  runApp(const calculationpage());
}

class calculationpage extends StatelessWidget {
  const calculationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Color(0xFFE8EAF6),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: calculationpage1(),
          ),
        ),
      ),
    );
  }
}

class calculationpage1 extends StatefulWidget {
  @override
  _calculationpage1State createState() => _calculationpage1State();
}

class _calculationpage1State extends State<calculationpage1> {
  final TextEditingController nameController = TextEditingController();
  int age = 30;
  int weight = 78;
  double height = 175;
  bool isMale = true;

  void calculateBMI() {
    if (nameController.text.isEmpty) {
      // Show error if name is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter your name.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    double bmi = weight / ((height / 100) * (height / 100));
    String category;

    if (bmi < 18.5) {
      category = 'Underweight';
    } else if (bmi < 24.9) {
      category = 'Normal weight';
    } else if (bmi < 29.9) {
      category = 'Overweight';
    } else {
      category = 'Obesity';
    }

    // Navigate to ResultPage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          name: nameController.text,
          bmi: bmi,
          category: category,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              width: 326,
              height: 50, // Adjusted height
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                   color: Colors.grey.withOpacity(0.5),
                   spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                       ),
                      ]
              ),
              child: TextField(
                controller: nameController,
                textAlign: TextAlign.start,  // Center the text inside the TextField
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: InputBorder.none,  // Remove border
                  enabledBorder: InputBorder.none,  // No border when enabled
                  focusedBorder: InputBorder.none,  // No border when focused
                  contentPadding: EdgeInsets.symmetric(vertical: 5,),
                ),
              ),
            ),
          ),



          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Age Container
              Container(
                width: 156,
                height: 175,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                   BoxShadow(
                   color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                   blurRadius: 5,
                  offset: Offset(0, 3),
                  ),
    ]
               ),
                child: Column(
                  children: [
                    Text(
                      'Age',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 22),
                    Text(
                      age.toString(),
                      style: TextStyle(fontSize: 30,color: Color(0xFF1B7B70),fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1B7B70), // Circle background color
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove, color: Colors.white), // Icon color white
                            onPressed: () {
                              setState(() {
                                if (age > 0) age--;
                              });
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1B7B70), // Circle background color
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.white), // Icon color white
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(width: 25),
              // Weight Container
              Container(
                width: 156,
                height: 175,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Weight (KG)', // Updated label for weight
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 23),
                    Text(
                      weight.toString(), // Weight variable
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF1B7B70),
                        fontWeight: FontWeight.bold, // Bold weight text
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1B7B70), // Circle background color
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove, color: Colors.white), // White remove icon
                            onPressed: () {
                              setState(() {
                                if (weight > 0) weight--; // Decrease weight
                              });
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1B7B70), // Circle background color
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.white), // White add icon
                            onPressed: () {
                              setState(() {
                                weight++; // Increase weight
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 15),
          // Height Slider
          Center(
            child: Container(
              height: 200,
              width: 350,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Height (CM)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${height.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    value: height,
                    min: 50,
                    max: 300,
                    activeColor: Colors.teal,
                    inactiveColor: Colors.teal.withOpacity(0.3),
                    divisions: 250,
                    label: height.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '50 cm',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '300 cm',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          // Gender Switch
          Center(
            child: Container(
              width: 350,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Male',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Switch(
                        value: isMale,
                        onChanged: (bool value) {
                          setState(() {
                            isMale = value;
                          });
                        },
                        activeColor: Colors.teal,
                        inactiveTrackColor: Colors.teal.withOpacity(0.3),
                      ),
                      Text(
                        'Female',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Calculate Button
          Center(
               child: ElevatedButton(
               onPressed: calculateBMI, // This calls the calculateBMI method
               style: ElevatedButton.styleFrom(
               padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20), backgroundColor: Colors.teal,
                ),
                      child: Text(
                     'Calculate BMI',
                     style: TextStyle(fontSize: 20,
                     color: Colors.white),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
