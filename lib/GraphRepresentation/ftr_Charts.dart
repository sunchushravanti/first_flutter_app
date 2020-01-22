import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'BarData.dart';
import 'LineData.dart';
import 'PieData.dart';

class ftr_Charts extends StatefulWidget {
 // final Widget child;
  @override
  State<StatefulWidget> createState() {
    return ftr_ChartState();
  }
}

class ftr_ChartState extends State<ftr_Charts> {
  //Series--to add the data and create the graph
  List<charts.Series<BarData,String>> _seriesBarData;
  List<charts.Series<PieData,String>> _seriesPieData;
  List<charts.Series<LineData,int>> _seriesLineData;

 _generateData() {
  //BarData
   var barData_One=[
     new BarData('BarOne',2000,30),
     new BarData('BarTwo',2015,80),
     new BarData('BarThree',2019,150),
   ];
  var barData_Two=[
     new BarData('BarOne',2000,50),
     new BarData('BarTwo',2015,120),
     new BarData('BarThree',2019,180),
   ];
  var barData_Three=[
     new BarData('BarOne',2000,30),
     new BarData('BarTwo',2015,100),
     new BarData('BarThree',2019,80),
   ];


   _seriesBarData.add(
     charts.Series(
       data: barData_One,
       domainFn: (BarData task,_)=>task.barName,
       measureFn: (BarData task,_)=>task.barQuantity,
       id: '2000',
       fillPatternFn: (BarData task,_)=>charts.FillPatternType.solid,
       fillColorFn: (BarData task,_)=> charts.ColorUtil.fromDartColor(Colors.amber),
     ),
   );

   _seriesBarData.add(
     charts.Series(
       data: barData_Two,
       domainFn: (BarData task,_)=>task.barName,
       measureFn: (BarData task,_)=>task.barQuantity,
       id: '2000',
       fillPatternFn: (BarData task,_)=>charts.FillPatternType.solid,
       //fillPatternFn: (BarData task,_)=>charts.FillPatternType.forwardHatch,
       fillColorFn: (BarData task,_)=> charts.ColorUtil.fromDartColor(Colors.teal),
     ),
   );

   _seriesBarData.add(
     charts.Series(
       data: barData_Three,
       domainFn: (BarData task,_)=>task.barName,
       measureFn: (BarData task,_)=>task.barQuantity,
       id: '2000',
       fillPatternFn: (BarData task,_)=>charts.FillPatternType.solid,
       //fillPatternFn: (BarData task,_)=>charts.FillPatternType.forwardHatch,
       fillColorFn: (BarData task,_)=> charts.ColorUtil.fromDartColor(Colors.brown),
     ),
   );


   //PieData
  var pieData=[
    new PieData('Work',35.8,Colors.brown),
    new PieData('Eat',8.3,Colors.blue),
    new PieData('Commute',10.8,Colors.redAccent),
    new PieData('TV',15.6,Colors.amber),
    new PieData('Sleep',19.2,Colors.deepOrange),
    new PieData('other',10.3,Colors.deepPurple),
  ];
  
  _seriesPieData.add(
    charts.Series(
      data: pieData,
      domainFn: (PieData task,_)=>task.pieName,
      measureFn: (PieData task,_)=>task.pieValue,
      colorFn: (PieData task,_)=> charts.ColorUtil.fromDartColor(task.pieColor),
      id: 'Daily Task',
      labelAccessorFn: (PieData task,_)=>'${task.pieName}'
    ),
  );



  //LineData

   var lineData_One=[
     new LineData('LineOne',0,35),
     new LineData('LineTwo',1,46),
     new LineData('LineThree',2,55),
   ];
   var lineData_Two=[
     new LineData('LineOne',0,20),
     new LineData('LineTwo',1,40),
     new LineData('LineThree',2,60),
   ];
   var lineData_Three=[
     new LineData('LineOne',0,25),
     new LineData('LineTwo',1,45),
     new LineData('LineThree',2,70),
   ];


   _seriesLineData.add(
     charts.Series(
       data: lineData_One,
       domainFn: (LineData task,_)=> task.lineYear,
       measureFn: (LineData task,_)=>task.lineValue,
       id: 'LineGraph',
       colorFn: (LineData task,_)=> charts.ColorUtil.fromDartColor(Colors.purple),
       ),
   );

   _seriesLineData.add(
     charts.Series(
       data: lineData_Two,
       domainFn: (LineData task,_)=> task.lineYear,
       measureFn: (LineData task,_)=>task.lineValue,
       id: 'LineGraph',
       colorFn: (LineData task,_)=> charts.ColorUtil.fromDartColor(Colors.deepOrange),
     ),
   );
   _seriesLineData.add(
     charts.Series(
       data: lineData_Three,
       domainFn: (LineData task,_)=> task.lineYear,
       measureFn: (LineData task,_)=>task.lineValue,
       id: 'LineGraph',
       colorFn: (LineData task,_)=> charts.ColorUtil.fromDartColor(Colors.cyan),
     ),
   );

 }//Endof_generateData()


initState(){
    super.initState();
    _seriesBarData = List<charts.Series<BarData,String>>();
    _seriesPieData = List<charts.Series<PieData,String>>();
    _seriesLineData = List<charts.Series<LineData,int>>();

    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:DefaultTabController(
      length:3,
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            bottom: TabBar(
              indicatorColor:Color(0xff9962D0) ,
              tabs: <Widget>[
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),

              ],
            ),
            title: Text("Flutter Charts"),
          ),
          body: TabBarView(
            children:[
              //BarGraphData
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('Daily Task', style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold ),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesBarData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            barGroupingType: charts.BarGroupingType.grouped,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              //PieChartData
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('Daily Task', style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold ),),
                        SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
                              new charts.DatumLegend(
                                outsideJustification: charts.OutsideJustification.endDrawArea,
                                horizontalFirst: true,
                                desiredMaxRows:2,
                                cellPadding: EdgeInsets.only(right: 4.0,left: 4.0),
                                entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                    fontSize: 11
                                ),
                              )
                            ],
                            defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 100,
                              arcRendererDecorators: [
                                new charts.ArcLabelDecorator( labelPosition: charts.ArcLabelPosition.inside)
                              ]
                            ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //LineGraphData
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('LineGraph Task', style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold ),),
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(includeArea: true,stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
                              new charts.ChartTitle('Years',behaviorPosition: charts.BehaviorPosition.bottom,titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                              new charts.ChartTitle('Values',behaviorPosition: charts.BehaviorPosition.start,titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                              new charts.ChartTitle('Names',behaviorPosition: charts.BehaviorPosition.end,titleOutsideJustification: charts.OutsideJustification.middleDrawArea)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]
          ),
        )
      )

    );
  }
  }

