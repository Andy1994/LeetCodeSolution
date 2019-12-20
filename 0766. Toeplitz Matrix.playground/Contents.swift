class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        guard matrix.count > 0 else {
            return false
        }
        if matrix.count == 1 {
            return true
        }
        for i in 0 ..< matrix[0].count - 1 {
            var result = true
            for j in 1 ..< matrix.count {
                if i + j < matrix[0].count {
                    if matrix[0][i] != matrix[j][i + j] {
                        result = false
                    }
                }
            }
            if !result {
                return result
            }
        }
        for i in 1 ..< matrix.count - 1 {
            var result = true
            for j in i + 1 ..< matrix.count {
                if j - i < matrix[j].count {
                    if matrix[i][0] != matrix[j][j - i] {
                        result = false
                    }
                }
            }
            if !result {
                return result
            }
        }
        return true
    }
}

print(Solution().isToeplitzMatrix([[83],[64],[57]]))
