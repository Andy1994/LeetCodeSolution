public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class Solution {
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
      return l2
    }
    if l2 == nil {
      return l1
    }
    var list: ListNode?
    if l1!.val > l2!.val{
      list = l2
      list!.next = mergeTwoLists(l1,l2!.next)
    } else {
      list = l1
      list!.next = mergeTwoLists(l1!.next,l2)
    }
    return list
  }
}