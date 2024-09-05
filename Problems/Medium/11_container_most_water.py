class Solution:
    def maxArea(self, height: list[int]) -> int:
        l = 0
        r = len(height) - 1
        res = 0

        while l <= r:
            area = min(height[l], height[r]) * abs(l - r)
            print("left: ", height[l], "right: ", height[r], "area: ", area)
            if area > res:
                res = area

            if height[l] > height[r]:
                r -= 1
            else:
                l += 1

        print(res)
        return res


if __name__ == '__main__':
    Solution.maxArea(Solution, [2, 3, 4, 5, 18, 17, 6])
