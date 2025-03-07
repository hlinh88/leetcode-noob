// Floyd's Algorithm -> Slow Fast pointer

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0, fast = 0
        
        while true {
            slow = nums[slow]
            fast = nums[nums[fast]]
            
            print("slow: \(slow), fast: \(fast)")
            
            if slow == fast {
                break
            }
        }
        
        var slow2 = 0
        
        while true {
            slow = nums[slow]
            slow2 = nums[slow2]
        
            if slow == slow2 {
                break
            }
        }
        
        return slow
    }
}