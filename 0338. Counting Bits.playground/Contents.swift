/*
 338. Counting Bits
 
 Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
 */

class Solution {
    func countBits(_ num: Int) -> [Int] {
        var res = Array(repeating: 0, count: num + 1)
        for i in 0 ... num {
            res[i] = i.nonzeroBitCount
        }
        return res
    }
}

Solution().countBits(5)
