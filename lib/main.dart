import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/core/user_manager/current_user_provider.dart';
import 'package:social_media/features/form_builder/view/screen/form_builder_screen.dart';
import 'package:social_media/features/home/view/screens/home_screen.dart';
import 'package:social_media/features/posts/data/repositories/post_repository.dart';
import 'package:social_media/features/posts/data/repository_impl/post_repository_impl.dart';
import 'package:social_media/features/posts/data/services/post_service.dart';
import 'package:social_media/features/posts/view_model/post_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiProvider(
        providers: [
          Provider(create: (_) => CurrentUser(userId: 'Tf9PybclcoaQIGpwgLy6')),
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
        child: const FormBuilderScreen(),
      ),
    );
  }
}
