import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/features/stories/view/widgets/story_player_widget.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: StoryPlayerWidget(path: context.read<String>()),
      ),
    );
  }
}
