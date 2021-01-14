/*
 1130. Minimum Cost Tree From Leaf Values
 
 Given an array arr of positive integers, consider all binary trees such that:

 Each node has either 0 or 2 children;
 The values of arr correspond to the values of each leaf in an in-order traversal of the tree.  (Recall that a node is a leaf if and only if it has 0 children.)
 The value of each non-leaf node is equal to the product of the largest leaf value in its left and right subtree respectively.
 Among all possible binary trees considered, return the smallest possible sum of the values of each non-leaf node.  It is guaranteed this sum fits into a 32-bit integer.
 */

class Solution {
    let infi = Int.max / 2
    func mctFromLeafValues(_ arr: [Int]) -> Int {
        guard !arr.isEmpty else {
            return 0
        }
        let n = arr.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        // len = 1
        for i in 0 ..< n {
            dp[i][i] = 0
        }
        guard n >= 2 else {
            return dp[0][n-1]
        }
        // len = 2
        for i in 0 ..< n - 1 {
            dp[i][i+1] = arr[i] * arr[i+1]
        }
        guard n >= 3 else {
            return dp[0][n-1]
        }
        // len 3 and above
        for len in 3 ... n {
            for i in 0 ... n - len {
                let j = i + len - 1
                dp[i][j] = infi
                for k in i ..< j {
                    dp[i][j] = min(dp[i][j], dp[i][k] + dp[k+1][j] + maxVal(arr, i, k) * maxVal(arr, k+1, j))
                }
            }
        }
        return dp[0][n-1]
    }
    
    func maxVal(_ arr: [Int], _ low: Int, _ high: Int) -> Int {
        var maxV = Int.min
        for i in low ... high {
            maxV = max(maxV, arr[i])
        }
        return maxV
    }
}

Solution().mctFromLeafValues([6,2,4])
