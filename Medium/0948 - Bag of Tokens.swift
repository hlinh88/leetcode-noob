// Input: tokens = [100,200,300,400], power = 200

// Output: 2

// Explanation: Play the tokens in this order to get a score of 2:

// Play token0 (100) face-up, reducing power to 100 and increasing score to 1.
// Play token3 (400) face-down, increasing power to 500 and reducing score to 0.
// Play token1 (200) face-up, reducing power to 300 and increasing score to 1.
// Play token2 (300) face-up, reducing power to 0 and increasing score to 2.
// The maximum score achievable is 2.

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
