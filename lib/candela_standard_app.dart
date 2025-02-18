import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:candela_standards/candela_standard_app_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {}

class CandelaStandardAppWindow extends StatelessWidget {
  final CandelaStandardAppProfile profile;
  final Widget child;

  const CandelaStandardAppWindow({
    super.key,
    required this.profile,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: profile.text,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.dark(
              primary: profile.primary, secondary: profile.secondary),
        ),
        home: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [profile.primary, profile.secondary],
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
                              SizedBox(width: 30, child: Icon(profile.icon)),
                              Text(
                                profile.text,
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
                      WindowButtons(primary: profile.primary),
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
