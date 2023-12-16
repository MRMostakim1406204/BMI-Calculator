import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 TextEditingController heightController = TextEditingController();
 TextEditingController weightController = TextEditingController();
 TextEditingController inchiController = TextEditingController();

 double bmi = 0.0;
 var result ="";
 var bmiresult ="";
 var _imageresult ="";
 String A ="";
 String B ="";
 String C ="";
 String D ="";
 String E ="";
 String F ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your BMI"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SizedBox(height: 25,),
          
               Text("BMI",style: TextStyle(
                fontSize: 34,fontWeight: FontWeight.w700,
               ),),
          
               SizedBox(height: 35,),
              
                       
               TextField(
                controller: weightController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Wight in KG"),
                  prefixIcon: Icon(Icons.height),
                ),
               // keyboardType: TextInputType.number,
               ),
              
               SizedBox(height: 15,),
          
               TextField(
                controller: heightController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Height in Feet"),
                  prefixIcon: Icon(Icons.line_weight),
                ),
               // keyboardType: TextInputType.number,
               ),
          
                SizedBox(height: 15,),
              
               TextField(
                controller: inchiController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Height in inchi"),
                  prefixIcon: Icon(Icons.height),
                ),
               // keyboardType: TextInputType.number,
               ),
          
              
              
               SizedBox(height: 35,),
              
               ElevatedButton(
                onPressed: (){
              
                  var height= heightController.text.toString();
                  var weight = weightController.text.toString();
                  var inchi = inchiController.text.toString();
              
                 if(height!="" && weight!="" && inchi!="" ){
                     
                  double height = double.parse(heightController.text);
                   double weight = double.parse(weightController.text);
                   double inchi = double.parse(inchiController.text);
                   double totalinchi= height*12 + inchi;
                   double totalCm = totalinchi*2.54;
                   double totalM = totalCm/100;
              
                   bmi = weight / (totalM * totalM);
              
                    A = "ওজনহীনতা";
                    B = "স্বাভাবিক";
                    C = "ওজনাধিক্য";
                    D = "গ্রেড-১ স্থুলতা";
                    E = "গ্রেড-২ স্থুলতা";
                    F = "গ্রেড-৩ স্থুলতা/ রোগ গ্রস্থ চূড়ান্ত পর্যায়ের স্থুলতা।";
              
                 }
                 else{
              
                 setState(() {
                   result="Please fill all requared!!";
                 });
                 }
              
                 setState(() {
              
                 result= "Your BMI is: " +bmi.toStringAsFixed(2); 
              
                 if(bmi <18.5){
                  bmiresult ="স্বাস্থ্যগত অবস্থাঃ  "+A;
                  _imageresult ="assets/Mostakim/18.jpg";
              
                 } else if(bmi >= 18.5 && bmi <= 24.99){
                  bmiresult ="স্বাস্থ্যগত অবস্থাঃ  "+B;
                  _imageresult = "assets/Mostakim/mostakim.jpg";
              
                 }else if(bmi >=25 && bmi <=29.99){
                  bmiresult="স্বাস্থ্যগত অবস্থাঃ  "+C;
                  _imageresult ="assets/Mostakim/25-29.jpg";
              
                 }else if(bmi >=30 && bmi <=34.99){
                  bmiresult="স্বাস্থ্যগত অবস্থাঃ  "+D;
                  _imageresult = "assets/Mostakim/30-34.9 (1).jpg";
                  
                 }else if(bmi >=35 && bmi <=39.99){
                  bmiresult="স্বাস্থ্যগত অবস্থাঃ  "+E;
                  _imageresult ="assets/Mostakim/35-39.9.jpg";
                  
                 }else if(bmi >40){
                  bmiresult="স্বাস্থ্যগত অবস্থাঃ  "+F;
                  _imageresult ="assets/Mostakim/40.jpg";
                  
                 }else{
                  bmiresult ="মৃত্যু আশঙ্কা";
                 }
                 setState(() {
                   
                 });
                 });
                },
                child: Text("Calculate")),
              
                SizedBox(height: 11,),
              
                Text(result,style: TextStyle(fontSize: 18),),
              
                
                SizedBox(height: 11,),
              
                Text(bmiresult,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        
                SizedBox(height: 11,),
                
                Visibility(
                  visible: _imageresult.isNotEmpty,
                  child: Image(image: AssetImage(_imageresult)
                  )),

                 Visibility(
                  visible: _imageresult.isEmpty,
                  child: Image(image: AssetImage("assets/Mostakim/mmm.jpg")
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}