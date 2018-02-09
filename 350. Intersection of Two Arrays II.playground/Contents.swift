class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1 = nums1
        var result = [Int]()
        for num2 in nums2 {
            for index in 0 ..< nums1.count {
                if num2 == nums1[index] {
                    result.append(num2)
                    nums1.remove(at: index)
                    break
                }
            }
        }
        return result
    }
}

print(Solution().intersect([2], [2, 2, 1]))

