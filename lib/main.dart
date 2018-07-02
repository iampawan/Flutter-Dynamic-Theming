import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//Using Bloc
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(snapshot.data)),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool darkThemeEnabled;

  HomePage(this.darkThemeEnabled);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Theme"),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Dark Theme"),
              trailing: Switch(
                value: darkThemeEnabled,
                onChanged: bloc.changeTheme,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();

//Using Stateful

// class MyApp extends StatefulWidget {
//   @override
//   MyAppState createState() {
//     return new MyAppState();
//   }
// }

// class MyAppState extends State<MyApp> {
//   bool darkTheme = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("App"),
//         ),
//         body: Center(),
//         drawer: Drawer(
//           child: ListView(
//             children: <Widget>[
//               ListTile(
//                 title: Text("Dark Theme"),
//                 trailing: Switch(
//                   value: darkTheme,
//                   onChanged: (changed) {
//                     setState(() {
//                       darkTheme = changed;
//                     });
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
//     );
//   }
// }
