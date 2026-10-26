import 'package:flutter/material.dart';
import 'package:social_media/features/home/view/widgets/home_content_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social'),
        shape: LinearBorder.bottom(
          side: BorderSide(color: Color(0xFFE2E8F0), width: 2.0),
        ),
      ),
      body: const HomeContentSection(),
    );
  }
}

 //  Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   // spacing: 4.0,
      //   children: [
      //     SizedBox(height: 8.0),
      //     SizedBox(height: 100, child: StoryListGenerator()),
      //     SizedBox(height: 12.0),

      //     Expanded(
      //       child: SizedBox(
      //         child: Container(
      //           // color: Colors.yellow,
      //           child: SingleChildScrollView(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.stretch,
      //               spacing: 16.0,
      //               children: [
      //                 ...List.generate(5, (index) {
      //                   return AspectRatio(
      //                     aspectRatio: 1.0,
      //                     child: PostWidget(),
      //                   );
      //                 }),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
