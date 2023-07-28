import 'package:flutter/material.dart';
import 'package:noteapp/utils/kcolor.dart';

class NoteFromField extends StatelessWidget {
  bool? isImportant;
  String? title;
  String? description;
  ValueChanged<bool> onChangeIsImportant;
  ValueChanged<String> onChangeDes;
  ValueChanged<String> onChnagetitle;

  NoteFromField({
    super.key,
    this.isImportant = false,
    this.title = '',
    this.description = '',
    required this.onChangeDes,
    required this.onChangeIsImportant,
    required this.onChnagetitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Switch(value: isImportant!, onChanged: onChangeIsImportant),
        titleField(),
        const SizedBox(height: 10),
        descriptionField()
      ],
    );
  }

  Widget titleField() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Kcolor.secondaryColor,
      ),
      child: TextFormField(
        initialValue: title,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.transparent,
            hintText: "Enter your title",
            hintStyle: TextStyle(
              color: Colors.white54,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          onChanged: onChnagetitle,
          validator: (title) => title != null && title.isEmpty
              ? 'Please Enter your title'
              : null),
    );
  }

  Widget descriptionField() {
    return Expanded(
      child: TextFormField(
        initialValue: description,
          maxLines: 100000,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.transparent,
            hintText: "Enter your description",
            hintStyle: TextStyle(
              color: Colors.white54,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          onChanged: onChangeDes,
          validator: (description) => description != null && description.isEmpty
              ? 'Please Enter your description'
              : null),
    );
  }
}
