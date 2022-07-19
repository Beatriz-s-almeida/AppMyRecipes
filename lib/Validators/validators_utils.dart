class ValidatorUtils {
  static String? validadeNull(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Obrigatorio';
    }
    return null;
  }
}
