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
        var dummy: ListNode? = ListNode(0)
        dummy?.next = head 
        var cur = dummy 

        while let next = cur?.next?.val, 
        let nextNext = cur?.next?.next?.val {
            if next == nextNext {
                let dup = next 
                while cur?.next != nil, cur?.next?.val == dup {
                    cur?.next = cur?.next?.next
                }
            } else {
                cur = cur?.next
            }
        }

        return dummy?.next
    }
}