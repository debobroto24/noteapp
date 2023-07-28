import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:noteapp/db/note_database.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/utils/kcolor.dart';
import 'package:noteapp/widget/kapp_bar.dart';

import '../widget/note_from_field.dart';

class AddEditNote extends StatefulWidget {
  NoteModel? noteModel;
  AddEditNote({super.key, this.noteModel});

  @override
  State<AddEditNote> createState() => _AddEditNoteState();
}

class _AddEditNoteState extends State<AddEditNote> {
  final formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  late bool isImportant;

  @override
  void initState() {
    isImportant = widget.noteModel?.isImportant ?? false;
    title = widget.noteModel?.title ?? '';
    description = widget.noteModel?.description ?? '';
    super.initState();

    print("$title");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolor.primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: KAppBar(
          editPressed: () {},
          savePressed: addOrUpdate,
          save: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: formKey,
          child: NoteFromField(
            description: description,
            title: title,
            isImportant: isImportant,
            onChangeIsImportant: (value) => setState(() => isImportant = value),
            onChnagetitle: (title) => setState(() => this.title = title),
            onChangeDes: (description) =>
                setState(() => this.description = description),
          ),
        ),
      ),
    );
  }

  void addOrUpdate() async {
    print("add edit clicked");
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      // while click on edit button we send a notemodel object
      final isUpdating = widget.noteModel == null ? false : true;
      if (isUpdating)
        await updateNote();
      else
        await addNote();
    }
  }

  updateNote() async {
   final note =  widget.noteModel!.copy(
      isImportant: isImportant,
      title: title,
      description: description,
    );

    await NoteDatabase.instance.update(note); 
        Navigator.pop(context);
  }

  addNote() async {
    print("add note pressed");
    final note = NoteModel(
        isImportant: isImportant,
        title: title,
        description: description,
        createdAt: DateTime.now());
    // print("add note data ----");
    // print(note.toJson());
    // print("add note data end----");
    await NoteDatabase.instance.insertData(note);
    Navigator.pop(context);
   
  }
}
