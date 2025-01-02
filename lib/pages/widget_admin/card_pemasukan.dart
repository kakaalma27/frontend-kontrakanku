import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:intl/intl.dart';

class CardPemasukan extends StatefulWidget {
  @override
  State<CardPemasukan> createState() => _CardPemasukanState();
}

class _CardPemasukanState extends State<CardPemasukan> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedPenyewa;
  String? selectedMetode;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Penyewa',
            style: blackColorStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: bgColor5, borderRadius: BorderRadius.circular(12)),
            child: DropdownButtonFormField<String>(
              value: selectedPenyewa,
              hint: Text(
                'Silahkan Pilih Penyewa',
                style: subtitleTextStyle,
              ),
              style: blackColorStyle,
              dropdownColor: bgColor4,
              decoration: InputDecoration.collapsed(hintText: ''),
              items: ['Alma', 'Kaka', 'Kilua']
                  .map((penyewa) => DropdownMenuItem(
                        value: penyewa,
                        child: Text(penyewa),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPenyewa = value;
                });
              },
            ),
          ),

          SizedBox(height: 16),

          // Metode Pembayaran Dropdown
          Text(
            'Metode pembayaran',
            style: blackColorStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: bgColor5, borderRadius: BorderRadius.circular(12)),
            child: DropdownButtonFormField<String>(
              value: selectedMetode,
              hint: Text(
                'Silahkan Pilih Metode',
                style: subtitleTextStyle,
              ),
              style: blackColorStyle,
              dropdownColor: bgColor4,
              decoration: InputDecoration.collapsed(hintText: ''),
              items: ['Cash', 'Transfer']
                  .map((metode) => DropdownMenuItem(
                        value: metode,
                        child: Text(metode),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedMetode = value;
                });
              },
            ),
          ),

          SizedBox(height: 16),

          // Input Uang
          Text(
            'Terima Uang',
            style: blackColorStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: bgColor5, borderRadius: BorderRadius.circular(12)),
            child: TextFormField(
              style: blackColorStyle,
              decoration: InputDecoration.collapsed(
                hintText: 'Uang Masuk',
                hintStyle: subtitleTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 16),
                Column(
                  children: [
                    Text(
                      'Pilih Tanggal',
                      style: blackColorStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            color: bgColor5,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          selectedDate != null
                              ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                              : 'Pilih Tanggal',
                          style: selectedDate != null
                              ? blackColorStyle
                              : subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    Text(
                      'Pilih Waktu',
                      style: blackColorStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            selectedTime = pickedTime;
                          });
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            color: bgColor5,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          selectedTime != null
                              ? selectedTime!.format(context)
                              : 'Pilih Waktu',
                          style: selectedTime != null
                              ? blackColorStyle
                              : subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // Submit Button
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                // Submit action
              },
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
          ),
        ],
      ),
    );
  }
}
