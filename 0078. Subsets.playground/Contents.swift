class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        let nums = nums.sorted()
        find(&res, &path, nums, 0)
        return res
    }
    
    private func find(_ res: inout [[Int]], _ path: inout [Int], _ nums: [Int], _ index: Int) {
        res.append(path)
        for i in index ..< nums.count {
            path.append(nums[i])
            find(&res, &path, nums, i + 1)
            path.removeLast()
        }
    }
}

print(Solution().subsets([1, 2, 3]))
