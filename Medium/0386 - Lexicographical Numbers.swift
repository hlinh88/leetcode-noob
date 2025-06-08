class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        var result: [Int] = []

        func dfs(_ num: Int) {
            if num > n {
                return 
            }

            result.append(num)

            for digit in 0..<10 {
                let nextNum = num * 10 + digit
                dfs(nextNum)
            }
        }

        for digit in 1...9 {
            dfs(digit)
        }

        return result
    }
}
