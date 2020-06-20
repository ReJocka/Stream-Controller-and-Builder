import 'package:reioapp8/color_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.purple,
              onPressed: (){
                bloc.eventSink.add(ColorEvent.to_purple);
              },
            ),
            SizedBox(width: 10,),
            FloatingActionButton(onPressed: (){
              bloc.eventSink.add(ColorEvent.to_cyan);
            },
              backgroundColor: Colors.cyan,
            )
          ],
        ),
        appBar: AppBar(
          title: Text("Stream Controller by Reio"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: StreamBuilder(
            stream: bloc.stateStream,
            initialData: Colors.purple,
            builder: (context, snapshot){
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width:100,
                height: 100,
                color: snapshot.data,
              );
            },
          ),
        ),
      ),
    );
  }
}
