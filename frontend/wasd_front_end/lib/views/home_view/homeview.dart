// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, unnecessary_const
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/core/model/post_model.dart';
import 'package:wasd_front_end/core/notifier/authentication_notifier.dart';
import 'package:wasd_front_end/core/notifier/post_notifier.dart';
// ignore: use_key_in_widget_constructors
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostNotifier postNotifier(bool renderUri) => Provider.of<PostNotifier>(context,listen: renderUri);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          postNotifier(false).fetchPost(context: context);
          final authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
          await authenticationNotifier.fetchUserEmail(context: context);
          Navigator.of(context).pushNamed(AddPostRoute);
        },
      ),
      body : Container(
        child: FutureBuilder(
          future: postNotifier(false).fetchPost(context: context),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: const CircularProgressIndicator(),
              );
            }
            else{
              var _snapshot = snapshot.data as List;
              return ListOfPosts(snapshot: _snapshot);
            }
          }
        ),
      )
    );
  }
}

class ListOfPosts extends StatelessWidget {
  final dynamic snapshot;
  const ListOfPosts({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.length,
      itemBuilder: (context, index){
        PostData postData = snapshot[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(postData.postImages[0]),
          ),
          title: Text(postData.postTitle),
        );
      }
    );
  }
}