class Solution {
  func titleToNumber(_ s: String) -> Int {
    let dict = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7,
                "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14,
                "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20,
                "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]
    let array = Array(s.characters)
    var result = 0
    for i in 0 ..< array.count {
      let value = String(array[i])
      result += dict[value]! * pow(26, b: array.count - i - 1)
    }
    return result
  }
  
  func pow(_ a: Int, b: Int) -> Int {
    if b == 0 {
      return 1
    }
    var result = a
    for _ in 0 ..< b - 1 {
      result = result * a
    }
    return result
  }
}
