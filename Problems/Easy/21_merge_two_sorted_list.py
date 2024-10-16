# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

from typing import Optional

class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        res = ListNode()

        while list1 and list2:
            if list1.val < list2.val:
                res.next = list1.val
                list1 = list1.next
                print("Res: ", res)
                print("L1: ", list1)

            else:
                res.next = list2.val
                list2 = list2.next
                print("Res: ", res)
                print("L2: ", list2)

        return res.next


if __name__ == '__main__':
    Solution.mergeTwoLists(Solution, [1,2,4], [1,3,4])