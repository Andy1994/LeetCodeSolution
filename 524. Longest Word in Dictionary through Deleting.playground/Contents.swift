class Solution {
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        let sArray = Array(s)
        var result = ""
        var resultArray = [String]()
        for str in d {
            var tempExist = true
            var num = -1
            for cha in Array(str) {
                var isExist = false
                for index in 0 ..< sArray.count {
                    if index > num && cha == sArray[index] {
                        isExist = true
                        num = index
                        break
                    }
                }
                if !isExist {
                    tempExist = false
                    break
                }
            }
            if tempExist {
                if str.count > result.count {
                    result = str
                    resultArray = [result]
                }
                if str.count == result.count {
                    result = str
                    resultArray.append(result)
                }
            }
        }
        return resultArray.sorted().first ?? ""
    }
}

print(Solution().findLongestWord("abpcplea", ["a","b","c","awef","awefe","ewafeffewafewf"]))


