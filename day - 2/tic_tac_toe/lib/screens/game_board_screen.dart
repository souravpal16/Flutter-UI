import 'package:flutter/material.dart';
import '../data/constants.dart';
import '../widgets/list_tile_image.dart';
import '../widgets/game_board_lines.dart';

class GameBoardScreen extends StatefulWidget {
  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  List<int> gameStatus = [2, 2, 2, 2, 2, 2, 2, 2, 2];

  String playerOne = 'Player 1';
  String playerOneShape = 'cross';
  String playerTwoShape = 'circle';
  String playerTwo = 'Player 2';
  String currentPlayer = 'Player 1';
  int c = 0;

  bool check(int x) {
    for (int i = 0; i < 3; i++) {
      if (gameStatus[i * 3 + 0] == x &&
          gameStatus[i * 3 + 1] == x &&
          gameStatus[i * 3 + 2] == x) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (gameStatus[i + 0] == x &&
          gameStatus[i + 3] == x &&
          gameStatus[i + 6] == x) {
        return true;
      }
    }
    if (gameStatus[0] == x && gameStatus[4] == x && gameStatus[8] == x) {
      return true;
    }
    if (gameStatus[2] == x && gameStatus[4] == x && gameStatus[6] == x) {
      return true;
    }
    return false;
  }

  int checkWin() {
    if (check(1)) {
      return 1;
    } else if (check(0)) {
      return 0;
    }
    return 2;
  }

  void resetGame() {
    gameStatus = [
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
    ];
    c = 0;
    currentPlayer = playerOne;
  }

  bool isDraw() {
    for (int i = 0; i < 9; i++) {
      if (gameStatus[i] == 2) {
        return false;
      }
    }
    return true;
  }

  void initialise(String playerOneshapeTemp) {
    playerOneShape = playerOneshapeTemp;
    if (playerOneShape == 'cross') {
      playerTwoShape = 'circle';
    } else {
      playerTwoShape = 'cross';
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String temp = args['playerOne']!;
    initialise(temp);
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: color1,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTileImage(
              playerName: '${playerOne}: ',
              imageurl: 'images/${playerOneShape}.png',
            ),
            ListTileImage(
              playerName: '${playerTwo}: ',
              imageurl: 'images/${playerTwoShape}.png',
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                '${currentPlayer}\'s turn',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Stack(
                children: [
                  ...gameLines(width, color4),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: List.generate(
                      9,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            if (c % 2 == 0) {
                              gameStatus[index] = 0;
                              currentPlayer = playerTwo;
                            } else {
                              gameStatus[index] = 1;
                              currentPlayer = playerOne;
                            }
                            c += 1;
                            //print(c);
                            setState(() {});
                            if (isDraw()) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Game Draw!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');

                                        resetGame();
                                        setState(() {});
                                        Navigator.pushNamed(
                                            context, '/chooseSide');
                                      },
                                      child: const Text('Quit Game'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'OK');
                                        resetGame();
                                        setState(() {});
                                      },
                                      child: const Text('Play Again'),
                                    ),
                                  ],
                                ),
                              );
                            }
                            int x = checkWin();
                            if (x != 2) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Game Over'),
                                  content: Text(
                                      '${x == 0 ? playerOne : playerTwo} has won!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');

                                        resetGame();
                                        setState(() {});
                                        Navigator.pushNamed(
                                            context, '/chooseSide');
                                      },
                                      child: const Text('Quit Game'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'OK');
                                        resetGame();
                                        setState(() {});
                                      },
                                      child: const Text('Play Again'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: Center(
                            child: gameStatus[index] == 2
                                ? Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                  )
                                : Image(
                                    image: AssetImage(
                                      gameStatus[index] == 0
                                          ? 'images/${playerOneShape}.png'
                                          : 'images/${playerTwoShape}.png',
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
