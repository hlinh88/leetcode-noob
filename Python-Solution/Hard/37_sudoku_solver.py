import collections


class Solution:

    def solveSudoku(self, board: list[list[str]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """

        # Initialize tracking sets for rows, columns, and 3x3 boxes
        cols = collections.defaultdict(set)
        rows = collections.defaultdict(set)
        boxes = collections.defaultdict(set)

        # Fill initial values in tracking sets
        for r in range(9):
            for c in range(9):
                if board[r][c] != ".":
                    rows[r].add(board[r][c])
                    cols[c].add(board[r][c])
                    boxes[(r // 3, c // 3)].add(board[r][c])

        def backtrack(r=0, c=0):
            # Find next empty cell
            while r < 9 and board[r][c] != ".":
                c += 1
                if c == 9:
                    r += 1
                    c = 0
            if r == 9:
                return True  # Solved

            # Try placing numbers 1-9
            for num in '123456789':
                if (num not in rows[r] and
                        num not in cols[c] and
                        num not in boxes[(r // 3, c // 3)]):

                    # Place the number
                    board[r][c] = num
                    rows[r].add(num)
                    cols[c].add(num)
                    boxes[(r // 3, c // 3)].add(num)

                    # Recursively solve from here
                    if backtrack(r, c):
                        return True

                    # Undo the choice (backtrack)
                    board[r][c] = "."
                    rows[r].remove(num)
                    cols[c].remove(num)
                    boxes[(r // 3, c // 3)].remove(num)

            return False  # Trigger backtracking

        backtrack()

        print(board)


if __name__ == '__main__':
    Solution.solveSudoku(Solution,
                         [["5", "3", ".", ".", "7", ".", ".", ".", "."],
                          ["6", ".", ".", "1", "9", "5", ".", ".", "."],
                          [".", "9", "8", ".", ".", ".", ".", "6", "."],
                          ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
                          ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
                          ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
                          [".", "6", ".", ".", ".", ".", "2", "8", "."],
                          [".", ".", ".", "4", "1", "9", ".", ".", "5"],
                          [".", ".", ".", ".", "8", ".", ".", "7", "9"]])
