import 'package:flutter/material.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        color: const Color(0xffF8F6F4),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter the Item ....',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar get _appBar => AppBar(
    backgroundColor: Colors.blueGrey,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar.png'),
            ),
          )
        ],
      ),
    );
}