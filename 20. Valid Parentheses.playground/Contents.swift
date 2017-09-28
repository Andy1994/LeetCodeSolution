class Solution {
  
  var array = [Int]()
  
  func isValid(_ s: String) -> Bool {
    let stringArray = Array(s.characters)
    for index in 0 ..< s.characters.count {
      let str = String(stringArray[index])
      if str == "(" || str == "[" || str == "{" {
        push(str)
      } else {
        if pop(str) == false {
          return false
        }
      }
    }
    if array.isEmpty {
      return true
    }
    return false
  }
  
  func push(_ str: String) {
    if str == "(" {
      array.append(0)
    } else if str == "[" {
      array.append(1)
    } else {
      array.append(2)
    }
  }
  
  func pop(_ str: String) -> Bool {
    let num = array.count
    if num == 0 {
      return false
    }
    let s = array[num - 1]
    if s == 0 && str == ")" {
      array.remove(at: num - 1)
      return true
    }
    if s == 1 && str == "]" {
      array.remove(at: num - 1)
      return true
    }
    if s == 2 && str == "}" {
      array.remove(at: num - 1)
      return true
    }
    return false
  }
}