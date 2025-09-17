import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:candela_standards/save.dart';
import 'package:flutter/material.dart';

class SettingsWindowButton extends StatelessWidget {
  final Color primary;
  final VoidCallback? onPressed;

  const SettingsWindowButton(
      {super.key, required this.primary, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return WindowButton(
      onPressed: onPressed ??
          () {
            // Default action when clicked
            debugPrint('Settings button clicked!');
          },
      colors: WindowButtonColors(
        iconNormal: Colors.white,
        mouseOver: primary,
      ),
      iconBuilder: (buttonContext) => const Icon(
        Icons.settings_sharp,
        size: 13,
        color: Colors.white,
      ),
    );
  }
}

class SettingsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ListTile(
          title: HorizontalRadioList(),
          onTap: () {
            // Handle settings 1 tap
          },
        ),
        ListTile(
          title: Text('Settings 2'),
          onTap: () {
            // Handle settings 2 tap
          },
        ),
        // Add more settings options here
      ],
    ));
  }
}

class HorizontalRadioList extends StatefulWidget {
  const HorizontalRadioList({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalRadioList> createState() => _HorizontalRadioListState();
}

class _HorizontalRadioListState extends State<HorizontalRadioList> {
  int groupValue = 0;

  void changeRadioValue(int? value) {
    groupValue = value!;
    saveData(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Radio(
                    value: 0,
                    groupValue: groupValue,
                    onChanged: (int? value) {
                      changeRadioValue(value);
                    }),
              ),
              Text('System Default'),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Radio(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (int? value) {
                      changeRadioValue(value);
                    }),
              ),
              Text('Light Mode'),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Radio(
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (int? value) {
                      changeRadioValue(value);
                    }),
              ),
              Text('Dark Mode'),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Radio(
                    value: 3,
                    groupValue: groupValue,
                    onChanged: (int? value) {
                      changeRadioValue(value);
                    }),
              ),
              Text('Monochrome'),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Radio(
                    value: 4,
                    groupValue: groupValue,
                    onChanged: (int? value) {
                      changeRadioValue(value);
                    }),
              ),
              Text('Hacker'),
            ],
          ),
        ),
      ],
    );
  }
}
