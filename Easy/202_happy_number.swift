//Input: n = 19
//Output: true
//Explanation:
//12 + 92 = 82
//82 + 22 = 68
//62 + 82 = 100
//12 + 02 + 02 = 1

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var set = Set<Int>()

        while n != 1 && !set.contains(n) {
            set.insert(n)
            var sum = 0
            var num = n

            while num != 0 {
                let lastDigit = num % 10
                sum += lastDigit * lastDigit
                num /= 10
            }

            n = sum
        }

        return n == 1
    }
}


Solution().isHappy(37)

