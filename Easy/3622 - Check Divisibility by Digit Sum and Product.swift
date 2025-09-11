class Solution {
    func checkDivisibility(_ n: Int) -> Bool {
        var digits: [Int] = []
        var num = n
        
        while num != 0 {
            let remainder = num % 10
            digits.append(remainder)
            num /= 10
        }
        
        let sum = digits.reduce(0, +), product = digits.reduce(1, *)
        return n % (sum + product) == 0 
    }
}