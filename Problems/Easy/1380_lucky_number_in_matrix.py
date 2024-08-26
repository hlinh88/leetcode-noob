class Solution:
    def luckyNumbers(self, matrix: list[list[int]]) -> list[int]:
        ROWS, COLS = len(matrix), len(matrix[0])
        minRow = set()
        maxCol = set()

        for r in range(ROWS):
            minRow.add(min(matrix[r]))

        for c in range(COLS):
            temp = []
            for r in range(ROWS):
                temp.append(matrix[r][c])
            maxCol.add(max(temp))

        res = list(minRow.intersection(maxCol))

        if len(res) > 0:
            return res
        else:
            return []


if __name__ == '__main__':
    print(Solution.luckyNumbers(Solution, [[1, 10, 4, 2],
                                                  [9, 3, 8, 7],
                                                  [15, 16, 17, 12]]))
