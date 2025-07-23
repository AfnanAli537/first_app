import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final IconData icon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  IconData? suffixIcon;

  CustomInputField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.suffixIcon,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        hintText: widget.hintText,
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(),
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                child: Icon(
                  _obscure ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
