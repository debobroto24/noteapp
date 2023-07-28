import 'dart:ffi';
import 'dart:math';
import 'package:noteapp/utils/kcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:noteapp/view/detail_page.dart';
import 'package:noteapp/view/edit_note.dart';
import 'package:noteapp/widget/custom_route.dart';

import '../db/note_database.dart';
import '../widget/note_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<double> data = [150, 100, 200, 188, 178, 130, 150];
  late Animation _animation;
  late AnimationController _controller;
  late List notes = [];
  bool loading = false;
  double screenWidth = 0.0;
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
  void initState() {
    super.initState();

    // animController = AnimationController(vsync: this, duration: Duration(
    //   seconds: 2,
    // ));

    // animation = CurvedAnimation(parent: animController, curve: Curves.linear);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat(reverse: true);
    // animController.forward();
    getAllNotes();
  }

  Future<void> getAllNotes() async {
    setState(() => loading = true);
    notes = await NoteDatabase.instance.getNoteList();
    setState(() => loading = false);
  }

  @override
  void dispose() {
    super.dispose();
    NoteDatabase.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width * .7;
    return Scaffold(
      backgroundColor: Kcolor.primaryColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Kcolor.primaryColor,
          title: Transform.translate(
            offset: Offset(_controller.value * screenWidth, 0),
            child: Text("Note App"),
          )),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : noteList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade300,
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddEditNote()));
          await getAllNotes();
        },
        child: const Center(child: Icon(Icons.add)),
      ),
    );
  }

  Widget noteList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(CustomPageRoute(child: DetailPage(noteId: note.id!)));
              },
              child: NoteCard(
                index: index,
                note: note,
              ));
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      ),
    );
  }
}
