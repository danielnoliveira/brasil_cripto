import 'package:flutter/cupertino.dart';

extension FormKeyExts on GlobalKey<FormState> {
  bool get isFormValid => currentState!.validate();
  bool get isFormInvalid => !currentState!.validate();
}
