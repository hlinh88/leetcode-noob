// Input: heights = [2,1,5,6,2,3]
// Output: 10
// Explanation: The above is a histogram where width of each bar is 1.
// The largest rectangle is shown in the red area, which has an area = 10 units.

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var res = 0
        var stack = [Int]()
        
        for (i, h) in heights.enumerated() {
            while !stack.isEmpty, heights[stack.last!] > h {
                let topIndex = stack.removeLast()
                let width = stack.isEmpty ? i : i - stack.last! - 1
                res = max(res, heights[topIndex] * width)
            }
            stack.append(i)
        }
        
        while !stack.isEmpty {
            let topIndex = stack.removeLast()
            let width = stack.isEmpty ? heights.count : heights.count - stack.last! - 1
            res = max(res, heights[topIndex] * width)
        }
        
        return res
    }
}