/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var dummy: ListNode? = ListNode(0)
        dummy?.next = head 

        var cur = dummy
        
        while cur?.next != nil {
            if cur?.next?.val == val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }

        return dummy?.next
    }
}
