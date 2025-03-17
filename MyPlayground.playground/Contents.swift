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

Solution().largestRectangleArea([2,1,2])
