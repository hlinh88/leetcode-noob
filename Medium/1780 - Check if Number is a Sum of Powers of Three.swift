// Input: n = 91
// Output: true
// Explanation: 91 = 30 + 32 + 34

class Solution {
    func checkPowersOfThree(_ n: Int) -> Bool {
        func backtracking(i: Int, current: Int) -> Bool {
            if current == n {
                return true
            }

            if current > n || Int(pow(3.0, Double(i))) > n {
                return false
            }

            if backtracking(i: i + 1, current: current + Int(pow(3.0, Double(i)))) {
                return true
            }

            return backtracking(i: i + 1, current: current)
        }

        return backtracking(i: 0, current: 0)
    }
}

Solution().checkPowersOfThree(91)
