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
      appBar: AppBar(
        backgroundColor: Colors.white,
        actionsPadding: const EdgeInsets.only(right: 14.0),
        actions: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormBuilderScreen(),
              ),
            ),
            child: const Icon(Icons.receipt_long_rounded),
          ),
          const SizedBox(width: 12.0),
          InkWell(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ),
            child: const Icon(Icons.logout_outlined),
          ),
        ],
        title: const Text(
          'Social hint',
          style: TextStyle(fontStyle: FontStyle.italic),
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
