import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/theme/color_themes.dart';
import 'package:social_media/core/user_manager/current_user_provider.dart';
import 'package:social_media/features/authentication/login/view/screens/login_screen.dart';
import 'package:social_media/features/form_builder/view/screen/form_builder_screen.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 14.0),
        actions: [
          Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),

              side: BorderSide(color: Color(0xFFd4dfed)),
            ),
            child: InkWell(
              radius: 20.0,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormBuilderScreen(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.receipt_long_rounded),
              ),
            ),
          ),
          const SizedBox(width: 6.0),
          Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),

              side: BorderSide(color: Color(0xFFd4dfed)),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              radius: 20.0,
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.logout_outlined),
              ),
            ),
          ),
        ],
        title: const Text(
          'Social hint',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: LinearBorder.bottom(
          side: BorderSide(color: ColorTheme.borderColor, width: 2.0),
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
