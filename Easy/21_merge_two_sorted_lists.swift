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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var merged = ListNode(0)
        var cur = merged
        var l1 = list1, l2 = list2

        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                cur.next = l1
                l1 = l1?.next
            } else {
                cur.next = l2
                l2 = l2?.next
            }
            cur = cur.next!
        }

        if l1 != nil {
            cur.next = l1
        } else {
            cur.next = l2
        }

        return merged.next
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
