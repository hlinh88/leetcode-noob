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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return head }

        var count = 1
        var countNode = head 
        while countNode?.next != nil {
            countNode = countNode?.next
            count += 1
        }

        let k = k % count 
        if k == 0 { return head }

        var cur = head 
        for _ in 0..<count - k - 1 {
            cur = cur?.next 
        }

        var res = cur?.next 
        cur?.next = nil 
        countNode?.next = head

        return res 
    }
}