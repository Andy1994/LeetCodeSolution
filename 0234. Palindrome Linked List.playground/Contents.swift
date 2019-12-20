public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var head = head, nums = [Int]()
        while head != nil {
            nums.append(head!.val)
            head = head?.next
        }
        for i in 0 ..< nums.count / 2 {
            if nums[i] != nums[nums.count - 1 - i] {
                return false
            }
        }
        return true
    }
}

print(Solution().isPalindrome(nil))
