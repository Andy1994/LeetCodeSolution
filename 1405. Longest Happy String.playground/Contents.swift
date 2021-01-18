/*
 1405. Longest Happy String
 
 A string is called happy if it does not have any of the strings 'aaa', 'bbb' or 'ccc' as a substring.

 Given three integers a, b and c, return any string s, which satisfies following conditions:

 s is happy and longest possible.
 s contains at most a occurrences of the letter 'a', at most b occurrences of the letter 'b' and at most c occurrences of the letter 'c'.
 s will only contain 'a', 'b' and 'c' letters.
 If there is no such string s return the empty string "".
 */

class Solution {
    class Model {
        var char: Character!
        var num: Int = 0
        init(char: Character, num: Int) {
            self.char = char
            self.num = num
        }
    }
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var array: [Model] = [Model(char: "a", num: a), Model(char: "b", num: b), Model(char: "c", num: c)]
        var res = ""
        while true {
            array.sort { (m1, m2) -> Bool in
                return m1.num < m2.num
            }
            //先放最多的, 如果上个放的2个字符串和剩余个数最多的字符相同，则放置次多的字符
            if res.count >= 2
                && Array(res)[res.count - 1] == array[2].char
                && Array(res)[res.count - 2] == array[2].char {
                if array[1].num > 0 {
                    array[1].num -= 1
                    res += "\(array[1].char!)"
                } else {
                    break
                }
            } else {
                if array[2].num > 0 {
                    array[2].num -= 1
                    res += "\(array[2].char!)"
                } else {
                    break
                }
            }
        }
        return res
    }
}

print(Solution().longestDiverseString(1, 1, 7))
print(Solution().longestDiverseString(2, 2, 1))
print(Solution().longestDiverseString(7, 1, 0))
