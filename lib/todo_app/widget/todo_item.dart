import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String? item;
  final int? id;
  final bool completed;
  final void Function(int? i) callback;
  final void Function(int? id) onDelete;
  TodoItem({required this.item, required this.id, required this.completed, required this.callback, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        onTap: (){
          callback(id);
        },
        leading: Icon(
          completed ? Icons.check_box : Icons.check_box_outline_blank_outlined
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        title: Text(
          item ?? "",
          style: TextStyle(
            fontSize: 16,
            color: !completed ? Color.fromARGB(213, 0, 0, 0) : Color.fromARGB(57, 0, 0, 0),
            decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            onPressed: (){
              onDelete(id);
            }, 
            icon: Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}