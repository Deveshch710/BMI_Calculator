import 'package:flutter/material.dart';

//main area
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Home page extended with widgets made in my home pade
class _MyHomePageState extends State<MyHomePage> {

  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();

  //result variable
  var result="";

  //background color change
  var bgcolor=Colors.white70;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calulator'),
      ),


      body: Container(
        //creating a color according to the bmi result
        color: bgcolor,
        //it align the columns in center
        child: Center(
          //conatainer in which width is given for the whole columns in this
          child: Container(
            width: 300,
            //app is in column so these are the column
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              //container having different children in it
              children: [

                //1st child
                //having BMI as heading and define its weight and other stuff
                Text("BMI", style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w600
                ),),
                //height of the text box
                SizedBox(height: 22,),

                //2nd child
                //creating the text field where we can enter the weight
                TextField(
                  //variable wt controler which stores the weight i/p by user and then put it in controler
                  controller: wtcontroller,
                  //this is the decoration we are using in our text box
                  decoration: InputDecoration(
                    //giving the label weight
                    label: Text("Enter Your Weight (Kg)"),
                    //diving the icon of the weight
                    prefixIcon: Icon(Icons.line_weight)
                  ),

                  //to get number keyboard for entering the input
                  keyboardType: TextInputType.number,
                ),
                //height of the text box
                SizedBox(height: 11,),

                //3rd child
                //creating a text field which stores the height of person in ft
                TextField(
                  //variable wt controller which stores the weight i/p by user and then put it in controler
                  controller: ftcontroller,
                  //this is the decoration we are using in our text box
                  decoration: InputDecoration(
                      //giving the label height
                      label: Text("Enter Your Height (Ft)"),
                      //giving the icon in front of the text box
                      prefixIcon: Icon(Icons.height_sharp)
                  ),

                  //to get number keyboard for entering the input
                  keyboardType: TextInputType.number,

                ),
                //height of the text box
                SizedBox(height: 12,),


                //4th child
                //creating a text field which stores the height of person in ft
                TextField(
                  //variable wt controller which stores the weight i/p by user and then put it in controler
                  controller: incontroller,
                  //this is the decoration we are using in our text box
                  decoration: InputDecoration(
                    //giving the label height
                      label: Text("Enter Your Height (Inches)"),
                      //giving the icon in front of the text box
                      prefixIcon: Icon(Icons.height_rounded)
                  ),

                  //to get number keyboard for entering the input
                  keyboardType: TextInputType.number,

                ),
                //height of the text box
                SizedBox(height: 12,),

                //5th child
                //Button to calculate the bmi
                ElevatedButton(onPressed: () {

                  //declaring the variable to covert the value into string
                  var wt= wtcontroller.text.toString();
                  var ft= ftcontroller.text.toString();
                  var inc= incontroller.text.toString();


                  //if statement to check if the columns are empty or not
                  if(wt!="" && ft!="" && inc!=""){

                    //converting string into integer value
                    var iwt= int.parse(wt);
                    var ift= int.parse(ft);
                    var iinc= int.parse(ft);

                    //converting height into total inches
                    var tinch= (ift*12) + iinc;
                    //converting into cm
                    var tcm= tinch*2.54;
                    //converting into meter
                    var tm= tcm/100;

                    //finding the BMI
                    var Bmi= iwt/(tm*tm);

                    //creating a background color changing according to the reasult
                    var msg;
                    if(Bmi>25){
                      msg ="You are Overweight";
                      bgcolor=Colors.orange.shade200;
                    }
                    else if(Bmi<18){
                      msg ="You are UnderWeight";
                      bgcolor=Colors.red.shade200;
                    }
                    else{
                      msg ="You are Healthy";
                    bgcolor=Colors.green.shade200;
                    }

                    //now updating the value into result variable
                    setState(() {
                      result="$msg \n Your BMI is : ${Bmi.toStringAsFixed(4)}";
                    });
                  }
                  else{
                    setState(() {
                      result = "Please Fill all the required blank spaces";
                    });
                  }

                }, child: Text('Calulate')),

                SizedBox(height: 12,),

                //6th child
                //text field where we get the output
                Text(result ,style:TextStyle(fontSize: 20,)),

              ],
            ),
          ),
        ),
      )

    );
  }
}
