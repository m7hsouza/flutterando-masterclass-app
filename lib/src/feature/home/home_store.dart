import 'package:flutter/material.dart';

class HomeStore extends ValueNotifier<int> {
  HomeStore() : super(0);

  int get currentPage => value;

  onSelectedItem(int index) {
    value = index;
  }
}
