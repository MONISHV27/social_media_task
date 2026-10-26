enum TextFieldElementTypeEnum {
  normal,
  email,
  phone,
  password;

  factory TextFieldElementTypeEnum.getType(String type) {
    return switch (type) {
      'email' => TextFieldElementTypeEnum.email,
      _ => TextFieldElementTypeEnum.normal,
    };
  }
}
