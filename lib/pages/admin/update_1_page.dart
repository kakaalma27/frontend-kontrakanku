import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class Update1Page extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<Update1Page> {
  String? selectedValue; // Start with null to allow the hint to show
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController toiletController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  Widget header() {
    return AppBar(
      backgroundColor: bgColor3,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: primaryTextColor,
        icon: Icon(Icons.close),
      ),
      title: Text(
        'Update Kontrakan',
        style: primaryTextStyle.copyWith(fontSize: 18),
      ),
    );
  }

  Widget inputName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        controller: nameController,
        obscureText: false, // Ganti menjadi false
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
        color: bgColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        controller: priceController,
        obscureText: false, // Ganti menjadi false
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
        color: bgColor1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        controller: roomController,
        obscureText: false,
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
        color: bgColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        controller: toiletController,
        obscureText: false, // Ganti menjadi false
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
        color: bgColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: primaryTextStyle,
        controller: tagsController,
        obscureText: false,
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
        color: bgColor1,
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
        color: bgColor1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        isExpanded: true, // Ensures the dropdown button takes up the full width
        dropdownColor: bgColor1,
        hint: Text(
          'Pilih Status',
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            color: subtitleColor,
          ), // Set hint text color to white
        ),
        items: <String>['Tersedia', 'Arsip']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: subtitleColor), // Set text color to white
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
        color: bgColor1,
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
                  Navigator.pushNamed(context, '/update-2-admin');
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
