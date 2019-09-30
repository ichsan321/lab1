import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();
  double a = 0.0, b = 0.0, c = 0.0, result = 0.0 , result2=0.0;
  String bmr;
  String bmr2;
  String gender = 'Male';
  String bmrequ = 'Mifflin-St Jeor';
  String selectactivity ='i am sedentary(little or no exercise)';
  String img = "asset/image/hiu2.png";
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
      title: Text('Material App Bar'),
            ),

      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Image.asset('asset/image/hiu2.png', scale: 5,),
        Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 250, 0),
              child: DropdownButton<String>(
              value: gender,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
                ),
              onChanged: (String newValue) {
                setState(() {
                this.gender = newValue;
                  });
                },
              items: <String>['Male', 'Female']
             .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
                                );
                }).toList(),
              ),
            ),
          
            Padding(
                 padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                 child: DropdownButton<String>(
                 value: bmrequ,
                 icon: Icon(Icons.arrow_downward),
                 iconSize: 24,
                 elevation: 16,
                 style: TextStyle(color: Colors.deepPurple),
                 underline: Container(
                 height: 2,
                 color: Colors.deepPurpleAccent,
                  ),
                 onChanged: (String newValue) {
                   setState(() {
                     this.bmrequ = newValue;
                  });
                },
                items: <String>['Mifflin-St Jeor', 'Harris-Benedict']
                .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
                  );
                }).toList(),
              ),
            ),
          Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextField(
                decoration: InputDecoration(
                hintText: "Height(cm)",
                 ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _acontroller,
                ),
                ),
          Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextField(
                decoration: InputDecoration(
                hintText: "Weight(kg)",
                 ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _bcontroller,
               ),
               ),
          Padding(
               padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
               child: TextField(
               decoration: InputDecoration(
               hintText: "Age(Years)",
                ),
               keyboardType: TextInputType.numberWithOptions(),
               controller: _ccontroller,
              ),
              ),
          Padding(
               padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
               child: DropdownButton<String>(
               value: selectactivity,
               icon: Icon(Icons.arrow_downward),
               iconSize: 24,
               elevation: 16,
               style: TextStyle(color: Colors.deepPurple),
               underline: Container(
               height: 2,
               color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    this.selectactivity = newValue;
                  });
                },
                items: <String>['i am sedentary(little or no exercise)', 'i am lightly active(1-3 days per a week ) ', 'i am moderately active (3 - 5 days per a week )','i am very active (6-7 days per a week)', 'i am super active' ]
               .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: RaisedButton(
                child: Text("Calculate BMR"),
                onPressed: _onPress,
              ),
              ),
            Text("BMR: $bmr"),
            Text("$bmr2"+" Maintenance calories per a day"),
          ],
        ),
      ),
    );
  }

  void _onPress() {
    setState(() {
      a = double.parse(_acontroller.text);
      b = double.parse(_bcontroller.text);
      c =double.parse(_ccontroller.text);
      if (gender == "Male") {
        result = (b * 10) + (6.25 * a) - (5 * c) + 5;
      if(selectactivity=="i am sedentary(little or no exercise)"){
          result2=result*1.2;}
       else if(selectactivity=="i am lightly active(1-3 days per a week ) "){
           result2=result*1.375;}
       else if(selectactivity=="i am moderately active (3 - 5 days per a week )"){
           result2=result*1.55;}
       else if (selectactivity=="i am very active (6-7 days per a week)"){
           result2=result*1.725;
       }else{
        result2=result*1.9;}

      } else {
        result = (b * 10) + (6.25 * a) - (5 * c) - 161;
       if(selectactivity=="i am sedentary(little or no exercise)"){
          result2=result *1.2;}
       else if(selectactivity=="i am lightly active(1-3 days per a week ) "){
           result2=result*1.375;}
       else if(selectactivity=="i am moderately active (3 - 5 days per a week )"){
           result2=result*1.55;}
       else if (selectactivity=="i am very active (6-7 days per a week)"){
           result2=result*1.725;
       }else{
        result2=result*1.9;}
 }

      bmr = format(result);
      bmr2=format(result2);
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
    

  }
}
