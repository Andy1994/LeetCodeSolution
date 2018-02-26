class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        if nums == [] {
            return []
        }
        var dict = [Int:Int](), disappearedNums = [Int]()
        for num in nums {
            dict[num] = 1
        }
        for index in 1 ... nums.count {
            if dict[index] == nil {
                disappearedNums.append(index)
            }
        }
        return disappearedNums
    }
}

print(Solution().findDisappearedNumbers([4,3,2,7,8,2,3,1]))
