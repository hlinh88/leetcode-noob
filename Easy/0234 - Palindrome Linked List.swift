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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var head = head 
        var arr: [Int] = []

        while head != nil {
            arr.append(head!.val)
            head = head?.next
        }

        var l = 0, r = arr.count - 1
        while l <= r {
            if arr[l] != arr[r] { return false }
            l += 1
            r -= 1
        }

        return true 
    }
}