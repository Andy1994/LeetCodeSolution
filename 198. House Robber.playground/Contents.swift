class Solution {
    func rob(_ nums: [Int]) -> Int {
        var curt = 0, prev = 0, res = 0
        
        for num in nums {
            res = max(curt, prev + num)
            (curt, prev) = (res, curt)
        }
        
        return res
    }
}

print(Solution().rob([2, 1, 1, 2]))
