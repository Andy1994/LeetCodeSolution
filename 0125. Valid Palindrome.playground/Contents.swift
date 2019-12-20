class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var chaArray = [Character]()
        for cha in Array(s.lowercased()) {
            if (cha >= "a" && cha <= "z") || (cha >= "0" && cha <= "9") {
                chaArray.append(cha)
            }
        }
        for i in 0 ..< chaArray.count / 2 {
            if chaArray[i] != chaArray[chaArray.count - 1 - i] {
                return false
            }
        }
        return true
    }
}

print(Solution().isPalindrome("0P"))
