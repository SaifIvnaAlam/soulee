import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulee/src/features/feed/application/post_cubit/get_posts_cubit.dart';
import 'package:soulee/src/features/feed/presentation/components/post_card.dart';
import 'package:soulee/src/features/feed/presentation/components/top_navigation_bar.dart';
import 'package:soulee/src/features/post/presentation/post_details_page.dart';
import 'package:soulee/src/features/post_form/presentation/post_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(20),
        leading: Padding(padding: const EdgeInsets.all(8.0), child: Image.asset("assets/png/App_logo.png")),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30))],
      ),
      body: Column(
        children: [
          TopNavigationBar(),

          Expanded(
            child: BlocBuilder<GetPostsCubit, GetPostsState>(
              builder: (context, state) {
                return state.map(
                  loading: (_) {
                    return Center(child: CircularProgressIndicator());
                  },
                  loaded: (data) {
                    return ListView.builder(
                      itemCount: data.posts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).push(MaterialPageRoute(builder: (context) => PostDetailsPage(post: data.posts[index])));
                            },
                            child: Column(children: [PostCard(post: data.posts[index]), Divider(thickness: 4)]),
                          ),
                        );
                      },
                    );
                  },
                  error: (_) {
                    return Center(child: Text("404 something went wrong"));
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: SizedBox(
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Color(0xffff675c),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PostFormPage()));
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
