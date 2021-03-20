import 'package:flutter/material.dart';
import 'package:covid19tracker/theme.dart';

 Row TwoCardRow ({@required this.deaths,@required this.recovered,@required this.theme}){
  final String deaths;
  final String recovered;
  final ThemeData theme;
  TwoCardRow({@required this.deaths,@required this.recovered,@required this.theme});

  return Row(
  children: <Widget>[
  Expanded(
  flex: 50,
  child: Card(
  child: Padding(
  padding: EdgeInsets.symmetric(
  vertical:
  SizeConfig.safeBlockVertical *
  2,
  horizontal:
  SizeConfig.safeBlockHorizontal *
  3.5),
  child: Column(
  mainAxisAlignment:
  MainAxisAlignment.spaceBetween,
  crossAxisAlignment:
  CrossAxisAlignment.start,
  children: <Widget>[
  Text(
  'DEATHS',
  style: theme.textTheme.bodyText1,
  ),
  Text(
  deaths,
  style: theme.textTheme.bodyText2,
  ),
  ],
  ),
  ),
  ),
  ),
  Expanded(
  flex: 50,
  child: Card(
  color: theme.cardColor,
  shape: RoundedRectangleBorder(
  borderRadius:
  BorderRadius.circular(15.0),
  ),
  child: Padding(
  padding: EdgeInsets.symmetric(
  vertical:
  SizeConfig.safeBlockVertical *
  2,
  horizontal:
  SizeConfig.safeBlockHorizontal *
  3.5),
  child: Column(
  crossAxisAlignment:
  CrossAxisAlignment.start,
  children: <Widget>[
  Text(
  'RECOVERED',
  style: theme.textTheme.bodyText1,
  ),
  Text(
  recovered,
  style: theme.textTheme.bodyText2,
  ),
  ],
  ),
  ),
  ),
  ),
  ],
  );
}

class PercentageCard extends StatelessWidget {
   final String active;
   final String critical;
   final ThemeData theme;
  PercentageCard({
     @required this.active,@required this.critical,@required this.theme
});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical:
            SizeConfig.safeBlockVertical * 2,
            horizontal:
            SizeConfig.safeBlockHorizontal * 3.5),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 55,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ACTIVE CASES',
                    style: theme.textTheme.bodyText1,
                  ),
                  Text(
                    active,
                    style: theme.textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.arrow_downward,
                    color: green,
                    size: SizeConfig
                        .safeBlockHorizontal *
                        4,
                  ),
                  SizedBox(
                    height: SizeConfig
                        .safeBlockHorizontal *
                        3,
                  ),
                  Icon(
                    Icons.arrow_upward,
                    color: primary,
                    size: SizeConfig
                        .safeBlockHorizontal *
                        4,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 38,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    calc(
                        int.parse(active) -
                            int.parse(critical),
                        int.parse(
                            active)),
                    style: TextStyle(
                      fontSize: SizeConfig
                          .safeBlockHorizontal *
                          4,
                    ),
                  ),
                  Text(
                    'Mild Condition',
                    style: TextStyle(
                      fontSize: SizeConfig
                          .safeBlockHorizontal *
                          3,
                      color: grey,
                    ),
                  ),
                  SizedBox(
                    height:
                    SizeConfig.safeBlockVertical *
                        1.5,
                  ),
                  Text(
                    calc(
                        int.parse(
                            critical),
                        int.parse(
                            active)),
                    style: TextStyle(
                      fontSize: SizeConfig
                          .safeBlockHorizontal *
                          4,
                    ),
                  ),
                  Text(
                    'Critical Condition',
                    style: TextStyle(
                      fontSize: SizeConfig
                          .safeBlockHorizontal *
                          3,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  final String label;
  final String no;
  final ThemeData theme;
  final String label2;
  final String no2;

  Card2({
    @required this.label,
    @required this.no,
    @required this.label2,
    @required this.no2,@required this.theme
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical:
            SizeConfig.safeBlockVertical * 2,
            horizontal:
            SizeConfig.safeBlockHorizontal * 3.5),
        child: Row(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 55,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: SizeConfig
                          .safeBlockHorizontal *
                          4.5,
                    ),
                  ),
                  Text(
                    no,
                    style: TextStyle(
                      fontSize: SizeConfig
                          .safeBlockHorizontal *
                          8,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 45,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    label2,
                    style: TextStyle(
                      fontSize: SizeConfig
                          .safeBlockHorizontal *
                          4.5,
                    ),
                  ),
                  Text(
                    no2,
                    style: TextStyle(
                      fontSize: SizeConfig
                          .safeBlockHorizontal *
                          8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
