import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:candela_standards/candela_standard_app_profile.dart';
import 'package:candela_standards/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {}

class CandelaStandardAppWindow extends StatefulWidget {
  final CandelaStandardAppProfile profile;
  final Widget child;

  const CandelaStandardAppWindow({
    super.key,
    required this.profile,
    required this.child,
  });

  @override
  State<CandelaStandardAppWindow> createState() =>
      _CandelaStandardAppWindowState();
}

class _CandelaStandardAppWindowState extends State<CandelaStandardAppWindow> {
  int settingsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: widget.profile.text,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.light(
              primary: widget.profile.primary,
              secondary: widget.profile.secondary),
        ),
        home: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [widget.profile.primary, widget.profile.secondary],
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
                              SizedBox(
                                  width: 30,
                                  child: Icon(
                                    widget.profile.icon,
                                    color: Colors.white,
                                  )),
                              Text(
                                widget.profile.text,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SettingsWindowButton(
                                primary: widget.profile.secondary,
                                onPressed: () => setState(() {
                                  settingsIndex = (settingsIndex + 1) % 2;
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      WindowButtons(primary: widget.profile.primary),
                    ],
                  ),
                )
              else if (Platform.isAndroid)
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
              Expanded(
                  child: IndexedStack(
                index: settingsIndex,
                children: [widget.child, SettingsMenu()],
              )),
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
