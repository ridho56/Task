import 'package:hive_flutter/hive_flutter.dart';

class AddController {
  Box<List>? box;

  Future<void> openBox() async {
    // Open the Box
    box = await Hive.openBox<List>('jsonArrayPayment');
  }

  Future<void> addDataPayment(Map<String, dynamic> newData) async {
    List<Map<String, dynamic>>? dataArray =
        box!.get('dataList')?.cast<Map<String, dynamic>>();

    dataArray ??= [];

    dataArray.add(newData);

    await box!.put('dataList', dataArray);
  }

  Future<List<Map<String, dynamic>>> getDataList() async {
    await openBox(); // Ensure the box is opened before accessing data
    return box!.get('dataList')?.cast<Map<String, dynamic>>() ?? [];
  }
}
