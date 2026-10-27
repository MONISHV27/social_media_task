enum TextFieldElementTypeEnum {
  normal,
  mail,
  number,
  password;

  factory TextFieldElementTypeEnum.getType(String type) {
    return switch (type) {
      'email' => TextFieldElementTypeEnum.mail,
      'password' => TextFieldElementTypeEnum.password,
      'number' => TextFieldElementTypeEnum.number,
      _ => TextFieldElementTypeEnum.normal,
    };
  }
}
