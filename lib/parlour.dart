import 'package:flutter/material.dart';
import "Navigation.dart";
import "NearMe.dart";
import "aisearch.dart";
import "category.dart";
import "guid.dart";
import "Bonus.dart";
import "support.dart";
class Parlour extends StatelessWidget {
  const Parlour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:Tooltip(
          message: "Referral Bonus",
           child:IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const Bonus(),));
           }
          , icon: Icon(Icons.monetization_on))
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
  Tooltip(
    message: "Guide",
    child: IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Guid()),
        );
      },
      icon: const Icon(Icons.menu_book_outlined),
    ),
  ),
]
      ),
      body:Padding(padding: const EdgeInsets.all(10),
      child:Column(children: [
        const SizedBox(height:70),
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
        ),
        const SizedBox(height:12),
        // second row options 
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
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const CategoryPages(),));
            },
            child: Container(
              
              padding:const EdgeInsets.all(10),
              decoration:BoxDecoration(color:Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                    child:const Center(
                    child:Text(
            "Category",
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
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const Support(),));
            },
            child: Container(
              
              padding:const EdgeInsets.all(10),
              decoration:BoxDecoration(color:Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                    child:const Center(
                    child:Text(
            "Contact Support",
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
      floatingActionButton: Tooltip(
  message: "AI Search",
  child: FloatingActionButton.extended(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AiSearchPage()),
      );
    },
    icon: const Icon(Icons.chat_bubble_outline_rounded),
    label: const Text("AI Search"),
  ),
),
         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
