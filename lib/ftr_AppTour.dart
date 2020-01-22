import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard/ftr_HomePage.dart';


class ftr_AppTour extends StatefulWidget {
  ftr_AppTour({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ftr_AppTourPage createState() => _ftr_AppTourPage();
}

class _ftr_AppTourPage extends State<ftr_AppTour> {

  bool isChecked=false;
  var resultHolder = 'Checkbox is UN-CHECKED';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        children: <Widget>[
          new Container(
            child: Stack(
              children: <Widget>[
                Center(
                  child: new Image.asset(
                    'images/tech_one.jpg',
                    width: size.width,
                    height: size.height,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                    child:Align(
                        alignment: Alignment.bottomRight,
                        child:new Row(
                          children: [
                            Container(
                              child: Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.white),
                                child: Checkbox(
                                  onChanged: (value){toggleCheckbox(value);},
                                  value: isChecked,
                                  activeColor: Colors.redAccent,
                                  checkColor: Colors.white,
                                  tristate: true,

                                ),
                              ),
                            ),
                            Container(
                              child: Text('Skip the tour',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.white)),
                            ),
                          ],
                        )
                    )
                ),
                Center(
                    child:Align(
                        alignment: Alignment.bottomRight,
                        child:new FloatingActionButton(
                          child: Text('1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black)),
                          backgroundColor: Colors.white, onPressed: () {},)
                    )),
              ],
            ),
          ),

          new Container(
            child: Stack(
              children: <Widget>[
                Center(
                  child: new Image.asset(
                    'images/tech_two.jpg',
                    width: size.width,
                    height: size.height,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                    child:Align(
                        alignment: Alignment.bottomRight,
                        child:new FloatingActionButton(
                          child: Text('2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black)),
                          backgroundColor: Colors.white, onPressed: () {},)
                    )),
              ],
            ),
          ),

          new Container(
            child: Stack(
              children: <Widget>[
                Center(
                  child: new Image.asset(
                    'images/tech_three.jpg',
                    width: size.width,
                    height: size.height,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                    child:Align(
                        alignment: Alignment.bottomRight,
                        child:new FloatingActionButton(

                          child: Text('3',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black)),
                          backgroundColor: Colors.white, onPressed: () {},)
                    )),
              ],
            ),
          ),


          new Container(
            child: Stack(
              children: <Widget>[
                Center(
                  child: new Image.asset(
                    'images/tech_four.jpg',
                    width: size.width,
                    height: size.height,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                    child:Align(
                        alignment: Alignment.bottomCenter,
                        child:new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(

                              child:new RaisedButton(onPressed: _onPressed, child: new Text('Continue',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.white)
                              ),
                                color: Colors.blue,
                              ),
                            )
                          ],
                        )
                    )
                ),
                Center(
                    child:Align(
                        alignment: Alignment.bottomRight,
                        child:new FloatingActionButton(
                          child: Text('4',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black)),
                          backgroundColor: Colors.white, onPressed: () {},)
                    )),
              ],
            ),
          ),

        ],
        onPageChanged: (num){
          print("Current page number is "+num.toString());
        },
        //physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        //pageSnapping: false,
      ),
    );
  }

  void toggleCheckbox(bool value) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();

    if(isChecked == false)
    {// Put your code here which you want to execute on CheckBox Checked event.
      setState((){
        isChecked = true;
        _save();

      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => ftr_HomePage()));

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        _save();
      });
    }
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'checkStateValue';
    final value = isChecked;
    prefs.setBool(key, value);
    prefs.commit();
    print('saved $value');
  }

  void _onPressed() {
    setState((){
      isChecked = true;
      _save();
    });
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ftr_HomePage()));

  }
}