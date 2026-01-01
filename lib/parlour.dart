import 'package:flutter/material.dart';
import "Navigation.dart";
import "NearMe.dart";

class Parlour extends StatelessWidget {
  const Parlour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:(
           IconButton(onPressed: (){}
          , icon: Icon(Icons.home))
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8),
            const Text(
              "NoorCall",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, 
          icon: Icon(Icons.menu_book_outlined)),
          
        ]
      ),
      body:Padding(padding: const EdgeInsets.all(10),
      child:Column(children: [
        SizedBox(
          width:double.infinity,
          child:Card(
            color:Colors.transparent,
            elevation:10,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
              
            ),
            
            child:Container(
  height: 120,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Center( 
    child: Row(
      
      children: [
        Expanded(
          child:InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const NearMe(),));
            },
            child: Container(
              
              padding:const EdgeInsets.all(10),
              decoration:BoxDecoration(color:Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                    child:const Center(
                    child:Text(
            "Parlour Near Me",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            
            
                    ),
                    ),
            ),
          ),
        ),
        const SizedBox(width:12),
        
          Expanded(
          child:InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const NavigationCategoryPages(),));
            },
            child: Container(
              
              padding:const EdgeInsets.all(10),
              decoration:BoxDecoration(color:Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                    child:const Center(
                    child:Text(
            "Book An Appointment",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            
            
                    ),
                    ),
            ),
          ),
        ),
      ],
    ),
  ),
)

          ),
        )
      ],)
      ,),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){},
        icon:Icon(Icons.chat_bubble_outline_rounded),
        label:const Text("AI Search")
        
        
         ),
         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
