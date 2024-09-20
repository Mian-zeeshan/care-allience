import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown(
      {super.key,
      required this.label,
      required this.hint,
      required this.options,
    required this.prefixIcon,
    required this.setValue,
  });

  final String label;
  final String hint;
  final Function setValue;
  final List<Map<String, dynamic>> options;
  final IconData prefixIcon;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      enableFeedback: true,
      onSelected: (value) {
        widget.setValue(value["value"]);
        controller.text = value["label"];
        setState(() {});
      },
      itemBuilder: (BuildContext context) {
        return widget.options.map((e) {
          return PopupMenuItem(
            value: e,
            child: Text(e["label"]),
          );
        }).toList();
      },
      child: TextField(
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon:
              const Icon(Icons.arrow_drop_down_sharp, color: Colors.black),
          labelText: "Select your category",
          labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}
