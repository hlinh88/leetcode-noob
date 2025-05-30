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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var cur = head
        while cur?.next != nil {
            if cur?.next?.val == cur?.val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }

        return head
    }
}