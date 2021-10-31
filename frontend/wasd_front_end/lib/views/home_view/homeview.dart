import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/core/notifier/authentication_notifier.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
          await authenticationNotifier.fetchUserEmail(context: context);
          Navigator.of(context).pushNamed(AddPostRoute);
        },
      ),
    );
  }
}