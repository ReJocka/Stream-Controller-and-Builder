import 'dart:async';
import 'package:flutter/material.dart';

enum ColorEvent{to_purple, to_cyan}

class ColorBloc{
  Color _color = Colors.purple;
  // bersifat private, ditandai dengan underscore

  StreamController<ColorEvent> _eventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent)
  {
    if(colorEvent == ColorEvent.to_purple)
      _color = Colors.purple;
    else
      _color = Colors.cyan;

    _stateSink.add(_color);
  }

  ColorBloc(){
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose()
  {
    _eventController.close();
    _stateController.close();
  }
}