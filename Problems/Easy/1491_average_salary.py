class Solution:
    def average(self, salary: list[int]) -> float:
        total = sum(salary) - min(salary) - max(salary)
        num = len(salary) - 2

        return total / num


if __name__ == '__main__':
    print(Solution.average(Solution, [8000,9000,2000,3000,6000,1000]))