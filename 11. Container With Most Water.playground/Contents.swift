class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            maxArea = max(maxArea, min(height[left], height[right]) * abs(right - left))
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }
}

print(Solution().maxArea([1,8,6,2,5,4,8,3,7]))
