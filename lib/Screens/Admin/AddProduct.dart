import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipcart/Widgets/Bars/AdminBar.dart';
import 'package:flipcart/Widgets/Buttons/CustomButton.dart';
import 'package:flipcart/Widgets/Buttons/TextFormField.dart';
import 'package:flipcart/constants/utilss.dart';
import 'package:flutter/material.dart';
import "package:dotted_border/dotted_border.dart";

class AddProduct extends StatefulWidget {
  static const String routeName = "/add-product";
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
  }

  List<File> images = [];

  String category = 'Mobiles';
  List<String> productCategories = [
    'Mobiles',
    "Essentials",
    "Appliance",
    "Books",
    "Fashion",
  ];

  void selectImages() async {
    var res = await pickImage();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AdminBar(
            textt: "Add Products",
          )),
      body: SingleChildScrollView(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images.map(
                        (i) {
                          return Builder(
                            builder: (BuildContext context) => Image.file(
                              i,
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 200,
                      ),
                    )
                  : GestureDetector(
                      onTap: selectImages,
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          dashPattern: [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Select Product Images",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          )),
                    ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  textEditingController: productNameController,
                  hintText: "Product Name",
                  obscureText: false),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  textEditingController: descriptionController,
                  hintText: "Description",
                  lines: 7,
                  obscureText: false),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  textEditingController: priceController,
                  hintText: "Price",
                  obscureText: false),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  textEditingController: quantityController,
                  hintText: "Quantity",
                  obscureText: false),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  )),
              SizedBox(
                height: 10,
              ),
              CustomButton(text: "Sell", ontap: () {})
            ],
          ),
        )),
      ),
    ));
  }
}
