import 'package:flutter/material.dart';
import 'package:noteapp/utils/kcolor.dart';

class NoteCard extends StatelessWidget {
   final int index;
  NoteCard({
    required this.index, 
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {

   Color color = Kcolor.colorList[index % Kcolor.colorList.length ];
    return Container(
      padding: const EdgeInsets.all(20),
      color: color,
      child: Column(
        children: const [
          Text(
            "Todays Schedule",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
