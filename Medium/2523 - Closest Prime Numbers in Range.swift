// Input: left = 10, right = 19
// Output: [11,13]
// Explanation: The prime numbers between 10 and 19 are 11, 13, 17, and 19.
// The closest gap between any pair is 2, which can be achieved by [11,13] or [17,19].
// Since 11 is smaller than 17, we return the first pair.

class Solution {
    func closestPrimes(_ left: Int, _ right: Int) -> [Int] {
        guard right > 2 else { return [-1, -1] }
        
        var isPrime = [Bool](repeating: true, count: right + 1)
        isPrime[0] = false
        isPrime[1] = false
        
        // Sieve of Eratosthenes
        let sqrtRight = Int(Double(right).squareRoot())
        if sqrtRight >= 2 {
            for num in 2...sqrtRight {
                if isPrime[num] {
                    for multiple in stride(from: num * num, through: right, by: num) {
                        isPrime[multiple] = false
                    }
                }
            }
        }
        
        // Collect prime numbers in range [left, right]
        var primes: [Int] = []
        for i in max(2, left)...right {
            if isPrime[i] {
                primes.append(i)
            }
        }
        
        if primes.count < 2 {
            return [-1, -1]
        }
        
        // Find closest prime pair
        var primeLeft = -1, primeRight = -1
        var minDiff = Int.max
        for i in 1..<primes.count {
            let diff = primes[i] - primes[i - 1]
            if diff < minDiff {
                minDiff = diff
                primeLeft = primes[i - 1]
                primeRight = primes[i]
            }
        }
        
        return [primeLeft, primeRight]
    }
}

Solution().closestPrimes(1, 3)
