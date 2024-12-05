# Input: nums = [1,2,3,1]
# Output: 4
# Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
# Total amount you can rob = 1 + 3 = 4.


class Solution:
    def rob(self, nums: list[int]) -> int:
        l, r = 0, 0

        for n in nums:
            temp = max(n + l, r)
            l = r
            r = temp

        return r



if __name__ == '__main__':
    print(Solution.rob(Solution, [2,1,1,2,3]))