/*
 6. ZigZag Conversion
 
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:

 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 
 */

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }
        var a = Array(repeating: [Character](), count: numRows)
        var i = 0
        var isDown = true
        for c in s {
            a[i].append(c)
            if isDown {
                if i == numRows - 1 {
                    i -= 1
                    isDown = false
                } else {
                    i += 1
                }
            } else {
                if i == 0 {
                    i += 1
                    isDown = true
                } else {
                    i -= 1
                }
            }
        }
        return a.compactMap { (array) in
            return array.compactMap { (char) in
                return "\(char)"
            }.joined()
        }.joined()
    }
}

print(Solution().convert("AB", 1))
