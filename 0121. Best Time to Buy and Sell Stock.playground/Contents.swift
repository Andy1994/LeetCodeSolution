class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count != 0 else {
      return 0
    }
    var minPrice = prices[0]
    var maxBenefit = 0
    for i in 0 ..< prices.count {
      minPrice = min(minPrice, prices[i])
      maxBenefit = max(maxBenefit, prices[i] - minPrice)
    }
    return maxBenefit
  }
}