import 'package:flutter/material.dart';
import 'package:covid19tracker/pages/home.dart';
import 'package:covid19tracker/pages/choose_location.dart';
import 'package:covid19tracker/pages/country.dart';
import 'package:covid19tracker/theme.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  routes: {
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
    '/countrywise': (context) => CountryWiseData(),
  },

));
