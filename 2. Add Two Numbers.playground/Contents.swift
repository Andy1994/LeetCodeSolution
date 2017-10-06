public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class Solution {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var c1 = l1
    var c2 = l2
    let result = ListNode(0)
    var d = result
    var sum = 0
    while c1 != nil || c2 != nil {
      sum /= 10
      if c1 != nil {
        sum += c1?.val ?? 0
        c1 = c1!.next
      }
      if c2 != nil {
        sum += c2?.val ?? 0
        c2 = c2!.next
      }
      d.next = ListNode(sum % 10)
      d = d.next!
    }
    if sum / 10 == 1 {
      d.next = ListNode(1)
    }
    return result.next
  }
}

let l1 = ListNode(1)
let l2 = ListNode(4)
let l3 = ListNode(4)
l1.next = l2
l2.next = l3
let p1 = ListNode(5)
let p2 = ListNode(6)
let p3 = ListNode(4)
p1.next = p2
p2.next = p3
print(Solution().addTwoNumbers(l1, p1))