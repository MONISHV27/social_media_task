import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/core/user_manager/current_user_provider.dart';
import 'package:social_media/features/authentication/login/view/screens/login_screen.dart';
import 'package:social_media/features/home/view/widgets/home_content_section.dart';
import 'package:social_media/features/posts/data/repositories/post_repository.dart';
import 'package:social_media/features/posts/data/repository_impl/post_repository_impl.dart';
import 'package:social_media/features/posts/data/services/post_service.dart';
import 'package:social_media/features/posts/view_model/post_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 14.0),
        actions: [
          InkWell(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ),
            child: Icon(Icons.logout_outlined),
          ),
        ],
        title: Text(
          'Social hint',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        shape: LinearBorder.bottom(
          side: BorderSide(color: Color(0xFFE2E8F0), width: 2.0),
        ),
      ),
      body: MultiProvider(
        providers: [
          Provider<PostRepository>(
            create: (context) => PostRepositoryImpl(service: PostService()),
          ),
          ChangeNotifierProvider(
            create: (context) => PostViewmodel(
              context.read<PostRepository>(),
              userId: (context.read<CurrentUser>().userId),
            ),
          ),
        ],
        child: const HomeContentSection(),
      ),
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
