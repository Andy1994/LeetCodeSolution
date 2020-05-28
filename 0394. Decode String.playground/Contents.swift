/*
 394. Decode String
 
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

 Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

 Examples:

 s = "3[a]2[bc]", return "aaabcbc".
 s = "3[a2[c]]", return "accaccacc".
 s = "2[abc]3[cd]ef", return "abcabccdcdcdef".
 */

class Solution {
    func decodeString(_ s: String) -> String {
        var ans = ""
        var time = 0
        var temp = [Character]()
        var tempDeep = 0
        for c in s {
            if c == "[" {
                tempDeep += 1
                if tempDeep > 1 {
                    temp.append(c)
                }
            } else if c == "]" {
                if tempDeep > 1 {
                    temp.append(c)
                }
                tempDeep -= 1
            } else if isDigital(c) && tempDeep == 0 {
                time = time * 10 + (c.wholeNumberValue ?? 0)
            } else {
                if time == 0 {
                    ans += "\(c)"
                } else {
                    temp.append(c)
                }
            }
            if tempDeep == 0 && !temp.isEmpty && time != 0 {
                while time > 0 {
                    ans += decodeString(temp.compactMap { (c) in
                        return "\(c)"
                    }.joined())
                    time -= 1
                }
                time = 0
                temp.removeAll()
            }
        }
        return ans
    }
    
    func isDigital(_ c: Character) -> Bool {
        return c == "0" || c == "1" || c == "2" || c == "3" || c == "4" || c == "5" || c == "6" || c == "7" || c == "8" || c == "9"
    }
}

print(Solution().decodeString("3[a]2[b4[F]c]"))
