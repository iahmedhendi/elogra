import 'package:elogra_app/widget/OgraText.dart';
import 'package:flutter/material.dart';

import 'widget/OgraButton.dart';
import 'widget/OgraTextField.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(headline6: TextStyle(fontFamily: "Sukar"))),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double halfOfScreen = 0.0;

  var ograTxtController = TextEditingController();
  var passengersCountController = TextEditingController();

  var remainPassengersController = TextEditingController();
  var remainAmountPaidController = TextEditingController();

  var passengerOgra = 0.0;
  var totalOgra = "0 جنيه";
  var totalRemain = "0 جنيه";

  var remainPassengers = 0;
  var remainAmount = 0.0;


  void didTapCalculateOgra() {
    print("called");
    if ((ograTxtController.text != null) &&
        (passengersCountController.text != null)) {
      passengerOgra = double.parse(ograTxtController.text);
      double passengers = double.parse(passengersCountController.text);

      double result = passengerOgra * passengers;

      setState(() {
        totalOgra = result.toStringAsFixed(2) + " جنيه";
      });
    }
  }


  void didTapRemainOgra() {
    print("remain called");
    // Scaffold.of(context).showSnackBar(SnackBar(
    //   content: Text(
    //     "Thanks for using snackbar",
    //     textAlign: TextAlign.center,
    //     style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    //   ),
    //   duration: Duration(seconds: 2),
    //   backgroundColor: Colors.red,
    // ));
    if ((remainPassengersController.text != null) &&
        (remainAmountPaidController.text != null)) {
      remainAmount = double.parse(remainAmountPaidController.text);
      remainPassengers = int.parse(remainPassengersController.text);

      double result = remainAmount - (passengerOgra * remainPassengers);

      setState(() {
        totalRemain = result.toStringAsFixed(2) + " جنيه";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    halfOfScreen = MediaQuery.of(context).size.width / 2 - 40;

    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xaa3F00FF),
                        blurRadius: 10.0,
                      )
                    ],
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(60)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [Color(0xff0031FF), Color(0xff5E05EB)],
                    )),
                width: double.infinity,
                height: 180,
                child: Image.asset("assets/images/ogra_logo.png"),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    OgraText('أجرة الفرد'),
                    SizedBox(
                      height: 10,
                    ),
                    OgraTextField(
                      "أجرة الفرد",
                      ograTxtController,
                      halfOfScreen,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      width: halfOfScreen,
                      child: OgraText('مجموع الأجرة'),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: halfOfScreen,
                          child: Text(
                            totalOgra,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Sukar",
                              fontSize: 28,
                              color: Color(0xff0000FF),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            OgraTextField(
                              "عدد الركاب",
                              passengersCountController,
                              halfOfScreen,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.yellow,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff4500FF),
                                    Color(0xff2300FF)
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.topLeft,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff686EFD),
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 3.0),
                                  )
                                ],
                              ),
                              child: Container(
                                child: OgraButton(
                                  "احسب",
                                  didTapCalculateOgra,
                                  halfOfScreen,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: halfOfScreen,
                      child: OgraText('باقى الأجرة'),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        OgraTextField(
                          "المبلغ",
                          remainAmountPaidController,
                          halfOfScreen,
                        ),
                        Column(
                          children: <Widget>[
                            OgraTextField(
                              "عدد الأفراد",
                              remainPassengersController,
                              halfOfScreen,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.yellow,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff4500FF),
                                    Color(0xff2300FF)
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.topLeft,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff686EFD),
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 3.0),
                                  )
                                ],
                              ),
                              child: OgraButton(
                                "احسب",
                                didTapRemainOgra,
                                halfOfScreen,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: halfOfScreen,
                    child: Text(
                      totalRemain,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sukar",
                        fontSize: 30,
                        color: Color(0xff0000FF),
                      ),
                    ),
                  ),
                  Container(
                    width: halfOfScreen,
                    child: OgraText(
                      'باقى $remainPassengers  من $remainAmount',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
