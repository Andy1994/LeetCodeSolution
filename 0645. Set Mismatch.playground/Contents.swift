class Solution {
  func findErrorNums(_ nums: [Int]) -> [Int] {
    var dict = [String:Int]()
    var result = [Int]()
    for num in nums {
      if dict[String(num)] == nil {
        dict[String(num)] = 1
      } else {
        result.append(num)
      }
    }
    var temp = 1
    while dict[String(temp)] != nil {
      temp += 1
    }
    result.append(temp)
    return result
  }
}

print(Solution().findErrorNums([37,62,43,27,12,66,36,18,39,54,61,65,47,32,23,2,46,8,4,24,29,38,63,39,25,11,45,28,44,52,15,30,21,7,57,49,1,59,58,14,9,40,3,42,56,31,20,41,22,50,13,33,6,10,16,64,53,51,19,17,48,26,34,60,35,5]))
