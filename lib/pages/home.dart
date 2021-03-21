import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:covid19tracker/pages/loader.dart';
import 'package:covid19tracker/theme.dart';
import 'package:flutter/services.dart';

import '../services/widgets.dart';

Future<WorldData> fetchWorldData() async {
  final response = await http.get('https://corona.lmao.ninja/v2/all');
  if (response.statusCode == 200) {
    return WorldData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

class WorldData {
  final String cases;
  final String deaths;
  final String recovered;
  final String active;
  final String critical;
  final String todayCases;
  final String tests;
  final String affectedCountries;
  final String todayDeaths;

  WorldData(
      {this.cases,
      this.deaths,
      this.recovered,
      this.active,
      this.critical,
      this.todayCases,
      this.tests,
      this.affectedCountries,
      this.todayDeaths});

  factory WorldData.fromJson(Map<String, dynamic> json) {
    return WorldData(
      cases: json['cases'].toString(),
      deaths: json['deaths'].toString(),
      recovered: json['recovered'].toString(),
      active: json['active'].toString(),
      critical: json['critical'].toString(),
      todayCases: json['todayCases'].toString(),
      tests: json['tests'].toString(),
      affectedCountries: json['affectedCountries'].toString(),
      todayDeaths: json['todayDeaths'].toString(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<WorldData> futureWorldData;
  @override
  void initState() {
    super.initState();
    futureWorldData = fetchWorldData();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Theme.of(context).scaffoldBackgroundColor, // status bar color
    ));
    SizeConfig().init(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<WorldData>(
          future: futureWorldData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).primaryColor,
                      height: SizeConfig.safeBlockVertical * 40,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical * 8,
                            horizontal: SizeConfig.safeBlockHorizontal * 7),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                formattedDate,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical * 0.6,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Corona Virus Cases in ',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.safeBlockHorizontal *
                                                    2.5,
                                            vertical:
                                                SizeConfig.safeBlockVertical *
                                                    0.5),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).buttonColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'World',
                                              style: TextStyle(
                                                color: darkGrey,
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal *
                                                    5,
                                              ),
                                            ),
                                            Icon(
                                              Icons.edit_location,
                                              color: darkGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/location');
                                      }),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical * 0.8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    '${snapshot.data.cases} ',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    '+ ${snapshot.data.todayCases}',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Theme.of(context).backgroundColor,
                      height: SizeConfig.safeBlockVertical * 60,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 6),
                        child: Transform.translate(
                          offset: Offset(
                              0.0, -(SizeConfig.safeBlockVertical * 6.5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              TwoCardRow(
                                  deaths: snapshot.data.deaths,
                                  recovered: snapshot.data.recovered,
                                  theme: theme), //Recovered & Deaths Cards
                              PercentageCard(
                                  active: snapshot.data.active,
                                  critical: snapshot.data.critical,
                                  theme:
                                      theme), // Active & Mild Critical Percentage Card
                              Card2(
                                  label: 'CRITICAL',
                                  no: snapshot.data.critical,
                                  label2: 'NEW DEATHS',
                                  no2: snapshot.data.todayDeaths,
                                  theme: theme), //Serious New Deaths Card
                              Card2(
                                  label: 'NO OF TESTS',
                                  no: snapshot.data.tests,
                                  label2: 'COUNTRIES',
                                  no2: snapshot.data.affectedCountries,
                                  theme:
                                      theme), //No of Tests Card & Affected Countries
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text(
                  'No Internet Connection!',
                  style: TextStyle(
                      color: primary,
                      fontSize: SizeConfig.safeBlockHorizontal * 8),
                ),
              );
            }
            return StayHome();
          },
        ),
      ),
    );
  }
}
