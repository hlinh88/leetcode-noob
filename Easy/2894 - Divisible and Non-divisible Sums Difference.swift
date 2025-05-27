class Solution {
    func differenceOfSums(_ n: Int, _ m: Int) -> Int {
        var sum = n * (n + 1) / 2
        var sum2 = 0
        var i = 1
        while i * m <= n {
            sum2 += i * m
            i += 1
        }
        
        return sum - sum2 * 2
    }
}

Solution().differenceOfSums(10, 3)
