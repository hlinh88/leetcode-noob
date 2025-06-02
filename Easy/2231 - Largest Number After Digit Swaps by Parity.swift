class Solution {
    func largestInteger(_ num: Int) -> Int {
         var odds: [Int] = []
        var evens: [Int] = []
        var digits: [Int] = []
        var num = num
        
        while num != 0 {
            if num % 2 == 0 {
                evens.append(num % 10)
            } else {
                odds.append(num % 10)
            }
            digits.insert(num % 10, at: 0)
            num /= 10
        }
        
        odds = odds.sorted(by: >)
        evens = evens.sorted(by: >)
        
        var res = Array(repeating: -1, count: digits.count)
        for (i, digit) in digits.enumerated() {
            if digit % 2 == 0 {
                res[i] = evens.removeFirst()
            } else {
                res[i] = odds.removeFirst()
            }
        }
        
        return res.reduce(0) { $0 * 10 + $1 }
    }
}