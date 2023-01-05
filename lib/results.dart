import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatefulWidget {
  final String bill;
  final String tax;
  final double friends;
  final double tip;
  ResultsPage(this.bill, this.tax, this.friends, this.tip);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String dividedamount = '';
  @override
  void initState() {
    super.initState();
    divideamount();
  }

  totalamount() {
    return ((double.parse(widget.bill)) * (double.parse(widget.tax) / 100) +
        widget.tip +
        double.parse(widget.bill));
  }

  divideamount() {
    double taxamount =
        (double.parse(widget.bill)) * (double.parse(widget.tax) / 100);
    double finalbill = ((taxamount + double.parse(widget.bill)) + widget.tip) /
        (widget.friends + 1);
    setState(() {
      dividedamount = finalbill.toStringAsFixed(2);
    });
  }

  TextStyle infostyle = GoogleFonts.montserrat(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "Result",
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 125,
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
                          "Total amount was ${totalamount()}",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Equally divided",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "\$$dividedamount",
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
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
                            Text(widget.friends.round().toString(),
                                style: infostyle),
                            Text("${widget.tax} %", style: infostyle),
                            Text("\$ ${widget.tip.round().toString()}",
                                style: infostyle),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      "Everyone should pay \$$dividedamount",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Center(
                            child: Text(
                          "Calculate Again?",
                          style: infostyle,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
