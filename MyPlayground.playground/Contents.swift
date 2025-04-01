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
