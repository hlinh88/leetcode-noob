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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var cur = dummy
        var l1 = l1, l2 = l2
        var carry = 0
        
        while l1 != nil || l2 != nil || carry != 0 {
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = sum / 10
            cur.next = ListNode(sum % 10)
            cur = cur.next!
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return dummy.next
    }
}

// Helper function to create a linked list from an array
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

// Test cases
let solution = Solution()

// Test Case 1: Merging [1,2,4] and [1,3,4]
let list1 = createLinkedList([1, 2, 4])
let list2 = createLinkedList([1, 3, 4])
let merged1 = solution.mergeTwoLists(list1, list2)
printLinkedList(merged1) // Expected Output: [1, 1, 2, 3, 4, 4]
