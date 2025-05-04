class Solution {
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var res = 0
        var dict: [[Int]: Int] = [:]
        
        for domino in dominoes {
            let domino = domino.sorted()
            res += dict[domino, default: 0]
            dict[domino, default: 0] += 1
        }
        
        return res
    }
}
