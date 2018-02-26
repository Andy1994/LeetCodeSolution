class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var dict = [Int:Int](), result = [Int]()
        for num in nums {
            if dict[num] == nil {
                dict[num] = 1
            } else {
                result.append(num)
            }
        }
        return result
    }
}

print(Solution().findDuplicates([4,3,2,7,8,2,3,1]))
