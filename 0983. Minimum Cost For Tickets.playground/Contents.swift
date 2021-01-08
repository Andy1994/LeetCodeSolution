/*
 983. Minimum Cost For Tickets
 
 In a country popular for train travel, you have planned some train travelling one year in advance.  The days of the year that you will travel is given as an array days.  Each day is an integer from 1 to 365.

 Train tickets are sold in 3 different ways:

 a 1-day pass is sold for costs[0] dollars;
 a 7-day pass is sold for costs[1] dollars;
 a 30-day pass is sold for costs[2] dollars.
 The passes allow that many days of consecutive travel.  For example, if we get a 7-day pass on day 2, then we can travel for 7 days: day 2, 3, 4, 5, 6, 7, and 8.

 Return the minimum number of dollars you need to travel every day in the given list of days.
 */

class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var cache = [Int:Int]()
        func dp(_ i: Int) -> Int {
            if i > 365 {
                return 0
            }
            if let res = cache[i] {
                return res
            }
            var res = 0
            if days.contains(i) {
                res = min(dp(i + 1) + costs[0], dp(i + 7) + costs[1])
                res = min(res, dp(i + 30) + costs[2])
            } else {
                res = dp(i + 1)
            }
            cache[i] = res
            return res
        }
        return dp(1)
    }
}

print(Solution().mincostTickets([1,4,6,7,8,20], [2,7,15]))
