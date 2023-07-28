import 'package:flutter/material.dart';
import 'package:noteapp/widget/custom_icon.dart';

class KAppBar extends StatelessWidget {
  bool edit; 
  bool save; 
  VoidCallback editPressed; 
  VoidCallback savePressed; 
   KAppBar({super.key, 
   required this.editPressed , 
   required this.savePressed,
   this.edit = false, 
   this.save = false
  
   });

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding:const EdgeInsets.only(top:20,left:20,right: 20),
        child: AppBar(
          elevation: 0,
        backgroundColor: Colors.transparent,
          leading: CustomIcon(iconImage: "asset/arrow_back.png", back:true,  onPressed: (){
            Navigator.pop(context);
          },), 
          actions: [
            edit?
            CustomIcon(iconImage:  "asset/edit.png",edit:edit, onPressed: editPressed,): 
            TextButton(onPressed: savePressed, child: const Icon(Icons.save)) 
          ],
        ),
      );
  
  }
}