class Solution {
    func countSymmetricIntegers(_ low: Int, _ high: Int) -> Int {
        var count = 0
        
        for num in low...high {
            let numString = String(num)
            let digits = Array(numString)
            var n = digits.count
            
            if n % 2 != 0 {
                continue
            }
            
            var left = 0, right = 0
            
            for i in 0..<n/2 {
                left += Int(String(digits[i]))!
            }
            
            for i in n/2..<digits.count {
                right += Int(String(digits[i]))!
            }
            
            if left == right {
                count += 1
            }
        }
        
        return count
    }
}

Solution().countSymmetricIntegers(1200, 1230)
