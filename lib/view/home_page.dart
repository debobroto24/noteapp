import 'dart:ffi';
import 'dart:math';
import 'package:noteapp/utils/kcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:noteapp/view/detail_page.dart';

import '../widget/note_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<double> data = [150, 100, 200, 188, 178, 130, 150];

  double randomHeight(int index) {
    switch (index % 2) {
      case 0:
        return 150.0;
      case 1:
        return 200.0;
      default:
        return 100;
    }
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolor.primaryColor,
      appBar: AppBar(
        title: const Text('Note app'),
      ),
      body: noteList()
      );
  }

   Widget noteList() {
     return Padding( 
      padding:const EdgeInsets.fromLTRB(10, 30, 10, 10),
      child: StaggeredGridView.countBuilder(
        
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: data.length, 
          itemBuilder: (context , index){
            return GestureDetector(
              
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailPage()));
              },
              child: NoteCard(index: index,));
          }, staggeredTileBuilder:(index)=> const StaggeredTile.fit(2),
    
         
        ),
    );
   }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Noteapp"),
  //       ),
  //       body: CustomScrollView(
  //         slivers: [
  //           SliverGrid(
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //               crossAxisSpacing: 10,
  //               mainAxisSpacing: 10,
  //             ),
  //             delegate: SliverChildBuilderDelegate(childCount: data.length,
  //                 (context, index) {
  //               return Container(
                  
  //                 color:Colors.blue, 
  //                 height: randomHeight(index), 
  //                 child: Center( 
  //                   child: Text("${randomHeight(index)}"), 
  //                 ),
  //               );
  //             }),
  //           ),
  //         ],
  //       ));
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title:const Text("Noteapp"),
  //     ),
  //     body: GridView.builder(
  //       gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //       crossAxisSpacing: 10,
  //       mainAxisSpacing: 10,

  //       ),
  //         itemCount: data.length,
  //       	itemBuilder: (context, index) {
  //           return Container(
  //             height: randomHeight(index),
  //             color:Colors.blue,
  //             // child:Center(  child: Text("${data[index]}"))
  //             child:Center(  child: Text("${randomHeight(index)}"))
  //           );
  //       	},
  //     ),
  //   );
  // }
}

