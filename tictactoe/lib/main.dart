import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(home: MyHomePage(title: 'Tic Tac Toe')));
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String chance = 'X';
  String winner = '';
  List index = [['', '', ''], ['', '', ''], ['', '', '']];
  void reset() {
    setState(() {
      for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
          index[i][j] = '';
    });
  }
  Widget ticks(int a, int b) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (index[a][b] == '') {
            index[a][b] = chance;
            chance = chance == 'X' ? 'O' : 'X';
          }
          if (won()) {
            winner = chance == 'X' ? 'O' : 'X';
            winner += ' Won!!!';
            reset();
          }
        });
      },
      child: Text(index[a][b],
        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
      ),
    );
  }
  bool won() {
    if ((index[0][0] == index[0][1] && index[0][0] == index[0][2] && index[0][0] != '') ||
        (index[1][0] == index[1][1] &&index[1][0] == index[1][2] &&index[1][0] != '') ||
        (index[2][0] == index[2][1] &&index[2][0] == index[2][2] &&index[2][0] != '') ||
        (index[0][1] == index[1][1] &&index[0][1] == index[2][1] &&index[0][1] != '') ||
        (index[0][2] == index[1][2] &&index[0][2] == index[2][2] && index[0][2] != '') ||
        (index[0][0] == index[1][1] && index[0][0] == index[2][2] &&index[0][0] != '') ||
        (index[0][2] == index[1][1] &&  index[0][2] == index[2][0] &&index[0][2] != '') ||
        (index[0][0] == index[1][0] &&index[0][0] == index[2][0] &&index[0][0] != '')){
      return true;
    }
    return false;
  }
  Widget createRow(int a1, int a2, int b1, int b2, int c1, int c2) {
    return Row(
      children: [
        SizedBox(width: 40.0),
        ticks(a1, a2),
        SizedBox(width: 60.0),
        ticks(b1, b2),
        SizedBox(width: 60.0),
        ticks(c1, c2),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Tic Tac Toe")),
      body: Stack(children: [
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNIpz9hgkS5w_dWMHcgzaSziMIFqOPRPegsg&usqp=CAU",
          scale: 0.5,
        ),
        Column(children: [
          SizedBox(height: 30.0),
          createRow(0, 0, 0, 1, 0, 2),
          SizedBox(height: 30.0),
          createRow(1, 0, 1, 1, 1, 2),
          SizedBox(height: 30.0),
          createRow(2, 0, 2, 1, 2, 2),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => reset(),
            child: Text("Reset"),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0))),
          ),
          SizedBox(height: 60.0),
          Text(winner,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60.0,
            ),
          ),
        ])
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
