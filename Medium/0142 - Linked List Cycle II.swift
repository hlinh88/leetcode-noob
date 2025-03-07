/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
 // Floyd's algorithm -> Slow Fast pointer

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        var hasCycle: Bool = false
        
        while slow != nil && fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                hasCycle = true 
                break
            }
        }

        guard hasCycle else { return nil }

        var slow2: ListNode? = head 
        while slow !== slow2 {
            slow = slow?.next 
            slow2 = slow2?.next
        }

        return slow
    }
}