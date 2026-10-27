import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/features/form_builder/data/models/form_builder_json.dart';
import 'package:social_media/features/form_builder/view_model/fomr_provider.dart';

class FormBuilderScreen extends StatelessWidget {
  const FormBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form builder'),
        shape: LinearBorder.bottom(
          side: BorderSide(color: Color(0xFFE2E8F0), width: 2.0),
        ),
      ),
      body: Provider(
        create: (context) => FormProvider(formBuilder: FormBuilderJson()),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteractionIfError,
            child: Builder(
              builder: (context) {
                return Column(
                  spacing: 4.0,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 8.0),
                          itemCount: (context
                              .read<FormProvider>()
                              .elements
                              .length),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              // height: 100,
                              child:
                                  (context.read<FormProvider>().elements)[index]
                                      .buildWidgetElement(),
                            );
                          },
                        ),
                      ),
                    ),

                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                247,
                                160,
                                30,
                              ),
                            ),
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (Form.of(context).validate()) {
                                Form.of(context).save();

                                print(context.read<FormProvider>().formData);
                              }
                              // context.de
                              // context.currentState?.validate();
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
