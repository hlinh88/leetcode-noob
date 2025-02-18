//Input: rowIndex = 3
//Output: [1,3,3,1]

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1] }
        if rowIndex == 1 { return [1, 1] }

        var result: [Int] = [1, 1]
        for _ in 2...rowIndex {
            var temp: [Int] = [1]
            for i in 1..<result.count {
                temp.append(result[i-1] + result[i])
            }
            temp.append(1)
            result = temp
        }

        return result
    }
}

Solution().getRow(5);
