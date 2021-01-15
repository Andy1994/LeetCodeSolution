/*
 123. Best Time to Buy and Sell Stock III
 
 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete at most two transactions.

 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

 Example 1:

 Input: prices = [3,3,5,0,0,3,1,4]
 Output: 6
 Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var cash1 = 0
        var cash2 = 0
        var hold1 = -prices[0]
        var hold2 = -prices[0]
        for i in 1 ..< prices.count {
            hold1 = max(hold1, -prices[i])
            cash1 = max(cash1, hold1 + prices[i])
            hold2 = max(hold2, cash1 - prices[i])
            cash2 = max(cash2, hold2 + prices[i])
        }
        return cash2
    }
}

Solution().maxProfit([3,3,5,0,0,3,1,4])
