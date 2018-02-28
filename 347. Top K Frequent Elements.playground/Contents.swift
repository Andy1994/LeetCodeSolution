class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int:Int]()
        for num in nums {
            guard let times = dict[num] else {
                dict[num] = 1
                continue
            }
            dict[num] = times + 1
        }
        var keys = Array(dict.keys)
        keys.sort { (key1, key2) -> Bool in
            let value1: Int = dict[key1]!
            let value2: Int = dict[key2]!
            return value1 > value2
        }
        return Array(keys[0 ..< k])
    }
}

print(Solution().topKFrequent([1,1,1,2,2,3], 2))
