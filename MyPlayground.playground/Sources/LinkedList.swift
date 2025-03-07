//
//  LinkedList.swift
//  
//
//  Created by Luke Nguyen on 7/3/25.
//

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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
