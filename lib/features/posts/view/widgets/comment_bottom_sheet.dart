import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/theme/color_themes.dart';
import 'package:social_media/features/posts/view/widgets/comment_field_widget.dart';
import 'package:social_media/features/posts/view/widgets/comment_widget.dart';
import 'package:social_media/features/posts/view/widgets/post_interaction_widget.dart';
import 'package:social_media/features/posts/view_model/comment_view_model.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: ColorTheme.borderColor, width: 1.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
              vertical: 16.0,
            ),
            child: Row(
              spacing: 4.0,
              children: [
                PostInteractionWidget(
                  onTap: () => Navigator.pop(context),
                  icon: Icons.arrow_back,
                ),
                const Text(
                  'Comments',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.35,
          child: Consumer<CommentViewModel>(
            builder: (context, value, child) {
              return ListView.separated(
                padding: EdgeInsets.all(8.0),
                itemCount: value.comments.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return Provider.value(
                    value: value.comments[index],
                    child: const CommentWidget(),
                  );
                },
              );
            },
          ),
        ),
        const CommentFieldWidget(),
      ],
    );
  }
}
