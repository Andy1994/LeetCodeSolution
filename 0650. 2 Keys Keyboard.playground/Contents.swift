/*
 650. 2 Keys Keyboard
 
 Initially on a notepad only one character 'A' is present. You can perform two operations on this notepad for each step:

 Copy All: You can copy all the characters present on the notepad (partial copy is not allowed).
 Paste: You can paste the characters which are copied last time.
  

 Given a number n. You have to get exactly n 'A' on the notepad by performing the minimum number of steps permitted. Output the minimum number of steps to get n 'A'.

 Example 1:

 Input: 3
 Output: 3
 Explanation:
 Intitally, we have one character 'A'.
 In step 1, we use Copy All operation.
 In step 2, we use Paste operation to get 'AA'.
 In step 3, we use Paste operation to get 'AAA'.
 */

class Solution {
    func minSteps(_ n: Int) -> Int {
        if n == 1 {
            return 0
        } else if n == 2 {
            return 2
        }
        var dp = Array(repeating: 0, count: n + 1)
        for i in 1 ... n {
            dp[i] = i
        }
        dp[1] = 0
        dp[2] = 2
        for i in 3 ... n {
            for j in 1 ..< i {
                if (i - j) % j == 0 {
                    dp[i] = min(dp[i], dp[j] + 1 + (i - j)/j)
                }
            }
        }
        return dp[n]
    }
}

Solution().minSteps(10)
