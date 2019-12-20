class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        for num in nums {
            if dict[num] != nil {
                return num
            } else {
                dict[num] = 1
            }
        }
        return -1
    }
}
