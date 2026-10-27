import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/theme/field_border_style.dart';
import 'package:social_media/features/posts/view_model/comment_view_model.dart';

class CommentFieldWidget extends StatefulWidget {
  const CommentFieldWidget({super.key});

  @override
  State<CommentFieldWidget> createState() => _CommentFieldWidgetState();
}

class _CommentFieldWidgetState extends State<CommentFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapUpOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: _controller,
      decoration: InputDecoration(
        focusedBorder: FieldBorderStyle.commentFieldStyle,
        focusedErrorBorder: FieldBorderStyle.commentFieldStyle,
        disabledBorder: FieldBorderStyle.commentFieldStyle,
        enabledBorder: FieldBorderStyle.commentFieldStyle,
        suffixIcon: GestureDetector(
          onTap: () {
            if (context.read<CommentViewModel>().state
                is CommentProcessingState) {
              return;
            }
            context.read<CommentViewModel>().addComment(_controller.text);
            _controller.text = "";
          },
          child: const Icon(
            Icons.send,
            color: Color.fromARGB(255, 245, 119, 161),
          ),
        ),
        hintText: 'Type comment...',
        border: FieldBorderStyle.commentFieldStyle,
      ),
    );
  }
}
