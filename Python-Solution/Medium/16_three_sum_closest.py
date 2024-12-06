# Input: nums = [-1,2,1,-4], target = 1
# Output: 2
# Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

class Solution:
    def threeSumClosest(self, nums: list[int], target: int) -> int:
        res = float('inf')
        diff = float('inf')
        nums.sort()

        for i, n in enumerate(nums):
            l = i + 1
            r = len(nums) - 1

            while l < r:
                val = n + nums[l] + nums[r]
                current_diff = abs(target - val)

                if current_diff < diff:
                    res = val
                    diff = abs(target - val)

                if val == target:
                    return val
                elif val < target:
                    l += 1
                elif val > target:
                    r -= 1

        return res


if __name__ == '__main__':
    print(Solution.threeSumClosest(Solution, [0, 1, 2], 1))

