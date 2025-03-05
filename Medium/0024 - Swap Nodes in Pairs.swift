// Input: head = [1,2,3,4]

// Output: [2,1,4,3]

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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0) 
        dummy.next = head
        var current: ListNode? = dummy
        
        while let firstNode = current?.next, 
        let secondNode = current?.next?.next {
            firstNode.next = secondNode.next
            secondNode.next = firstNode
            current?.next = secondNode
            
            current = firstNode
        }
        
        return dummy.next
    }
}