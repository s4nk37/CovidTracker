import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19tracker/theme.dart';

class CountryWiseData extends StatefulWidget {
  @override
  _CountryWiseDataState createState() => _CountryWiseDataState();
}

class _CountryWiseDataState extends State<CountryWiseData> {
  Map data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: primary,
              height: SizeConfig.safeBlockVertical * 45,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 7, SizeConfig.safeBlockVertical * 12, SizeConfig.safeBlockHorizontal * 7, SizeConfig.safeBlockVertical * 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 70,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              formattedDate,
                              style: TextStyle(
                                color: white,
                                fontSize: SizeConfig.blockSizeHorizontal * 4,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 1,
                            ),
                            Text(
                              'Corona Virus Cases in ',
                              style: TextStyle(
                                color: white,
                                fontSize:
                                SizeConfig.safeBlockHorizontal * 5,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 1,
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
                                    color: white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        data['country'],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                          SizeConfig.safeBlockHorizontal * 5,
                                        ),
                                      ),
                                      Icon(Icons.edit_location,color: Colors.black54,),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                }),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 1.5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  '${data['cases']} ',
                                  style: TextStyle(
                                    color: white,
                                    fontSize:
                                    SizeConfig.safeBlockHorizontal * 10,
                                  ),
                                ),
                                Text(
                                  '+ ${data['todayCases']}',
                                  style: TextStyle(
                                    color: white,
                                    fontSize:
                                    SizeConfig.safeBlockHorizontal * 5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: data['iso2'] == null ? Image.network(data['flag'],height: 50, width:60) : Image.asset('flags/${data['iso2'].toLowerCase()}.png',height: 50, width:60),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: background,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 6),
                child: Transform.translate(
                  offset: Offset(
                      0.0, -(SizeConfig.safeBlockVertical * 6.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 50,
                            child: Card(
                              color: white,
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'DEATHS',
                                      style: TextStyle(
                                        fontSize: SizeConfig
                                            .safeBlockHorizontal *
                                            4.5,
                                      ),
                                    ),
                                    Text(
                                      data['deaths'],
                                      style: TextStyle(
                                        fontSize: SizeConfig
                                            .safeBlockHorizontal *
                                            8,
                                        color: primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 50,
                            child: Card(
                              color: white,
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
                                      style: TextStyle(
                                        fontSize: SizeConfig
                                            .safeBlockHorizontal *
                                            4.5,
                                      ),
                                    ),
                                    Text(
                                      data['recovered'],
                                      style: TextStyle(
                                        fontSize: SizeConfig
                                            .safeBlockHorizontal *
                                            8,
                                        color: green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), //Recovered & Deaths Cards
                      Card(
                        color: white,
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
                                      style: TextStyle(
                                        fontSize: SizeConfig
                                            .safeBlockHorizontal *
                                            4.5,
                                      ),
                                    ),
                                    Text(
                                      data['active'],
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
                                          int.parse( data['active']) -
                                              int.parse( data['critical']),
                                          int.parse(
                                            data['active'],)),
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
                                            data['critical'],),
                                          int.parse(
                                              data['active'])),
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
                      ), // Active & Mild Critical Percentage Card
                      Card(
                        color: white,
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
                                      'CRITICAL',
                                      style: TextStyle(
                                        fontSize: SizeConfig
                                            .safeBlockHorizontal *
                                            4.5,
                                      ),
                                    ),
                                    Text(
                                      data['critical'],
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
                                      'NEW DEATHS',
                                      style: TextStyle(
                                        fontSize: SizeConfig
                                            .safeBlockHorizontal *
                                            4.5,
                                      ),
                                    ),
                                    Text(
                                      data['todayDeaths'],
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
                      ), //Serious New Card
                      Card(
                        color: white,
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
                                      'NO OF TESTS',
                                      style: TextStyle(
                                        fontSize: SizeConfig
                                            .safeBlockHorizontal *
                                            4.5,
                                      ),
                                    ),
                                    Text(
                                      data['tests'],
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
                                      'CASES/MILLION',
                                      style: TextStyle(
                                        fontSize: SizeConfig
                                            .safeBlockHorizontal *
                                            4.5,
                                      ),
                                    ),
                                    Text(
                                      data['casesPerOneMillion'],
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
                      ), //No of Tests Card & Affected Countries
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
