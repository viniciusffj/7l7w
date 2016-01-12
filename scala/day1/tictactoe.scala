object TicTacToe {
    def endMatch(board: Array[Char]) {
        validateLines(board)
        validateColumns(board)
        validateDiagonals(board)
    }

    def validateLines(board: Array[Char]) {
        validateSequence(0, 1, 2)
        validateSequence(3, 4, 5)
        validateSequence(6, 7, 8)
    }

    def validateSequence(first: Int, second: Int, third: Int) {
        if (board(first) != ' ' && board(first) == board(second) 
                                && board(second) == board(third))
            println("Winner is '" + board(first) + "'")
    }

    def validateColumns(board: Array[Char]) {
        validateSequence(0, 3, 6)
        validateSequence(1, 4, 7)
        validateSequence(2, 5, 8)
    }

    def validateDiagonals(board: Array[Char]) {
        validateSequence(0, 4, 8)
        validateSequence(2, 4, 4)
    }

}

val board = Array(
                    'O', 'X', 'O',
                    'O', 'X', 'O',
                    'X', 'X', 'X'
                 )
TicTacToe.endMatch(board)
