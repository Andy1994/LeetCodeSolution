public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var head = head
        var result: ListNode? = ListNode(head?.val ?? 0)
        while head?.next != nil {
            head = head?.next
            let temp = ListNode(head?.val ?? 0)
            temp.next = result
            result = temp
        }
        return result ?? nil
    }
}

let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
l1.next = l2
l2.next = l3

print(Solution().reverseList(l1) ?? nil)

