# Input: nums = [-1,1,0,-3,3]
# Output: [0,0,9,0,0]

class Solution:
    def productExceptSelf(self, nums: list[int]) -> list[int]:
        n = len(nums)
        pre = [1] * n
        suf = [1] * n
        res = [1] * n

        for i in range(1, n):
            pre[i] = nums[i-1] * pre[i-1]

        for j in range(n-2, -1, -1):
            suf[j] = nums[j+1] * suf[j+1]

        for k in range(n):
            res[k] = pre[k] * suf[k]

        return res

if __name__ == '__main__':
    print(Solution.productExceptSelf(Solution, [1, 2, 3, 4]))