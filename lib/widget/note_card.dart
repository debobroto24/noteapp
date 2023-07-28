import 'package:flutter/material.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/utils/kcolor.dart';

class NoteCard extends StatelessWidget {
   final int index;
   final NoteModel note;
  NoteCard({
    required this.index, 
    super.key, required this.note,
  });

 

  @override
  Widget build(BuildContext context) {

   Color color = Kcolor.colorList[index % Kcolor.colorList.length ];
    return Container(
      padding: const EdgeInsets.all(20),
      color: color,
      child: Column(
        children:  [
          Align( 
            alignment: Alignment.topLeft,
            child: Text(
              note.title??'',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
           note.description ?? '',
             style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
