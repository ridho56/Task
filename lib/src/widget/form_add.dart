import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/theme.dart'; // Assuming you're using this
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({super.key});

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nominalController = TextEditingController();
  late int datemillis;
  final _formKey = GlobalKey<FormState>();
  var uuid = const Uuid();

  Box<List>? box;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    // Open the Box
    box = await Hive.openBox<List>('jsonArrayTask');
    setState(() {});
  }

  Future<void> _addData(Map<String, dynamic> newData) async {
    List<Map<String, dynamic>>? dataArray =
        box!.get('dataList')?.cast<Map<String, dynamic>>();

    dataArray ??= [];

    dataArray.add(newData);

    await box!.put('dataList', dataArray);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      // Set minChildSize and maxChildSize to 1.0 for fullscreen
      minChildSize: 0.5,
      maxChildSize: 1.0,
      initialChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: Container(
              //     margin: const EdgeInsets.only(bottom: 10, top: 20),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(2),
              //       color: const Color(0xffEBEBEB),
              //     ),
              //     width: 80,
              //     height: 4,
              //   ),
              // ),
              AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                title: const Text(
                  "Tambah Item",
                  style: TextStyle(
                    color: abuabu,
                    fontFamily: 'KumbhSans',
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                  ),
                ), // More descriptive title
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: hijaumuda.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/Arrow_right.svg",
                        theme: const SvgTheme(
                          currentColor: hijaumuda,
                        ),
                      ),
                    ),
                  ),
                ),
                centerTitle: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Form(
                    key: _formKey,
                    // Wrap the content in a Form widget
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Name:"), // Descriptive label
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: hijaumuda,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: hijaumuda,
                              ),
                            ),
                          ),
                          // Add validation and error handling (optional)
                        ),
                        const SizedBox(height: 10),
                        const Text("Description:"),
                        TextFormField(
                          maxLines: 5,
                          controller: descriptionController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: hijaumuda,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: hijaumuda,
                              ),
                            ),
                          ),
                          // Add validation and error handling (optional)
                        ),
                        const Text("Nominal:"),
                        TextFormField(
                          controller: nominalController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: hijaumuda,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: hijaumuda,
                              ),
                            ),
                          ),
                          // Add validation and error handling (optional)
                        ),
                        const SizedBox(height: 10),
                        const Text("Tanggal:"),
                        TextFormField(
                          readOnly: true,
                          controller: dateController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tidak boleh kosong';
                            }
                            return null;
                          },
                          showCursor: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              splashRadius: 20.0,
                              icon: SvgPicture.asset(
                                'assets/svg/calender.svg',
                                width: 36,
                                height: 36,
                              ),
                              onPressed: () {
                                _selectDate(context);
                              },
                              padding: const EdgeInsets.only(right: 10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: hijaumuda,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: hijaumuda,
                              ),
                            ),
                            hintText: 'Pilih Tanggal',
                          ),
                        ), // Add spacing for a button
                        const SizedBox(height: 20), // Add spacing for a button
                        ElevatedButton(
                          onPressed: () {
                            submit();
                          },
                          child: const Text("Submit"),
                        ), // Optional button
                        ElevatedButton(
                          onPressed: () {
                            var dataList = box!.get('dataList');
                            if (dataList != null) {
                              for (var data in dataList) {
                                print(
                                    'ID: ${data['id']}, Name: ${data['name']}, Description: ${data['decription']}');
                              }
                            }
                          },
                          child: const Text("Submit"),
                        ), // Optional button
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        datemillis = picked.millisecondsSinceEpoch;
        DateTime date = DateTime.fromMillisecondsSinceEpoch(datemillis);
        dateController.text = DateFormat.yMMMMd('id_ID').format(date);
      });
    }
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      // var data = Datamodel(
      //   nameController.text,
      //   descriptionController.text,
      //   nominalController.text,
      //   dateController.text,
      // );
      Map<String, dynamic> newData = {
        'id': uuid.v4(),
        'name': nameController.text,
        'decription': descriptionController.text,
        'nominal': nominalController.text,
        'date': dateController.text,
      };

      // Add new data to array
      await _addData(newData);

      setState(() {});
    }
  }
}
