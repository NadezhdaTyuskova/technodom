import 'package:flutter/material.dart';

class Instrument {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final InstrumentCategory category;
  final String itemOther;

  Instrument({
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.category,
    required this.itemOther,
  });
}

enum InstrumentCategory {
  elinstrument,
  benzoinstrument,
  handinstrument,
}
