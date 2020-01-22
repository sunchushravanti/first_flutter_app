import 'package:flutter/material.dart';

class ftr_CustomForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {

  Map<String,bool> values={
    "Programming":false,
    "Skills ":false,
  };
  final _formKey = GlobalKey<FormState>();

  var _passKey = GlobalKey<FormFieldState>();

  int _radioValue1;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
        key: _formKey,
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration( hintText: 'First Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your firstname';
                  }
                  return null;
                },
              ),
              //EMAIL ADDRESS
              TextFormField(
                decoration: InputDecoration(hintText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
              ),

              //AGE
              TextFormField(
                decoration: InputDecoration(hintText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter age';
                  }
                  return null;
                },
              ),

              //Password
              TextFormField(
                  key: _passKey,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value.isEmpty){ return 'Please Enter password';}

                    if (value.length < 8) {
                      return 'Password should be more than 8 characters';
                    }
                  }),
              //Confirm Password
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Confirm Password'),
                  validator: (confirmPassword) {
                    if (confirmPassword.isEmpty) {
                      return 'Enter confirm password';
                    }
                    /*var password = _passKey.currentState.value;
         if (!eq()confirmPassworpassword) {
           return 'Confirm Password invalid';
         }*/
                  }
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    new Text(
                      'Gender :',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                    new Radio(
                      value: 0,
                      groupValue: _radioValue1,
                      onChanged: (e)=> something(e),
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Female',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                      groupValue: _radioValue1,
                      onChanged: (e)=> something(e),
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Male',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ]
              ),

            /*  new Text(
                  'Male',
                  style: new TextStyle(
                    fontSize: 16.0,
                  )),
            */  Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Submit'),
                ),
              ),

            ],
          ),
        )
    );
  }


  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  void something(e) {
    setState(() {
      if(e == 0){
        _radioValue1= 0;
      }
      else if(e==1){
        _radioValue1=1;

      }
      else{
        return 'Select your gender';
      }

    });
  }


}
