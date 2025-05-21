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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0)
        dummy.next = head 

        var prev: ListNode? = dummy
        var post: ListNode? = dummy 

        for _ in 0..<n {
            post = post?.next 
        }

        while post?.next != nil {
            prev = prev?.next
            post = post?.next 
        }

        prev?.next = prev?.next?.next

        return dummy.next
    }
}