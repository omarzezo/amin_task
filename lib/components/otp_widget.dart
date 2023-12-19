import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class OTPWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  bool first;
  bool last;
  OTPWidget({
    required this.textEditingController,
    required this.first,
    required this.last,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Colors.purple,
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade100),
      child: TextField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.isNotEmpty && last == false) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: InputBorder.none,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width / 8,
              maxHeight: MediaQuery.sizeOf(context).height / 8,
            )),
      ),
    );
  }
}
