import 'package:fingerprint_auth_example/api/github_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'api/local_auth_api.dart';
import 'page/fingerprint_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'github repos';
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          //github api
          ChangeNotifierProvider(
            create: (context) => GithubAPI(),
          ),

          //auth
          ChangeNotifierProvider(
            create: (context) => LocalAuthApi(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.purple),
          home: FingerprintPage(),
        ),
      );
}
