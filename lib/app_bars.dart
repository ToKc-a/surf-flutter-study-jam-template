import 'package:flutter/material.dart';

PreferredSizeWidget chatAppBar() {
  return AppBar(
    title: TextFormField(
      style: TextStyle(color: Colors.white),
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Введите ник',
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget chatBottomAppBar() {
  return BottomAppBar(
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        labelText: 'Сообщение',
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.send,
          ),
        ),
      ),
    ),
  );
}

