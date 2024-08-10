import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_fin/utils/constants/colors.dart';

class DateOfBirthInputPickerWidget extends StatefulWidget {
  final String hintText;
  final bool? filledInput;
  final double? horizontalPadding;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final VoidCallback onTap;

  const DateOfBirthInputPickerWidget(
      {super.key,
      required this.hintText,
      this.filledInput,
      this.horizontalPadding,
      required this.controller,
      required this.onTap, required this.validator});

  @override
  State<DateOfBirthInputPickerWidget> createState() =>
      _DateOfBirthInputPickerWidgetState();
}

class _DateOfBirthInputPickerWidgetState
    extends State<DateOfBirthInputPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 5, horizontal: widget.horizontalPadding ?? 25),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.datetime,
        readOnly: true,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: textGrey,
            fontWeight: FontWeight.w600,
          ),
          filled: widget.filledInput ?? false,
          fillColor: white,
          errorStyle: const TextStyle(
            color: errorColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: borderGrey,
              width: 2,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: primary,
            ),
          ),
          suffixIcon:  const Icon(
            Icons.calendar_month_outlined,
            color: primary,
          ),
        ),
        onTap: widget.onTap,
      ),
      // const SizedBox(height: 20),
      // ElevatedButton(
      //   onPressed: () {
      //     // You can use _dateOfBirthController.text to get the selected date of birth
      //     print('Selected Date of Birth: ${_dateOfBirthController.text}');
      //   },
      //   child: const Text('Submit'),
      // ),
    );
  }
}
