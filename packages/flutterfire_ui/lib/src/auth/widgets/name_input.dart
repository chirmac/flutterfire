import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/i10n.dart';
import '../widgets/internal/universal_text_form_field.dart';

import '../validators.dart';

class NameInput extends StatelessWidget {
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextEditingController controller;
  final String? initialValue;
  final void Function(String value) onSubmitted;
  final bool required;

  const NameInput({
    Key? key,
    required this.controller,
    required this.onSubmitted,
    this.focusNode,
    this.autofocus,
    this.initialValue,
    this.required = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l = FlutterFireUILocalizations.labelsOf(context);

    return UniversalTextFormField(
      autofillHints: const [AutofillHints.name],
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      controller: controller,
      placeholder: l.nameInputLabel,
      keyboardType: TextInputType.name,
      validator: Validator.validateAll([
        NameValidator(l.isNotAValidNameErrorText, required),
      ]),
      onSubmitted: (v) => onSubmitted(v!),
    );
  }
}
