# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]

class Solution:
    def searchRange(self, nums: list[int], target: int) -> list[int]:
        left = Solution.binarySearch(self, nums, target, True)
        right = Solution.binarySearch(self, nums, target, False)

        return [left, right]

    def binarySearch(self, nums: list[int], target: int, direction: bool) -> int:
        l, r = 0, len(nums) - 1
        i = -1
        while l <= r:
            m = (l + r) // 2
            print(m)
            if target > nums[m]:
                l = m + 1
            elif target < nums[m]:
                r = m - 1
            else:
                i = m
                if direction:
                    r = m - 1
                else:
                    l = m + 1

        return i


if __name__ == '__main__':
    print(Solution.searchRange(Solution, [5, 7, 8, 8, 8, 9, 10], 8))
