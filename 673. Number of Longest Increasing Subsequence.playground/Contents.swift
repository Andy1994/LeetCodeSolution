class Solution {
    
    /// old version --- time out
    var resultArray = [[Int]]()
    var sum = 1
    
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        for index in 0 ..< nums.count {
            recursion(nums, index, [])
        }
        resultArray = resultArray.sorted(by: { (array1, array2) -> Bool in
            return array1.count > array2.count
        })
        for index in 1 ..< resultArray.count {
            if resultArray[index].count == resultArray[0].count {
                sum += 1
            }
        }
        return sum
    }
    
    func recursion(_ nums: [Int], _ index: Int, _ result: [Int]) {
        var result = result
        if result.count == 0 {
            result.append(index)
        } else {
            if nums[index] > nums[result.last ?? 0] {
                result.append(index)
            }
        }
        if index != nums.count - 1 {
            for i in index + 1 ..< nums.count {
                recursion(nums, i, result)
            }
        } else {
            for array in resultArray {
                if array == result {
                    return
                }
            }
            resultArray.append(result)
        }
    }
}

print(Solution().findNumberOfLIS([1,2,3]))
