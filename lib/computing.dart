import 'package:flutter/material.dart';
import 'dart:math';

class ComputingPage extends StatefulWidget {
  ComputingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ComputingState createState() => _ComputingState();
}

class _ComputingState extends State<ComputingPage> {
  int transponResult = 0;
  int sortResult = 0;
  int filterResult = 0;

  List matrixState = [];
  List sortArrayState = [];
  List filterArrayState = [];

  _generateMatrix() {
    List matrix = [];
    for (var i = 0; i < 1000; i++) {
      matrix.add([]);
      for (var j = 0; j < 1000; j++) {
        var rng = new Random();
        matrix[i].add(rng.nextInt(100));
      }
    }
    setState(() {
      matrixState = matrix;
    });

    List sortableArray = [];
    for (var i = 0; i < 1000000; i++) {
      var rng = new Random();
      sortableArray.add(rng.nextInt(100));
    }
    setState(() {
      matrixState = matrix;
      sortArrayState = sortableArray;
      filterArrayState = sortableArray;
    });
  }

  _transponMatrix() {
    var startTime = new DateTime.now().millisecondsSinceEpoch;
    int rowsNumber = matrixState.length;
    if (matrixState.length == 0) return matrixState;

    int colsNumber = matrixState[0].length;
    if (colsNumber == 0) throw new StateError("Degenerate matrix");

    var transponedMatrix = List(colsNumber);
    for (int col = 0; col < colsNumber; col++) {
      transponedMatrix[col] = List(colsNumber);
    }

    for (int row = 0; row < rowsNumber; row++) {
      for (int col = 0; col < colsNumber; col++) {
        transponedMatrix[col][row] = matrixState[row][col];
      }
    }
    var endTime = new DateTime.now().millisecondsSinceEpoch;
    setState(() {
      transponResult = (endTime - startTime);
    });
    return null;
  }

  _sortArray() {
    var startTime = new DateTime.now().millisecondsSinceEpoch;
    sortArrayState.sort((a, b) => b - a);
    var endTime = new DateTime.now().millisecondsSinceEpoch;
    setState(() {
      sortResult = (endTime - startTime);
    });
  }

  _filterArray() {
    var startTime = new DateTime.now().millisecondsSinceEpoch;
    sortArrayState.where((value) => value > 50).toList();
    var endTime = new DateTime.now().millisecondsSinceEpoch;
    setState(() {
      filterResult = (endTime - startTime);
    });
  }

  @override
  initState() {
    super.initState();
    _generateMatrix();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(children: [
                    Text('Result: '),
                    Text(transponResult.toString()),
                    Text(' ms')
                  ]),
                  RaisedButton(
                    child: Text(
                      'Transpon Matrix (1000 x 1000)'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _transponMatrix();
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(children: [
                    Text('Result: '),
                    Text(sortResult.toString()),
                    Text(' ms')
                  ]),
                  RaisedButton(
                    child: Text(
                      'Sort values in 1000000 elements array'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _sortArray();
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(children: [
                    Text('Result: '),
                    Text(filterResult.toString()),
                    Text(' ms')
                  ]),
                  RaisedButton(
                    child: Text(
                      'Filter values in 1000000 elements array'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _filterArray();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
