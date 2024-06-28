import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/src/controller/add_controller.dart';
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

  final AddController addController = AddController();

  @override
  void initState() {
    super.initState();
    addController.openBox();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
          Colors.transparent, // Atur warna latar belakang status bar
      statusBarIconBrightness:
          Brightness.light, // Atur warna ikon status bar (light/dark)
      statusBarBrightness: Brightness.dark, // Atur kecerahan status bar
    ));
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      expand: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tidak boleh kosong';
                              }
                              return null;
                            },
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tidak boleh kosong';
                              }
                              return null;
                            },
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tidak boleh kosong';
                              }
                              return null;
                            },
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                          const SizedBox(
                              height: 20), // Add spacing for a button
                          ElevatedButton(
                            onPressed: () {
                              submit();
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
      Map<String, dynamic> newData = {
        'id': uuid.v4(),
        'name': nameController.text,
        'decription': descriptionController.text,
        'nominal': nominalController.text,
        'date': dateController.text,
      };

      // Add new data to array
      await addController
          .addDataPayment(newData)
          .whenComplete(() => Navigator.pop(context));
      return;
    }
  }
}
