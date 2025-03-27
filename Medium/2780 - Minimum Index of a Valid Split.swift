// Input: nums = [2,1,3,1,1,1,7,1,2,1]
// Output: 4
// Explanation: We can split the array at index 4 to obtain arrays [2,1,3,1,1] and [1,7,1,2,1].
// In array [2,1,3,1,1], element 1 is dominant since it occurs thrice in the array and 3 * 2 > 5.
// In array [1,7,1,2,1], element 1 is dominant since it occurs thrice in the array and 3 * 2 > 5.
// Both [2,1,3,1,1] and [1,7,1,2,1] have the same dominant element as nums, so this is a valid split.
// It can be shown that index 4 is the minimum index of a valid split.

class Solution {
    func minimumIndex(_ nums: [Int]) -> Int {
        var res = -1
        var rightFreq: [Int: Int] = [:]
        for num in nums {
            rightFreq[num, default: 0] += 1
        }

        guard let dominant = rightFreq.max(by: { $0.value < $1.value })?.key else { return -1 }

        var leftFreq: [Int: Int] = [:]

        for i in 0..<nums.count - 1 {
            leftFreq[nums[i], default: 0] += 1
            rightFreq[nums[i]]! -= 1
            if rightFreq[nums[i]] == 0 {
                rightFreq[nums[i]] = nil
            }

            if let leftCount = leftFreq[dominant], let rightCount = rightFreq[dominant] {
                if leftCount * 2 > (i + 1) && rightCount * 2 > (nums.count - (i + 1)) {
                    return i
                }
            }
        }

        return res
    }
}

Solution().minimumIndex([2,1,3,1,1,1,7,1,2,1])
