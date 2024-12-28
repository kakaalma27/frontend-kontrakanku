import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:image_picker/image_picker.dart';

class Update2Page extends StatefulWidget {
  @override
  _Upload2PageState createState() => _Upload2PageState();
}

class _Upload2PageState extends State<Update2Page> {
  String? _selectedKontrakan;
  List<XFile>? _imageFiles = [];

  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _imageFiles = images;
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageFiles?.removeAt(index);
    });
  }

  Widget header() {
    return AppBar(
      backgroundColor: bgColor1,
      title: Text(
        'Update Kontrakan',
        style: primaryTextStyle.copyWith(fontSize: 18),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: primaryTextColor,
        icon: Icon(Icons.close),
      ),
      centerTitle: true,
    );
  }

  Widget submitbutton(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: EdgeInsets.only(top: defaultMargin),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Submit',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }

  Widget selectedButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: bgColor1,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/update-1-admin');
                },
                style: TextButton.styleFrom(
                  backgroundColor: subtitleColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4),
                ),
                child: Text(
                  '1',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/update-2-admin');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4),
                ),
                child: Text(
                  '2',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget dropdownSelection() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor1,
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(
          "Pilih Kontrakan",
          style: primaryTextStyle.copyWith(fontSize: 14),
        ),
        value: _selectedKontrakan,
        dropdownColor: bgColor1,
        onChanged: (String? newValue) {
          setState(() {
            _selectedKontrakan = newValue;
          });
        },
        items: <String>['Kontrakan A', 'Kontrakan B']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: subtitleTextStyle.copyWith(fontSize: 14),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget fileInputButton() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: double.infinity,
      child: TextButton(
        onPressed: _pickImages,
        style: TextButton.styleFrom(
          backgroundColor: bgColor1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upload Image',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            Image.asset(
              'assets/multiImage.png',
              width: 20,
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  // New widget to display the image grid and handle the removal
  Widget imageGridView() {
    return _imageFiles != null && _imageFiles!.isNotEmpty
        ? SizedBox(
            height: 150, // Adjust height as needed
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: _imageFiles!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.file(
                      File(_imageFiles![index].path),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.red),
                        onPressed: () => _removeImage(index),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        : SizedBox(); // Return empty SizedBox if no images
  }

  Widget content(context) {
    return Padding(
      padding: EdgeInsets.all(defaultMargin),
      child: Column(
        children: [
          dropdownSelection(),
          fileInputButton(),
          SizedBox(
            height: 12,
          ),
          imageGridView(), // Use the new widget here
          selectedButton(context),
          submitbutton(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header() as PreferredSizeWidget,
      body: content(context),
      resizeToAvoidBottomInset: false,
    );
  }
}
