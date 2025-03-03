//Input: nums = [1,2,1,2,3], k = 2
//Output: 7
//Explanation: Subarrays formed with exactly 2 different integers: [1,2], [2,1], [1,2], [2,3], [1,2,1], [2,1,2], [1,2,1,2]

class Solution {
    func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
        var l = 0, r = 0, res = 0, curCount = 0
        var counter: [Int: Int] = [:]
        let n = nums.count

        while r < n {
            // Expand the window by adding nums[r] to the counter
            counter[nums[r], default: 0] += 1
            print("After adding nums[\(r)] = \(nums[r]): counter = \(counter)")

            // If the number of distinct elements exceeds k, shrink the window from the left
            if counter.count > k {
                print("Distinct elements exceeded k (\(k)). Shrinking window from the left...")
                counter[nums[l], default: 1] -= 1
                if counter[nums[l]] == 0 {
                    counter.removeValue(forKey: nums[l])
                }
                l += 1
                curCount = 0
                print("After shrinking: l = \(l), counter = \(counter), curCount = \(curCount)")
            }

            // If the window has exactly k distinct elements, count valid subarrays
            if counter.count == k {
                print("Window has exactly \(k) distinct elements. Counting valid subarrays...")
                while let cnt = counter[nums[l]], cnt > 1 {
                    print("Shrinking window from the left (nums[\(l)] = \(nums[l]) appears more than once)...")
                    counter[nums[l]] = cnt - 1
                    l += 1
                    curCount += 1
                    print("After shrinking: l = \(l), counter = \(counter), curCount = \(curCount)")
                }

                // Update the result
                res += (curCount + 1)
                print("Updated result: res = \(res)")
            }

            // Move the right pointer
            r += 1
            print("Moved r to \(r). Current state: l = \(l), r = \(r), counter = \(counter), curCount = \(curCount), res = \(res)")
            print("----------------------------------------")
        }

        return res
    }
}


Solution().subarraysWithKDistinct([1,2,1,3,4], 2)

