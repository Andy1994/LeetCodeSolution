class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var result:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var val = 1, p = n
        for i in 0 ..< n / 2 {
            for col in i ..< i + p {
                result[i][col] = val
                val += 1
            }
            for row in i + 1 ..< i + p {
                result[row][i + p - 1] = val
                val += 1
            }
            if i + p - 2 >= i {
                for col in (i ... i + p - 2).reversed() {
                    result[i + p - 1][col] = val
                    val += 1
                }
            }
            if i + p - 2 >= i + 1 {
                for row in (i + 1 ... i + p - 2).reversed() {
                    result[row][i] = val
                    val += 1
                }
            }
            p -= 2
        }
        if n % 2 != 0 {
            result[n / 2][n / 2] = val
        }
        return result
    }
}

print(Solution().generateMatrix(10))
