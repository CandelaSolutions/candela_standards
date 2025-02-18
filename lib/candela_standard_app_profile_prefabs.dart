import 'package:candela_standards/candela_standard_app_profile.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

//File Browser / Web Browser
final wayfinder = CandelaStandardAppProfile(
    icon: Symbols.folder_open,
    iconScale: 925,
    text: "Wayfinder",
    primary: Color.fromARGB(255, 58, 58, 58),
    secondary: Color.fromARGB(255, 105, 105, 105),
    invertIconGradient: false);

// Game / Program Manager
final arcade = CandelaStandardAppProfile(
    icon: Symbols.joystick,
    iconScale: 1000,
    text: "Arcade",
    primary: Color.fromARGB(255, 129, 0, 32),
    secondary: Color.fromARGB(255, 202, 48, 45),
    invertIconGradient: false);

// Productivity
final filament = CandelaStandardAppProfile(
    icon: Icons.emoji_objects_outlined,
    iconScale: 1100,
    text: "Filament",
    primary: Color.fromARGB(255, 224, 134, 0),
    secondary: Color.fromARGB(255, 239, 191, 56),
    invertIconGradient: true);

// Communications
final harbinger = CandelaStandardAppProfile(
    icon: Icons.inbox_outlined,
    iconScale: 950,
    text: "Harbinger",
    primary: Color.fromARGB(255, 1, 68, 33),
    secondary: Color.fromARGB(255, 53, 94, 59),
    invertIconGradient: false);

// Listening
final orelo = CandelaStandardAppProfile(
    icon: Icons.hearing,
    iconScale: 950,
    text: "Orelo",
    primary: Color.fromARGB(255, 47, 79, 79),
    secondary: Color.fromARGB(255, 54, 117, 136),
    invertIconGradient: false);

final dungeon = CandelaStandardAppProfile(
    icon: Symbols.strategy,
    iconScale: 850,
    text: "Dungeon",
    primary: Color.fromARGB(255, 89, 41, 134),
    secondary: Color.fromARGB(255, 160, 131, 201),
    invertIconGradient: false);

final okulo = CandelaStandardAppProfile(
    icon: Icons.visibility,
    iconScale: 950,
    text: "Okulo",
    primary: Color.fromARGB(255, 179, 79, 71),
    secondary: Color.fromARGB(255, 247, 113, 112),
    invertIconGradient: false);
