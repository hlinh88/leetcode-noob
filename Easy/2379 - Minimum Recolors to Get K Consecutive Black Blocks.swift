// Input: blocks = "WBBWWBBWBW", k = 7
// Output: 3
// Explanation:
// One way to achieve 7 consecutive black blocks is to recolor the 0th, 3rd, and 4th blocks
// so that blocks = "BBBBBBBWBW". 
// It can be shown that there is no way to achieve 7 consecutive black blocks in less than 3 operations.
// Therefore, we return 3.

class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        var blocks = Array(blocks)
        var l = 0, countWhite = 0, res = Int.max

        for r in 0..<blocks.count {
            if blocks[r] == "W" {
                countWhite += 1
            }

            if (r - l + 1 == k) {
                res = min(res, countWhite)

                if blocks[l] == "W" {
                    countWhite -= 1
                }

                l += 1
            }
        }

        return res
    }
}
