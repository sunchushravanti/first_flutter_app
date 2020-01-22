import 'dart:io';
import 'package:FlutTech/MenuPages/ftr_MenuOnePage.dart';
import 'package:FlutTech/GraphRepresentation/ftr_Charts.dart';
import 'package:FlutTech/ftr_CustomForm.dart';
import 'package:FlutTech/MenuPages/ftr_MenuTwoPage.dart';
import 'package:flutter/material.dart';



class ftr_HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ftr_HomeState();

  }
}

class ftr_HomeState extends State<ftr_HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ftr_MenuOnePage(),
    ftr_CustomForm(),
    ftr_MenuTwoPage(Colors.cyan),
    ftr_MenuTwoPage(Colors.brown),

  ];

  initState(){
    super.initState();
  }

  //Application Exit Code
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: ()=> exit(0),/* {
                  Navigator.of(context).pop(true);
                },*/
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: AppBar(
            title: Text('DashBoard'),

            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                },
              ),

              //Menu Items
              PopupMenuButton(
                onSelected:_select,
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        value:1,
                        child: Text('About Us')
                    ),
                    PopupMenuItem(
                        value:2,
                        child: Text('Help')
                    ),
                  ];
                },
              )
            ],
          ),


          body: _children[_currentIndex], // new

          //BottomNavigation Drawer
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped, // new
            currentIndex: _currentIndex, // new
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.notifications, color: Color.fromARGB(255, 0, 0, 0)),
                title: Text('Notifications'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.mail, color: Color.fromARGB(255, 0, 0, 0)),
                title: Text('Messages'),
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Color.fromARGB(255, 0, 0, 0)),
                  title: Text('Profile')
              )
            ],
          ),


         //Navigation drawer
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Shravanti Sunchu"),
                  accountEmail: Text("sunchushravanti5@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.blue : Colors.white,
                    child: Text(
                      "S",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                /* DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,),),*/

                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.donut_small),
                  title: Text('Graph Tutorial'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ftr_Charts()));
                  },
                ),

                Divider(color: Colors.grey, height: .6),

                Divider(color: Colors.white, height: .6),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('  Others ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.black)),
                ),
                ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text('Contact Us'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share App'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ftr_MenuOnePage()));
                  },
                ),
              ],
            ),
          ),



        )
    );
  }


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (_currentIndex == 4) {
    /*Navigator.of(context).pushReplacementNamed('DummyPage');*/

     /* Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new ftr_CustomForm();
      }));*/
    }
  }

  void _select(value) {
    setState(() {
      _currentIndex = value;
    });
    if (_currentIndex == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new ftr_CustomForm();

      }));
    }

  }
}