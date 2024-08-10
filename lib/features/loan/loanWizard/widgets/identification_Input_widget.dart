import 'package:flutter/material.dart';

class IdentificationInputWidget extends StatefulWidget {
  const IdentificationInputWidget({super.key});

  @override
  State<IdentificationInputWidget> createState() =>
      _IdentificationInputWidgetState();
}

class _IdentificationInputWidgetState extends State<IdentificationInputWidget> {
  String? _selectedIdType = 'NRC';
  final _idController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your $_selectedIdType';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: _selectedIdType,
              items: ['NRC', 'Passport']
                  .map((idType) => DropdownMenuItem<String>(
                        value: idType,
                        child: Text(idType),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedIdType = value;
                  // Reset the ID input field when the type changes
                  _idController.clear();
                });
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: TextFormField(
              controller: _idController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: _selectedIdType == 'NRC'
                    ? 'eg. 8374/43/1'
                    : 'e.g. AB1234567',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(
                  Icons.person_2_outlined,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your $_selectedIdType';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
