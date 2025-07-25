class Solution {
    func maxSum(_ nums: [Int]) -> Int {
        var unique = Set<Int>()
        var maxNum = Int.min
        var sum = 0
        
        for num in nums {
            if num > 0 && !unique.contains(num) {
                unique.insert(num)
                sum += num
            }
            maxNum = max(maxNum, num)
        }
        
        return unique.count > 0 ? sum : maxNum
    }
}