public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class Solution {
  func swapPairs(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
      return head
    }
    let node = head?.next
    head?.next = swapPairs(head?.next?.next)
    node?.next = head
    return node
  }
}

let n1 = ListNode(1)
let n2 = ListNode(2)
let n3 = ListNode(3)
let n4 = ListNode(4)
n1.next = n2
n2.next = n3
n3.next = n4
print(Solution().swapPairs(n1))