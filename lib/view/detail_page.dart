import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:noteapp/db/note_database.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/utils/kcolor.dart';
import 'package:noteapp/view/edit_note.dart';
import 'package:noteapp/widget/kapp_bar.dart';

import '../widget/custom_icon.dart';

class DetailPage extends StatefulWidget {
  final int noteId;
   DetailPage({super.key, required this.noteId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool loading = false;
  late NoteModel noteDetail = NoteModel(isImportant: false, title: '', description: '', createdAt: DateTime.now()); 
  @override
  initState(){
    
    getNote();
    super.initState();
  }

  Future<void>getNote()async{
    setState(()=>loading= true);

    noteDetail =await NoteDatabase.instance.getNote(widget.noteId); 
    setState(()=>loading= false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: KAppBar(edit:true, editPressed: () async{
         await Navigator.push(context, MaterialPageRoute(builder: (_)=>AddEditNote(noteModel: noteDetail,)));
         getNote();
          }, savePressed: () {  },),
      ),
      backgroundColor: Kcolor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              noteDetail.title??'',
              style:const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              noteDetail.description ?? '',
              style:const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize KPreferedAppBarr(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: CustomIcon(
            iconImage: "asset/arrow_back.png",
            back: true,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            CustomIcon(
              iconImage: "asset/edit.png",
              edit: true,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
