class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [String:[Int]]()
        for index in 0 ..< nums.count {
            let num = nums[index]
            if dict[String(num)] == nil {
                dict[String(num)] = [index]
            } else {
                var temp = dict[String(num)]!
                temp.append(index)
                dict[String(num)] = temp
            }
        }
        for key in dict.keys {
            if dict[key]!.count > 1 {
                for index in 0 ..< dict[key]!.count - 1 {
                    if dict[key]![index + 1] - dict[key]![index] <= k {
                        return true
                    }
                }
            }
        }
        return false
    }
}

print(Solution().containsNearbyDuplicate([1,0,1,1], 0))
