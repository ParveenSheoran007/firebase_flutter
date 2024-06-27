import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isShipperSelected = false;
  bool isTransporterSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Please select your profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isShipperSelected = !isShipperSelected;
                        if (isShipperSelected) {
                          isTransporterSelected = false;
                        }
                      });
                    },
                    child: Icon(
                      isShipperSelected
                          ? Icons.circle
                          : Icons.circle_outlined,
                      size: 40,
                      color: isShipperSelected ? Color(0xFF2E3B62) : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset("assets/image/Group (1).png"),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipper",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet,",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Text(
                        "consectetur adipiscing",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Row(
                children: [
                  InkWell(

                    onTap: () {
                      setState(() {
                        isTransporterSelected = !isTransporterSelected;
                        if (isTransporterSelected) {
                          isShipperSelected = false;
                        }
                      });
                    },
                    child: Icon(
                      isTransporterSelected
                          ? Icons.circle
                          : Icons.circle_outlined,
                      size: 40,
                      color: isTransporterSelected ? Color(0xFF2E3B62) : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset("assets/image/Group (2).png"),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transporter",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet,",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Text(
                        "consectetur adipiscing",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 28,),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF2E3B62),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CONTINUE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
