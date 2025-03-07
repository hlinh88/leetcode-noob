func createLinkedList(_ values: [Int]) -> ListNode? {
    guard !values.isEmpty else { return nil }
    let dummy = ListNode(0)
    var current = dummy
    for val in values {
        current.next = ListNode(val)
        current = current.next!
    }
    return dummy.next
}

// Helper function to print linked list
func printLinkedList(_ head: ListNode?) {
    var current = head
    var result: [Int] = []
    while current != nil {
        result.append(current!.val)
        current = current?.next
    }
    print(result)
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

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

Solution().findDuplicate([1,3,4,2,2])
