import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wasd_front_end/core/notifier/authenticationnotifier.dart';

List<SingleChildWidget> providers = [...remoteProvider];
// Independent Providers
List<SingleChildWidget> remoteProvider = [
  ChangeNotifierProvider(create: (_) => AuthenticationNotifier())
];