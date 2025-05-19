class Solution {
    func triangleType(_ nums: [Int]) -> String {
        guard canFormTriangle(nums[0], nums[1], nums[2]) else {
            return "none"
        }
        
        if nums[0] == nums[1] && nums[1] == nums[2] {
            return "equilateral"
        }
        
        if nums[0] == nums[1] || nums[1] == nums[2] || nums[0] == nums[2] {
            return "isosceles"
        }
        
        return "scalene"
    }
    
    func canFormTriangle(_ a: Int, _ b: Int, _ c: Int) -> Bool {
        return (a + b) > c && (a + c) > b && (b + c) > a
    }
}