import 'package:basic_splitbill_app/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({super.key});

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  double friendsvalue = 1;
  double tip = 0;
  String tax = "0";
  String bill = '';
  buildbutton(String text) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(20),
        ),
        onPressed: () {
          if (text == '-') {
            setState(() {
              bill = '';
            });
          } else {
            setState(() {
              bill += text;
            });
          }
        },
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  TextStyle infostyle = GoogleFonts.montserrat(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Container(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  "Split Bill",
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            bill,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Friends", style: infostyle),
                              Text("Tax", style: infostyle),
                              Text("Tip", style: infostyle),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(friendsvalue.round().toString(),
                                  style: infostyle),
                              Text("$tax %", style: infostyle),
                              Text("\$ ${tip.round().toString()}",
                                  style: infostyle),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
//
//
//
              // slider to ask ammount of users
              SizedBox(
                height: 15,
              ),
              Text("How many friends?",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              Slider(
                min: 0,
                max: 30,
                divisions: 30,
                activeColor: Colors.orange,
                inactiveColor: Colors.grey,
                value: friendsvalue,
                onChanged: (value) {
                  setState(() {
                    friendsvalue = value;
                  });
                },
              ),
//
//
//
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //TIP BOX
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(
                          20,
                        )),
                    child: Column(
                      children: [
                        Text(
                          "TIP",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    tip--;
                                  });
                                },
                                backgroundColor: Colors.grey[400],
                                child: Icon(Icons.remove, color: Colors.black),
                              ),
                            ),
                            Text(
                              "\$ ${tip.round().toString()}",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    tip++;
                                  });
                                },
                                backgroundColor: Colors.grey[400],
                                child: Icon(Icons.add, color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
//
                  //TAX BOX
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            tax = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Tax in %",
                          labelStyle: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildbutton("1"),
                  buildbutton("2"),
                  buildbutton("3"),
                ],
              ),
              Row(
                children: [
                  buildbutton("4"),
                  buildbutton("5"),
                  buildbutton("6"),
                ],
              ),
              Row(
                children: [
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                ],
              ),
              Row(
                children: [
                  buildbutton("."),
                  buildbutton("0"),
                  buildbutton("-"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultsPage(bill, tax, friendsvalue, tip),
                      )),
                  child: Center(
                    child: Text(
                      "Split the Bill!",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
