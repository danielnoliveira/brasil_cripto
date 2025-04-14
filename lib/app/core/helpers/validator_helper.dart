class ValidatorHelper {
  static String? isNotEmpty(String? value,
      {String message = 'Campo obrigatório'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? isEmail(String? value, {String message = 'E-mail inválido'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+\$');
    if (!regex.hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? isNumeric(String? value,
      {String message = 'Deve conter apenas números'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    final regex = RegExp(r'^[0-9]+$');
    if (!regex.hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? hasMinLength(String? value, int minLength, {String? message}) {
    if (value == null || value.trim().length < minLength) {
      return message ?? 'Mínimo de $minLength caracteres';
    }
    return null;
  }

  static String? hasMaxLength(String? value, int maxLength, {String? message}) {
    if (value != null && value.length > maxLength) {
      return message ?? 'Máximo de $maxLength caracteres';
    }
    return null;
  }
}
