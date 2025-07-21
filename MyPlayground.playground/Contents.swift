class Solution {
    func maximumLength(_ nums: [Int]) -> Int {
        var odd = 0, even = 0, oddEven = 0, evenOdd = 0
        for num in nums {
            if num % 2 == 0 {
                odd += 1
                oddEven = evenOdd + 1
            } else {
                even += 1
                evenOdd = oddEven + 1
            }
        }
        
        return max(odd, even, oddEven, evenOdd)
    }
}

Solution().maximumLength([1,2,1,1,2,1,2])
