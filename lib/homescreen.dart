import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

 late AnimationController controller;

 String currentSecond='';
 bool isButtonClick=false;
 int totalAttempts=0;
 int sucessAttempts=0;
 int failedAttempts=0;
 bool timeCompleted=false;


 


 String get countText{
  Duration count=controller.duration!* controller.value;
  return "${(count.inSeconds % 60).toString().padLeft(2,"0")}:${(count.inMilliseconds % 60).toString().padLeft(2,"0")}";
 }

int randomNumber=0;

int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(60); // Generates a random number between 0 (inclusive) and 60 (exclusive)
}


@override
  void initState() {
        super.initState();

    controller = AnimationController(vsync: this,
    duration: const Duration(seconds: 5),
    
    )
    
    ..addListener(() {
      setState(() {
       
      });
    });
                
   controller.reverse(from: controller.value==0?5:controller.value);
  
   
 
   currentSecond=countText.substring(3,5);
  
  }



  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        centerTitle: true,
        title: const Text("Catch & Attempt to match",
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 22,bottom: 8,
                    ), 
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                     border: Border.all(
                      color: const Color.fromARGB(255, 13, 71, 161)
                     ),
                     borderRadius: const BorderRadius.all(Radius.circular(8))
                    ),
                    child:  Column(
                      children: [
                        const Text("Current Second",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:FontWeight.w900,
                        ),),
                        Divider(
                          color: Colors.grey[700],
                        ),
                         Text(currentSecond,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight:FontWeight.w900,
                        ),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                 Expanded(
                   child: Container(
                    padding: const EdgeInsets.only(top:22,bottom: 8 ),
                               decoration: BoxDecoration(
                                 color: Colors.purple[50],
                                border: Border.all(
                                 color:  const Color.fromARGB(255, 123, 31, 162)
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(8))
                               ),
                               child:  Column(
                                 children: [
                    const Text("Random Number",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:FontWeight.w900,
                    ),),
                    Divider(
                      color: Colors.grey[800],
                    ),
                     Text(
                      randomNumber.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight:FontWeight.w700,
                    ),),
                                 ],
                               ),
                             ),
                 )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if(countText.toString()=="00:00")
            
            Container(
               padding: const EdgeInsets.only(top:16,bottom: 16, ),
                               decoration:   const BoxDecoration(
                               color:Colors.amber,
                                borderRadius: BorderRadius.all(Radius.circular(8))
                               ),
                               child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                      child: Text(
                        "Sorry! timeout and one attempt is consider for failure as penalty",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight:FontWeight.w900,
                      ),),
                    ),
                    Divider(
                      color: Colors.grey[800],
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(
                       horizontal: 16,vertical: 6 
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Attempts :",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),),
                          Text(
                            totalAttempts.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),),
                        ],
                      ),
                    ),
                   
                                 ],
                               ),
            )
            else
            const SizedBox(
              height: 60,
            ),

           
          if((isButtonClick==true)&&(countText.toString()!="00:00"))
           if (currentSecond== randomNumber.toString())
           Container(
               padding: const EdgeInsets.only(top:16,bottom: 16, ),
                               decoration:   BoxDecoration(
                               color:Colors.green[900],
                                borderRadius: BorderRadius.all(Radius.circular(8))
                               ),
                               child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                      child: Text(
                        "Success :)",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight:FontWeight.w900,
                      ),),
                    ),
                    Divider(
                      color: Colors.grey[800],
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(
                       horizontal: 16,vertical: 6 
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Score :",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),),
                          Text(
                            "$sucessAttempts/$totalAttempts",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),),
                        ],
                      ),
                    ),
                   
                                 ],
                               ),
            )
           else
            Container(
               padding: const EdgeInsets.only(top:16,bottom: 16, ),
                               decoration:   const BoxDecoration(
                               color:Colors.amber,
                                borderRadius: BorderRadius.all(Radius.circular(8))
                               ),
                               child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                      child: Text(
                        "Sorry try Again!",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight:FontWeight.w900,
                      ),),
                    ),
                    Divider(
                      color: Colors.grey[800],
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(
                       horizontal: 16,vertical: 6 
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Attempts :",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),),
                          Text(
                            totalAttempts.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),),
                        ],
                      ),
                    ),
                   
                                 ],
                               ),
            ),
         
             Stack(
              alignment: Alignment.center,
               children: [
                 Text(
                  countText,
            style: const TextStyle(
                  fontSize: 26,
                  
            ),),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[600],
                      color: Colors.green,
                    value: controller.value,
                    strokeWidth: 7,
                               ),
                  ),
               ],
             ),
                    ElevatedButton(
                      style:const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 36,vertical: 10))
                      ) ,

                      onPressed: (){
                         isButtonClick=true;
                        //  controller.repeat();
                      // controller.reverse(from: 5);   
                      // controller.reset();
                      controller.reverse(from: controller.value==0?5:controller.value);
                     
                      totalAttempts++;
                      currentSecond=countText.substring(3,5);
                      if(countText=='00:00'){
                        timeCompleted=true;
                      controller.reverse(from: controller.value==0?5:controller.value);
                      }
                      else{
                        timeCompleted=false;
                      }
                      timeCompleted=false;

                
                      randomNumber=generateRandomNumber();
                    
                      
                      if(currentSecond==randomNumber.toString()){
                        sucessAttempts++;
                      }
                      
                     
                    },
                    
                     child: const Text("Click",
                     
                     style: TextStyle(
                      
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                     ),),),
          ],
          
        ),
      ) ,
    );
  }
}

