// Input: nums = [1,1,2]
// Output: 2, nums = [1,2,_]
// Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
// It does not matter what you leave beyond the returned k (hence they are underscores).

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var set: [Int] = []

        for num in nums {
            if !set.contains(num) {
                set.append(num)
            }
        }

        for (i, num) in set.enumerated() {
            nums[i] = num
        }

        return set.count
    }
}