//Input: limit = 4, queries = [[1,4],[2,5],[1,3],[3,4]]
//
//Output: [1,2,2,3]
//
//After query 0, ball 1 has color 4.
//After query 1, ball 1 has color 4, and ball 2 has color 5.
//After query 2, ball 1 has color 3, and ball 2 has color 5.
//After query 3, ball 1 has color 3, ball 2 has color 5, and ball 3 has color 4.

class Solution {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var res: [Int] = []
        var ballDict: [Int: Int] = [:] // ball num: color num
        var colorDict: [Int: Int] = [:] // color num : num of balls

        for query in queries {
            let (ball, color) = (query[0], query[1])

            if let oldColor = ballDict[ball] {
                colorDict[oldColor, default: 0] -= 1
                if colorDict[oldColor] == 0 { colorDict[oldColor] = nil }
            }

            ballDict[ball] = color
            colorDict[color, default: 0] += 1

            res.append(colorDict.count)

        }

        print(res)
        return res
    }
}

Solution().queryResults(4, [[0,1],[1,4],[1,1],[1,4],[1,1]]);
