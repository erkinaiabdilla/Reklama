// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reklama/components/custom_text_field.dart';
import 'package:reklama/constants/app_sizes.dart';
import 'package:reklama/models/information.dart';
import 'package:reklama/services/date_time_service.dart';
import 'package:intl/intl.dart';
import 'package:reklama/services/image_picker_service.dart';
import 'package:reklama/services/storage_service.dart';
import 'package:reklama/services/store_service.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _name = TextEditingController();
  final _dateTime = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _address = TextEditingController();
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProduct'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            CustomTextField(
              hintText: 'title',
              controller: _title,
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'description',
              maxLines: 5,
              controller: _description,
            ),
            AppSizes.height10,
            ImageContainer(
                // images: const <XFile>[],
                ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'name',
              controller: _name,
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'dateTime',
              controller: _dateTime,
              focusnode: FocusNode(),
              onTap: () async {
                await DateTimeService.showDateTimePicker(context, (value) {
                  _dateTime.text = DateFormat('d MMMM y ')
                      .format(DateTime.parse(value.toString()));
                });
              },
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'phoneNumber',
              controller: _phoneNumber,
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'address',
              controller: _address,
            ),
            AppSizes.height10,
            ElevatedButton.icon(
              onPressed: () async {
                final urls = await StorageService().uploadImages(images);
                final information = Information(
                  title: _title.text,
                  description: _description.text,
                  name: _name.text,
                  dateTime: _dateTime.text,
                  phoneNumber: _phoneNumber.text,
                  address: _address.text,
                  image: urls,
                );
                await StoreServise().informationSave(information);
              },
              icon: Icon(Icons.publish),
              label: Text('Маалыматты жонотуу'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatefulWidget {
  ImageContainer({
    super.key,
  });

//final service = ImagePickerService();
  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  List<XFile> images = [];
  final service = ImagePickerService();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(),
      ),
      child: images.isNotEmpty
          ? GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10),
              children: images
                  .map(
                    (e) => ItemCard(
                      file: File(e.path),
                    ),
                  )
                  .toList(),
            )
          : IconButton(
              onPressed: () async {
                final value = await service.pickImages();
                if (value != null) {
                  images = value;
                  setState(() {});
                }
              },
              icon: const Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.black,
              ),
            ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.file,
  });
  final File file;

  @override
  Widget build(BuildContext context) {
    return Sizedbox(file: file);
  }
}

class Sizedbox extends StatelessWidget {
  const Sizedbox({
    super.key,
    required this.file,
  });

  final File file;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.file(
        file,
      ),
    );
  }
}
