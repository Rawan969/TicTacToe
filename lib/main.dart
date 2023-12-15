class TicTacToe {
 late List<List<String>> board;
  late String currentPlayer;

  TicTacToe() {
    board = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9']
    ];
    currentPlayer = 'X';
  }

  void displayBoard() {
    for (var row in board) {
      print(row.join(' | '));
      if (row != board.last) {
        print('---------');
      }
    }
  }

  bool makeMove(int position) {
    int row = (position - 1) ~/ 3;
    int col = (position - 1) % 3;

    if (position < 1 || position > 9 || board[row][col] == 'X' || board[row][col] == 'O') {
      print('Invalid move! Please enter a valid position.');
      return false;
    }

    board[row][col] = currentPlayer;
    return true;
  }

 bool checkWin() {
    // Check rows, columns, and diagonals for a win
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] && board[i][1] == board[i][2] ||
          board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
        return true;
      }
    }
    if ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
        (board[0][2] == board[1][1] && board[1][1] == board[2][0])) {
      return true;
    }
    return false;
  }

    bool checkDraw() {
    for (var row in board) {
      for (var cell in row) {
        if (cell != 'X' && cell != 'O') {
          return false;
        }
      }
    }
    return true;
  }
  void switchPlayer() {
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
  }

  void playGame() {
    print('Welcome to Tic-Tac-Toe!\n');
    displayBoard();

    // Simulating moves for demonstration purposes
    List<int> simulatedMoves = [1, 2, 5, 3, 9, 7, 6, 4, 8]; // Simulated moves
    for (var move in simulatedMoves) {
      if (makeMove(move)) {
        displayBoard();

        if (checkWin()) {
          print('\n$currentPlayer wins!');
          break;
        } else if (checkDraw()) {
          print('\nIt\'s a draw!');
          break;
        }

        switchPlayer();
      }
    }
  }
}

void main() {
  TicTacToe game = TicTacToe();
  game.playGame();
}