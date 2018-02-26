class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        for num in nums {
            dict[num] = 1
        }
        for index in 0 ..< nums.count + 1 {
            if dict[index] == nil {
                return index
            }
        }
        return -1
    }
}

print(Solution().missingNumber([9,6,4,2,3,5,7,0,1]))
