// Input: questions = [[3,2],[4,3],[4,4],[2,5]]
// Output: 5
// Explanation: The maximum points can be earned by solving questions 0 and 3.
// - Solve question 0: Earn 3 points, will be unable to solve the next 2 questions
// - Unable to solve questions 1 and 2
// - Solve question 3: Earn 2 points
// Total points earned: 3 + 2 = 5. There is no other way to earn 5 or more points.

// Backtracking -> Skip or choose

class Solution {
    func mostPoints(_ questions: [[Int]]) -> Int {
        var cache = Array(repeating: 0, count: questions.count)
        
        func backtrack(_ index: Int) -> Int {
            if index >= questions.count {
                return 0
            }
            
            if cache[index] > 0 {
                return cache[index]
            }
            
            let (points, power) = (questions[index][0], questions[index][1])
            let skip = backtrack(index + 1)
            let choose = points + backtrack(index + 1 + power)
            cache[index] = max(skip, choose)
            
            return cache[index]
        }
        
        return backtrack(0)
    }
}

Solution().mostPoints([[3,2],[4,3],[4,4],[2,5]])
