class Solution {
  func generateParenthesis(_ n: Int) -> [String] {
    var list = [String]()
    generateOneByOne(sublist: "", list: &list, left: n, right: n)
    return list
  }
  
  func generateOneByOne(sublist: String, list:inout [String], left: Int, right: Int) {
    if left > right {
      return
    }
    if left > 0 {
      generateOneByOne(sublist: sublist + "(", list: &list, left: left - 1, right: right)
    }
    if right > 0 {
      generateOneByOne(sublist: sublist + ")", list: &list, left: left, right: right - 1)
    }
    if left == 0 && right == 0 {
      list.append(sublist)
      return
    }
  }
}

print(Solution().generateParenthesis(5))