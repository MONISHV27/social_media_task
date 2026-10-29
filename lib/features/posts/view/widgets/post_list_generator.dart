import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:social_media/features/posts/view/widgets/post_widget.dart';
import 'package:social_media/features/posts/view_model/post_viewmodel.dart';

class PostListGenerator extends StatelessWidget {
  const PostListGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<PostViewmodel, PostUIState>(
      selector: (context, value) => value.postState,
      builder: (context, data, child) {
        return switch (data) {
          //   PostFailureState() => SliverFillRemaining(
          //     child: Center(
          //       child: Text(
          //         data.message,
          //         style: const TextStyle(fontWeight: FontWeight.w500),
          //       ),
          //     ),
          //   ),
          PostSuccessState() => SliverList.separated(
            itemCount: data.posts.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8.0),
            itemBuilder: (context, index) {
              return PostWidget(postInfo: data.posts[index]);
            },
          ),
          // _ => const SliverFillRemaining(
          //   child: Center(
          //     child: SizedBox(height: 100, width: 100, child: Icon(Icons.abc)),

          //     //  CircularProgressIndicator(
          //     //   color: ColorTheme.avatarBorderColor,
          //     // ),
          //   ),

          // PostLoadingState()
          _ => const SliverFillRemaining(
            child: Center(
              child: SpinKitFadingCircle(color: Color(0xFF828282), size: 50.0),

              //  CircularProgressIndicator(
              //   color: ColorTheme.avatarBorderColor,
              // ),
            ),
          ),
        };
      },
    );
  }
}
