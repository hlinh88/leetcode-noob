/**
 * Definition for singly-linked list.
 */

 // Fast & Slow pointers

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow: ListNode? = head
        var fast: ListNode? = head

        while slow != nil && fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

            if slow === fast {
                return true
            }
        }

        return false
    }
}
