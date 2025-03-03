//Input: n = 10
//Output: 4
//Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.

//Sieve of Eratosthenes -> find all n^2 from 2 -> sqrt(n)

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if [0, 1].contains(n) {
            return 0
        }

        var arr = Array(repeating: true, count: n)
        var num = 2

        while num * num <= n {
            if arr[num] {
                for i in stride(from: num * num, to: n, by: num) {
                    arr[i] = false
                }
            }
            num += 1
        }

        return arr.filter { $0 }.count - 2
    }
}

Solution().countPrimes(3)
