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