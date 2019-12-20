class Solution {
  
  private var solution = [[Int]]()
  private var curSolution = [Int]()
  
  func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let candidates = candidates.sorted(by: <)
    backTarck(candidates: candidates, target: target, lastIdx: 0)
    return solution
  }
  
  private func backTarck(candidates: [Int], target: Int, lastIdx: Int) {
    if target == 0 {
      solution.append(curSolution)
    } else if target < 0 {
      return
    } else {
      var i = lastIdx
      while i < candidates.count {
        let candidate = candidates[i]
        curSolution.append(candidate)
        backTarck(candidates: candidates, target: target - candidate, lastIdx: i)
        curSolution.remove(at: curSolution.count - 1)
        while i < candidates.count && candidates[i] == candidate {
          i += 1
        }
      }
    }
  }
}

print(Solution().combinationSum([2, 3, 6, 7], 7))