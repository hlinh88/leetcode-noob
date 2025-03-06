public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    // 1: Move initial pointer and current pointer to (L-1, L) position
    // 2: Do reverse linked list from range (L, R)
    // 3: Set next node of initial pointer to first node of current and prev
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var dummy = ListNode(0, head)
        var initial = dummy, cur = head

        for i in 0..<left-1 {
            initial = cur!
            cur = cur?.next
        }
        
        var prev: ListNode?
        for i in 0..<right-left+1 {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
    
        initial.next?.next = cur
        initial.next = prev
        
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


Solution().reverseBetween(createLinkedList([1,2,3,4,5]), 2, 4)
