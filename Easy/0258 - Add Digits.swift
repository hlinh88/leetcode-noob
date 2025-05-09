class Solution {
    func addDigits(_ num: Int) -> Int {
        var num = num
        
        while num >= 10 {
            let sum = (num / 10) + (num % 10)
            num = sum
        }
        
        return num 
    }
}