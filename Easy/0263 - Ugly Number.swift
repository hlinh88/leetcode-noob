class Solution {
    func isUgly(_ n: Int) -> Bool {
        if n <= 0 { return false }
        
        let primes: [Int] = [2, 3, 5]
        var num = n
        for prime in primes {
            while num % prime == 0 {
                num /= prime
            }
        }
        
        return num == 1
    }
}