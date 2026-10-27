import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/widgets/action_button.dart';
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

        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteractionIfError,
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(child: SizedBox(height: 16.0)),
                          SliverList.separated(
                            itemCount: (context
                                .read<FormProvider>()
                                .elements
                                .length),

                            itemBuilder: (context, index) {
                              return SizedBox(
                                child:
                                    (context
                                            .read<FormProvider>()
                                            .elements)[index]
                                        .buildWidgetElement(),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 8.0),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ColoredBox(
                    color: const Color.fromARGB(255, 253, 252, 252),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: ActionButton(
                        label: 'Submit',
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (Form.of(context).validate()) {
                            Form.of(context).save();

                            print(context.read<FormProvider>().formData);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
