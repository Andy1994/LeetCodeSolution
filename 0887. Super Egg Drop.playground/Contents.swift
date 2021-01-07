/*
 887. Super Egg Drop
 
 You are given K eggs, and you have access to a building with N floors from 1 to N.

 Each egg is identical in function, and if an egg breaks, you cannot drop it again.

 You know that there exists a floor F with 0 <= F <= N such that any egg dropped at a floor higher than F will break, and any egg dropped at or below floor F will not break.

 Each move, you may take an egg (if you have an unbroken one) and drop it from any floor X (with 1 <= X <= N).

 Your goal is to know with certainty what the value of F is.

 What is the minimum number of moves that you need to know with certainty what F is, regardless of the initial value of F?

  

 Example 1:

 Input: K = 1, N = 2
 Output: 2
 Explanation:
 Drop the egg from floor 1.  If it breaks, we know with certainty that F = 0.
 Otherwise, drop the egg from floor 2.  If it breaks, we know with certainty that F = 1.
 If it didn't break, then we know with certainty F = 2.
 Hence, we needed 2 moves in the worst case to know what F is with certainty.
 */

class Solution {
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        var cache = [String:Int]()
        func dp(_ K: Int, _ N: Int) -> Int {
            if K == 1 {
                return N
            }
            if N == 0 {
                return 0
            }
            if let value = cache["\(K)-\(N)"] {
                return value
            }
            var res = Int.max
            var lo = 1, hi = N
            while lo <= hi {
                let mid = (lo + hi) / 2
                let broken = dp(K - 1, mid - 1)
                let not_broken = dp(K, N - mid)
                if broken > not_broken {
                    hi = mid - 1
                    res = min(res, broken + 1)
                } else {
                    lo = mid + 1
                    res = min(res, not_broken + 1)
                }
            }
            cache["\(K)-\(N)"] = res
            return res
        }
        return dp(K, N)
    }
}

Solution().superEggDrop(4, 5000)
