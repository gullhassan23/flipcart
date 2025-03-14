import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flipcart/constants/Handlingerror.dart';
import 'package:flipcart/constants/globalVariables.dart';
import 'package:flipcart/constants/utilss.dart';
import 'package:flipcart/models/product.dart';
import 'package:flipcart/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void sellProduct({
  required BuildContext context,
  required String name,
  required String description,
  required double price,
  required double quantity,
  required String category,
  required List<File> images,
}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  try {
    final cloudinary = CloudinaryPublic("dtqdu7rde", "czlty0tg");
    List<String> imageUrls = [];

    for (int i = 0; i < images.length; i++) {
      CloudinaryResponse res = await cloudinary
          .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));

      imageUrls.add(res.secureUrl);
    }

    Product product = Product(
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        category: category,
        images: imageUrls);
    http.Response response = await http.post(
      Uri.parse(
        "$uri/admin/add-product",
      ),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        'x-auth-token': userProvider.user.token,
      },
      body: product.toJson(),
    );

    httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "",
          );
        });
  } catch (e) {
    showSnackBar(context, e.toString());
  }
}
