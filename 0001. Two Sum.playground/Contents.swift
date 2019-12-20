class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for i in 0 ..< nums.count {
            let num = nums[i]
            guard let j = dict[target - num] else {
                dict[num] = i
                continue
            }
            return [i, j]
        }
        return []
    }
}

print(Solution().twoSum([2, 7, 11, 15], 9))
