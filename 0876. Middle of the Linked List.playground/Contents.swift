public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil && fast!.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
 
let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
let l4 = ListNode(4)
let l5 = ListNode(5)
l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5
print(Solution().middleNode(l1)?.val)

