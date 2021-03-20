import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:covid19tracker/services/covid_data.dart';
import 'package:http/http.dart' as http;
import 'package:covid19tracker/pages/loader.dart';
import 'package:covid19tracker/theme.dart';
import 'package:flutter/services.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";
  List<Countries> _filterList;
  List<Countries> _originalList;
  _ChooseLocationState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal*5.5),
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
                  child: Text(
                    'World',
                    style: TextStyle(
                      color: grey,
                      fontSize: SizeConfig
                          .safeBlockHorizontal *
                          5,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(
                      context);
                }),
          ],
        ),
        iconTheme: IconThemeData(
          color: grey,
        ),
      ),
      body: new FutureBuilder<List<Countries>>(
        future: fetchCountries(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _originalList = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB( SizeConfig.safeBlockHorizontal * 10, 0,  SizeConfig.safeBlockHorizontal * 10, SizeConfig.safeBlockVertical*5),
                  child: new TextField(
                    controller: _searchview,
                    decoration: InputDecoration(
                      hintText: 'Search..',
                      focusColor: Colors.red,
                      fillColor: white,
                      filled: true,
                      border: new OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                _firstSearch ? a(snapshot.data) : _performSearch()
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text(
                'No Internet Connection!',
                style: TextStyle(color: primary, fontSize: SizeConfig.safeBlockHorizontal*8),
              ),
            );
          }
          return Center(child: Hand());
        },
      ),
    );
  }

  Expanded a(var d) {
    return Expanded(
        child: new ListView.builder(
            itemCount: d.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/countrywise', arguments: {
                    'country': d[index].country.toString(),
                    'flag': d[index].countryInfo.flag.toString(),
                    'cases': d[index].cases.toString(),
                    'active': d[index].active.toString(),
                    'critical': d[index].critical.toString(),
                    'tests': d[index].tests.toString(),
                    'deaths': d[index].deaths.toString(),
                    'casesPerOneMillion':
                    d[index].casesPerOneMillion.toString(),
                    'deathsPerOneMillion':
                    d[index].deathsPerOneMillion.toString(),
                    'todayDeaths': d[index].todayDeaths.toString(),
                    'todayCases': d[index].todayCases.toString(),
                    'recovered': d[index].recovered.toString(),
                    'iso2': d[index].countryInfo.iso2.toString(),
                  });
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 0.0),
                  elevation: 1.0,
                  color: white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 15,
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                          width: 35,
                          child: d[index].countryInfo.iso2 == null
                              ? Image.network(
                            d[index].countryInfo.flag,
                          )
                              : Image.asset(
                              'flags/${d[index].countryInfo.iso2.toLowerCase()}.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(child: Text(d[index].country)),
                        Text(
                          d[index].cases.toString(),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

//Perform actual search
  Widget _performSearch() {
    _filterList = new List<Countries>();
    for (int i = 0; i < _originalList.length; i++) {
      var item = _originalList[i].country;

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(_originalList[i]);
      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    return new Expanded(
      child: new ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/countrywise', arguments: {
                  'country': _filterList[index].country.toString(),
                  'flag': _filterList[index].countryInfo.flag.toString(),
                  'cases': _filterList[index].cases.toString(),
                  'active': _filterList[index].active.toString(),
                  'critical': _filterList[index].critical.toString(),
                  'tests': _filterList[index].tests.toString(),
                  'deaths': _filterList[index].deaths.toString(),
                  'casesPerOneMillion':
                  _filterList[index].casesPerOneMillion.toString(),
                  'deathsPerOneMillion':
                  _filterList[index].deathsPerOneMillion.toString(),
                  'todayDeaths': _filterList[index].todayDeaths.toString(),
                  'todayCases': _filterList[index].todayCases.toString(),
                  'recovered': _filterList[index].recovered.toString(),
                  'iso2': _filterList[index].countryInfo.iso2.toString(),
                });
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 0.0),
                elevation: 1.0,
                color: white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 15,
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                        width: 35,
                        child: _filterList[index].countryInfo.iso2 == null
                            ? Image.network(
                          _filterList[index].countryInfo.flag,
                        )
                            : Image.asset(
                            'flags/${_filterList[index].countryInfo.iso2.toLowerCase()}.png'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(child: Text(_filterList[index].country)),
                      Text(
                        _filterList[index].cases.toString(),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
