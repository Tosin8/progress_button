import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';


void main() {
  runApp(const MaterialApp(title: 'Progress Demo', home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ButtonState stateOnlyText = ButtonState.idle;
    ButtonState stateTextWithIcon = ButtonState.idle;

    return Scaffold(
        body: Center(
      child: ProgressButton.icon(
        iconedButtons: {
        ButtonState.idle: IconedButton(
          text: 'Send',
          icon: const Icon(Icons.send, color: Colors.white),
          color: Colors.deepPurple.shade500), 
          ButtonState.loading: IconedButton(text: 'Loading', color: Colors.deepPurple.shade700),
          ButtonState.fail: IconedButton(text: 'Failed', icon: const Icon(Icons.cancel, color: Colors.white), 
          color: Colors.red.shade300), 
          ButtonState.success: const IconedButton(text: 'Success': icon: Icon(Icons.check_circle, color: Colors.white, ), 
          color: Colors.green.shade400
        )
      },onPressed: onPressedIconWithText, state: stateTextWithIcon),
    ));
  }
}


void onPressedIconWithText(){
  switch (stateTextWithIcon) {
    case ButtonState.idle: stateTextWithIcon = ButtonState.loading;
    Future.delayed(const Duration(seconds: 1), 
    (){
      setState((){
        stateTextWithIcon = Random.secure().nextBool() ? ButtonState.success : ButtonState.fail;
      }); 
    }); 
     break;

    case ButtonState.loading: break;
    case ButtonState.success: stateTextWithIcon = ButtonState.idle; break;
    case ButtonState.fail: stateTextWithIcon = ButtonState.idle; break;
  }
  setState(
    () {
      stateTextWithIcon = stateTextWithIcon;
    },
    );
}
