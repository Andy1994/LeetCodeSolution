class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = [Int]()
        for num2 in nums2 {
            if result.contains(num2) {
                continue
            }
            for num1 in nums1 {
                if num2 == num1 {
                    result.append(num2)
                    break
                }
            }
        }
        return result
    }
}

print(Solution().intersection([2, 2, 1, 1, 1], [1, 2, 2, 1]))
