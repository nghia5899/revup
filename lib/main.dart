import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revup_ui/screen/account/account.dart';
import 'package:revup_ui/screen/request/detail-service-request.dart';
import 'package:revup_ui/screen/request/info-request.dart';
import 'package:revup_ui/screen/request/repair-completed.dart';
import 'package:revup_ui/screen/request/select-option-complete.dart';
import 'package:revup_ui/screen/service/add-service.dart';
import 'package:revup_ui/styles/theme.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        title: 'Revup App',
        theme: appThemeData[AppTheme.Light],
        debugShowCheckedModeBanner: false,
        home: const AddService(),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
