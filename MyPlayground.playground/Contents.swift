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
