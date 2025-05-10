import 'package:flutter/material.dart';
import 'package:soulee/src/features/feed/application/toggle_like_cubit/like_cubit.dart';
import 'package:soulee/src/features/feed/application/post_cubit/get_posts_cubit.dart';
import 'package:soulee/src/features/feed/infarstructure/get_posts_service.dart';
import 'package:soulee/src/features/feed/presentation/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetPostsCubit(GetPostsService())..getPosts()),
        BlocProvider(create: (context) => LikeCubit()),
      ],
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
