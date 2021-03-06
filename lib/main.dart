import 'package:flutter/material.dart';
import 'package:countries_app/routes.dart';
void main() {
  runApp(PalotaCountriesAssessmentApp());
}

class PalotaCountriesAssessmentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.startUp,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}