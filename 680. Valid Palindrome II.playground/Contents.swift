class Solution {
    func validPalindrome(_ s: String) -> Bool {
        var chaArray = Array(s)
        for i in 0 ..< chaArray.count / 2 {
            if chaArray[i] != chaArray[chaArray.count - 1 - i] {
                var cha1:[Character] = Array(s)
                var cha2:[Character] = Array(s)
                cha1.remove(at: i)
                cha2.remove(at: chaArray.count - 1 - i)
                if isPalindrome(cha1) || isPalindrome(cha2) {
                    return true
                }
                return false
            }
        }
        return true
    }
    
    func isPalindrome(_ chaArray:[Character]) -> Bool {
        for i in 0 ..< chaArray.count / 2 {
            if chaArray[i] != chaArray[chaArray.count - 1 - i] {
                return false
            }
        }
        return true
    }
}

print(Solution().validPalindrome("aceefebca"))
