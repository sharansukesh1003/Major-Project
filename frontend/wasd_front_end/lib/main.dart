import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/app/providers/provider.dart';
import 'package:wasd_front_end/app/routes/routes.dart';

void main() {
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const Lava()
      );
    }
}
class Lava extends StatelessWidget{
  const Lava({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: DeciderRoute,
      routes: routes,
      );
  }
}