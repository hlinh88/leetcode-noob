class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var temp: [Int] = []
        for i in 0..<nums.count {
            if !temp.contains(nums[i]) {
                temp.append(nums[i])
            }
        }
        nums = temp
        return temp.count
    }
}