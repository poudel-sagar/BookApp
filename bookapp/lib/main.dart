import 'package:bookapp/Readerscreen.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(
  title: "book app",
  debugShowCheckedModeBanner: false,
  home: HomePage(),
)
);
//list
var chapterLists=[
  'ch 1',
  'ch 2',
  'ch 3',
  'ch 4',
  'ch 5',

];

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book App"),
        backgroundColor: Color(0xFFB4161B),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: chapterLists.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0
          ),
           itemBuilder: (BuildContext context, int index){
             return GestureDetector(
               onTap: (){
                 if(chapterLists[index]=="ch 1"){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context)=> ReaderScreen(1)),
                   );

                 }else if(chapterLists[index]=="ch 2"){
                    Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context)=> ReaderScreen(2)),
                   );
                  
                 }
               },
               child: Card(
                 child: Column(
                   children: [
                     SizedBox(height: 5),
                     Icon(Icons.book, size: 40),
                     SizedBox(height: 5),
                     Text(chapterLists[index], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                   ],

                 ),
               ),
             );
           }),
      )
      
    );
  }
}
