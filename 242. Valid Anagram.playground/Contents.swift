class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sArray = Array(s)
        let tArray = Array(t)
        if arrayToDict(sArray) == arrayToDict(tArray) {
            return true
        }
        return false
    }
    
    func arrayToDict(_ array:[Character]) -> [String:Int] {
        var dict = [String:Int]()
        for index in 0 ..< array.count {
            let string = String(array[index])
            if dict[string] != nil {
                dict[string] = dict[string]! + 1
            } else {
                dict[string] = 1
            }
        }
        return dict
    }
}

print(Solution().isAnagram("sdsdswe", "sdsdswew"))
