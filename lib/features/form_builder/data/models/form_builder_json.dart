class FormBuilderJson {
  const FormBuilderJson();
  final Map<String, dynamic> json = const {
    'fields': [
      {
        "element": "text_field",
        "field_type": 'email',
        "label": "Email",
        "placeholder": "Enter your full name",
        "required": true,
        "min": 3,
        "max": 50,
        "key": 'email',
      },
      {
        "element": "text_field",
        "field_type": 'normal',
        "label": "Name",
        "required": true,
        "min": 18,
        "max": 60,
        "key": 'age',
      },
      {
        "element": "checkbox_multi",
        "label": "Skills",
        "required": true,
        "options": ["Flutter", "Android", "iOS", "Firebase", "Node.js"],
        "key": 'skills',
      },
      {
        "element": "slider",
        "label": "Years of Experience",
        "min": 0,
        "max": 15,
        "divisions": 15,
        'key': 'exp',
      },
      {
        "element": "radio",
        "label": "Gender",
        "required": true,
        "options": ["Other", "Female", "Male"],
        'key': 'gender',
      },
      {
        "element": "dropdown",
        "label": "Country",
        "required": true,
        "options": ["India", "USA", "Canada"],
        'key': 'country',
      },
    ],
  };
}
