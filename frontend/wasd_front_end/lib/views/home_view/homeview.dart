import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
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
          // final authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
          // await authenticationNotifier.fetchUserEmail(context: context);
          // Navigator.of(context).pushNamed(AddPostRoute);
        },
      ),
    );
  }
}