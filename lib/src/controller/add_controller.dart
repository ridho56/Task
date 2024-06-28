import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddController {
  Box<List>? box;
  ValueNotifier<List<Map<String, dynamic>>> dataListNotifier =
      ValueNotifier([]);

  Future<void> openBox() async {
    // Open the Box
    box = await Hive.openBox<List>('jsonArrayPayment');
    // Load initial data
    loadDataList();
  }

  void loadDataList() {
    List<dynamic>? rawList = box!.get('dataList');
    List<Map<String, dynamic>> dataArray = rawList?.map((item) {
          return Map<String, dynamic>.from(item as Map);
        }).toList() ??
        [];
    dataListNotifier.value = dataArray;
  }

  Future<void> addDataPayment(Map<String, dynamic> newData) async {
    List<dynamic>? rawList = box!.get('dataList');
    List<Map<String, dynamic>> dataArray = rawList?.map((item) {
          return Map<String, dynamic>.from(item as Map);
        }).toList() ??
        [];
    dataArray.add(newData);

    await box!.put('dataList', dataArray);

    // Update the ValueNotifier
    dataListNotifier.value = dataArray;
  }
}
