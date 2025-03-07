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

// Input: head = [1,2,3,4,5], k = 2
// Output: [2,1,4,3,5]

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
         guard let head, k > 1 else { return head }
        
        let dummy = ListNode(0, head)
        var prev: ListNode? = dummy, current: ListNode? = head
        
        var count = 0
        while current != nil {
            count += 1
            current = current?.next
        }
        
        while count >= k {
            var cur = prev?.next
            var next = cur?.next
            
            for i in 1..<k {
                cur?.next = next?.next
                next?.next = prev?.next
                prev?.next = next
                next = cur?.next
            }
            
            prev = cur
            count -= k
        }
        
        return dummy.next
    }
}