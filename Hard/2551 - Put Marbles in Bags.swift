class Solution {
    func putMarbles(_ weights: [Int], _ k: Int) -> Int {
        if k == 1 {
            return 0
        }

        var pairSums: [Int] = []
        for i in 0..<weights.count - 1 {
            pairSums.append(weights[i] + weights[i + 1])
        }

        pairSums.sort()
        
        let minScore = pairSums.prefix(k - 1).reduce(0, +)
        let maxScore = pairSums.suffix(k - 1).reduce(0, +)

        return maxScore - minScore
    }
}