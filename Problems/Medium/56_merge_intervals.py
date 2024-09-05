class Solution:
    def merge(self, intervals: list[list[int]]) -> list[list[int]]:
        intervals.sort(key=lambda x: x[0])
        output = [intervals[0]]

        for start, end in intervals[1:]:
            lastEnd = output[-1][1]

            if start <= lastEnd:
                output[-1][1] = max(end, lastEnd)
            else:
                output.append([start, end])

        return output


if __name__ == '__main__':
    print(Solution.merge(Solution, [[1, 3], [8, 10], [15, 18], [2, 6]]))