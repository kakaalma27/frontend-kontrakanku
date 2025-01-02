import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/services/house_services.dart';
import 'package:frontend_kontrakan/theme.dart';

class Upload1Page extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<Upload1Page> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValue; // Start with null to allow the hint to show
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController toiletController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  void _storeHouse() async {
    if (_formKey.currentState!.validate()) {
      final houseData = {
        'name': nameController.text,
        'price': int.parse(priceController.text),
        'description': descriptionController.text,
        'tags': tagsController.text,
        'kamar': roomController.text,
        'wc': toiletController.text,
        'available': selectedValue == 'Tersedia'
            ? 0
            : 1, // Mengatur nilai berdasarkan pilihan

        'quantity': quantityController.text,
      };
      try {
        await HouseServices().storeHouse(context, houseData);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('House stored successfully!'),
          backgroundColor: Colors.green,
        ));
        Navigator.pop(context); // Go back after successful storage
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to store house: $e'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  Widget header() {
    return AppBar(
      backgroundColor: bgColor3,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/upload-admin');
        },
        color: primaryTextColor,
        icon: Icon(Icons.close),
      ),
      title: Text(
        'Upload Kontrakan',
        style: primaryTextStyle.copyWith(fontSize: 18),
      ),
    );
  }

  Widget inputName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        obscureText: false, // Ganti menjadi false
        controller: nameController,
        decoration: InputDecoration.collapsed(
          hintText: 'Nama Kontrakan',
          hintStyle: subtitleTextStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Widget inputHarga() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        obscureText: false,
        controller: priceController,
        decoration: InputDecoration.collapsed(
          hintText: 'Harga Kontrakan',
          hintStyle: subtitleTextStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Widget inputKamar() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        obscureText: false,
        controller: roomController,
        decoration: InputDecoration.collapsed(
          hintText: 'Kamar',
          hintStyle: subtitleTextStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Widget inputToilet() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        obscureText: false,
        controller: toiletController,
        decoration: InputDecoration.collapsed(
          hintText: 'Toilet',
          hintStyle: subtitleTextStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Widget inputTags() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        obscureText: false,
        controller: tagsController,
        decoration: InputDecoration.collapsed(
          hintText: 'Tags Opsional',
          hintStyle: subtitleTextStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Widget inputDeskripsi() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        obscureText: false,
        maxLines: 5,
        controller: descriptionController,
        decoration: InputDecoration.collapsed(
          hintText: 'Deskripsi',
          hintStyle: subtitleTextStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Widget inputTersedia() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        dropdownColor: bgColor2,
        isExpanded: true,
        hint: Text(
          'Pilih Status',
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            color: subtitleColor,
          ),
        ),
        items: <String>['Tersedia', 'Arsip']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: subtitleColor),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget inputQuantity() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        obscureText: false, // Ganti menjadi false
        controller: quantityController,
        decoration: InputDecoration.collapsed(
          hintText: 'Quantity',
          hintStyle: subtitleTextStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: EdgeInsets.only(top: defaultMargin),
      child: TextButton(
        onPressed: _storeHouse,
        style: TextButton.styleFrom(
          backgroundColor: blackColor,
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
            color: bgColor5,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/upload-1-admin');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4), // Padding tombol
                ),
                child: Text(
                  '1',
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              ),
              SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/upload-2-admin');
                },
                style: TextButton.styleFrom(
                  backgroundColor: subtitleColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4), // Padding tombol
                ),
                child: Text(
                  '2',
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultMargin),
      child: Form(
        key: _formKey, // Add this line
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: inputName()),
                SizedBox(width: defaultMargin),
                Expanded(child: inputHarga())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: inputKamar()),
                SizedBox(width: defaultMargin),
                Expanded(child: inputToilet())
              ],
            ),
            inputTags(),
            inputDeskripsi(),
            Row(
              children: [
                Expanded(child: inputTersedia()),
                SizedBox(width: defaultMargin),
                Expanded(child: inputQuantity())
              ],
            ),
            selectedButton(context),
            submitButton(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header() as PreferredSizeWidget,
      body: content(context),
      resizeToAvoidBottomInset: false,
    );
  }
}
