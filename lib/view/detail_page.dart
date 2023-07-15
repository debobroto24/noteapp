import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:noteapp/utils/kcolor.dart';

import '../widget/custom_icon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KPreferedAppBarr(),
      backgroundColor: Kcolor.primaryColor,
      body: Padding( 
        padding:const EdgeInsets.only(left:20,right:20,top:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:const [
            Text("Note Title", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500, color:Colors.white),), 
             SizedBox(height: 20), 
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color:Colors.white),), 

          ],
        ),
      ), 
      
    );
  }

  PreferredSize KPreferedAppBarr() {
    return PreferredSize(
      preferredSize:const Size.fromHeight(100),
      child: Padding(
        padding:const EdgeInsets.only(top:20,left:20,right: 20),
        child: AppBar(
          elevation: 0,
        backgroundColor: Colors.transparent,
          leading: CustomIcon(iconImage: "asset/arrow_back.png", back:true,  onPressed: (){},), 
          actions: [
            CustomIcon(iconImage:  "asset/edit.png",edit:true, onPressed: (){},)
          ],
        ),
      ),
    );
  }
}



