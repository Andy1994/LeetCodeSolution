class Solution {
    
    var result = [[Int]]()
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        for num in 1 ... n {
            recursion(num, [], n, k)
        }
        return result
    }
    
    func recursion(_ currentNum: Int, _ numArray: [Int], _ n: Int, _ k: Int) {
        var numArray = numArray
        if currentNum > n {
            return
        }
        numArray.append(currentNum)
        if numArray.count == k {
            result.append(numArray)
            return
        }
        if currentNum + 1 <= n {
            for num in currentNum + 1 ... n {
                recursion(num, numArray, n, k)
            }
        }
    }
}

print(Solution().combine(4, 2))
