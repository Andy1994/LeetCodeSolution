class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var dict = [Int:Int]()
        var result = [Int]()
        guard nums.count > 0 else {
            return result
        }
        for index in 0 ..< nums.count {
            guard let value = dict[nums[index]] else {
                let count = countNum(nums, index)
                dict[nums[index]] = count
                result.append(count)
                continue
            }
            result.append(value)
        }
        return result
    }
    
    func countNum(_ nums: [Int], _ index: Int) -> Int {
        var sum = 1
        for i in 0 ..< nums.count {
            if i == index {
                continue
            }
            sum *= nums[i]
        }
        return sum
    }
}

print(Solution().productExceptSelf([1, 2, 3, 4]))
