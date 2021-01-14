/*
 1227. Airplane Seat Assignment Probability
 
 n passengers board an airplane with exactly n seats. The first passenger has lost the ticket and picks a seat randomly. But after that, the rest of passengers will:

 Take their own seat if it is still available,
 Pick other seats randomly when they find their seat occupied
 What is the probability that the n-th person can get his own seat?
 */

class Solution {
    func nthPersonGetsNthSeat(_ n: Int) -> Double {
        guard n > 1 else {
            return 1
        }
        guard n > 2 else {
            return 0.5
        }
        var dp = Array(repeating: Double(0), count: n + 1)
        dp[1] = 1
        dp[2] = 0.5
        for i in 3 ... n {
            dp[i] = 1.0 / Double(i) // 1-st passanger took the 1-st place
                    + (1.0 - (1.0 + 1.0) / Double(i)) // the 1-st passanger didn't take the 1-st place or the 1-st passanger didn't take the i-th place, the 1-st passanger took any place except the 1-st and i-th
                    * dp[i-1]
        }
        return dp[n]
    }
}

Solution().nthPersonGetsNthSeat(1)
