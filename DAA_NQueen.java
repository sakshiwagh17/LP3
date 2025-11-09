public class DAA_NQueen {

    public static boolean isSafe(int[][] board, int row, int col) {
        for (int i = 0; i < col; i++) {
            if (board[row][i] == 1)
                return false;
        }

        for (int i = row, j = col; i >= 0 && j >= 0; i--, j--) {
            if (board[i][j] == 1)
                return false;
        }

        for (int i = row, j = col; j >= 0 && i < board.length; i++, j--) {
            if (board[i][j] == 1)
                return false;
        }

        return true;
    }

    public static void printSolution(int[][] board) {
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board.length; j++) {
                System.out.print(board[i][j] == 1 ? "Q " : ". ");
            }
            System.out.println();
        }
    }

    public static boolean solvenQUtil(int[][] board, int col) {
        if (col >= board.length)
            return true;

        for (int i = 0; i < board.length; i++) {
            if (isSafe(board, i, col)) {
                board[i][col] = 1;

                if (solvenQUtil(board, col + 1))
                    return true;

                board[i][col] = 0; // backtrack
            }
        }
        return false;
    }

    public static void main(String[] args) {
        int N = 8;
        int[][] board = new int[N][N];

        if (!solvenQUtil(board, 0))
            System.out.println("No solution exists");
        else
            printSolution(board);
    }
}
