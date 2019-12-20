class Solution {
  func judgeCircle(_ moves: String) -> Bool {
    var x = 0, y = 0
    for cha in Array(moves) {
      if cha == "U" {
        x += 1
      } else if cha == "D" {
        x -= 1
      } else if cha == "L" {
        y += 1
      } else if cha == "R" {
        y -= 1
      }
    }
    return x == 0 && y == 0
  }
}
