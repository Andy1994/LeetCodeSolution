class Solution {
    func sortColors(_ nums: inout [Int]) {
        sort(&nums, 0, nums.count - 1)
    }
    
    func sort(_ a: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        var i = left
        var j = right
        let key = a[left]
        while i < j
        {
            while i < j && key <= a[j] {
                j -= 1
            }
            a[i] = a[j]
            while i < j && key >= a[i] {
                i += 1
            }
            a[j] = a[i]
        }
        a[i] = key
        sort(&a, left, i - 1)
        sort(&a, i + 1, right)
    }
}

var nums = [1,1,2,2,1,0,0,0,0,1,2]
print(Solution().sortColors(&nums))
