enum TextFieldElementTypeEnum {
  normal,
  mail,
  phone,
  password;

  factory TextFieldElementTypeEnum.getType(String type) {
    return switch (type) {
      'email' => TextFieldElementTypeEnum.mail,
      'password' => TextFieldElementTypeEnum.password,
      'phone' => TextFieldElementTypeEnum.phone,
      _ => TextFieldElementTypeEnum.normal,
    };
  }
}
