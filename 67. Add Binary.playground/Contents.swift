class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        if a == "" {
            return b
        }
        if b == "" {
            return a
        }
        var result = [Character]()
        let aArray = reversed(Array(a))
        let bArray = reversed(Array(b))
        var i = 0
        var n = "0"
        while i < (aArray.count > bArray.count ? aArray.count : bArray.count) {
            result.append("0")
            var aValue = "0"
            var bValue = "0"
            if i < aArray.count {
                aValue = String(aArray[i])
            }
            if i < bArray.count {
                bValue = String(bArray[i])
            }
            if (aValue == "0" && bValue == "1") || (aValue == "1" && bValue == "0") {
                if n == "0" {
                    result[i] = "1"
                } else if n == "1" {
                    result[i] = "0"
                    n = "1"
                }
            } else if aValue == "0" && bValue == "0" {
                if n == "0" {
                    result[i] = "0"
                } else if n == "1" {
                    result[i] = "1"
                    n = "0"
                }
            } else if aValue == "1" && bValue == "1" {
                if n == "0" {
                    result[i] = "0"
                } else if n == "1" {
                    result[i] = "1"
                }
                n = "1"
            }
            i += 1
        }
        if n == "1" {
            result.append("1")
        }
        let strReversed = reversed(result)
        var strResult = ""
        for i in 0 ..< strReversed.count {
            strResult += String(strReversed[i])
        }
        return strResult
    }
    
    func reversed(_ array: [Character]) -> [Character] {
        var result = [Character]()
        for i in 1 ... array.count {
            result.append(array[array.count - i])
        }
        return result
    }
}

print(Solution().addBinary("11", "1"))
