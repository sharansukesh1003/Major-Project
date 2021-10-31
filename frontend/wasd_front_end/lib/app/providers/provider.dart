import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wasd_front_end/core/notifier/authentication_notifier.dart';
import 'package:wasd_front_end/core/notifier/post_notifier.dart';
import 'package:wasd_front_end/core/notifier/utility_notifier.dart';

List<SingleChildWidget> providers = [...remoteProvider];
// Independent Providers
List<SingleChildWidget> remoteProvider = [
  ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
  ChangeNotifierProvider(create: (_) => UtilityNotifier()),
  ChangeNotifierProvider(create: (_) => PostNotifier()),
];