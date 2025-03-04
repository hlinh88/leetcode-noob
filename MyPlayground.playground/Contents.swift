class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        var tokens = tokens.sorted()
        var power = power, score = 0, res = 0
        var l = 0, r = tokens.count - 1

        while l <= r {
            if power >= tokens[l] {
                power -= tokens[l]
                l += 1
                score += 1
                res = max(res, score)
            } else if score > 0 {
                power += tokens[r]
                r -= 1
                score -= 1
            } else {
                break
            }
        }

        return res
    }

}

Solution().bagOfTokensScore([100,200,300,400], 200)
