public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class Solution {
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var headNode = head
    var length = 1
    while headNode?.next != nil {
      headNode = headNode?.next
      length += 1
    }
    let removeNode = length - n + 1
    if length == n {
      return head?.next
    }
    headNode = head
    for i in 2 ... length {
      if i == removeNode {
        headNode?.next = headNode?.next?.next
      } else {
        headNode = headNode?.next
      }
    }
    return head
  }
}

let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
l1.next = l2
l2.next = l3
Solution().removeNthFromEnd(l1, 2)


