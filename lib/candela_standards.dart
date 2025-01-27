import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {}

class CandelaStandardApp extends StatelessWidget {
  final Icon icon;
  final String text;
  final Color primary;
  final Color secondary;
  final Widget child;

  const CandelaStandardApp({
    super.key,
    required this.icon,
    required this.text,
    required this.primary,
    required this.secondary,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: text,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.dark(primary: primary, secondary: secondary),
        ),
        home: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [primary, secondary],
              stops: [0, 1],
            ),
          ),
          child: Column(
            children: [
              if (kIsWeb)
                SizedBox(height: 4)
              else if (Platform.isWindows)
                WindowTitleBarBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: MoveWindow(
                          child: Row(
                            children: [
                              SizedBox(width: 30, child: icon),
                              Text(
                                text,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      WindowButtons(primary: primary),
                    ],
                  ),
                )
              else if (Platform.isAndroid)
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  final Color primary;

  const WindowButtons({super.key, required this.primary});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: WindowButtonColors(
            mouseOver: primary,
            iconNormal: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        MaximizeWindowButton(
          colors: WindowButtonColors(
            mouseOver: primary,
            iconNormal: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        CloseWindowButton(
          colors: WindowButtonColors(
            iconNormal: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ],
    );
  }
}
