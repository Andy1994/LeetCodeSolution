/*
 303. Range Sum Query - Immutable
 
 Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.

 Implement the NumArray class:

 NumArray(int[] nums) Initializes the object with the integer array nums.
 int sumRange(int i, int j) Return the sum of the elements of the nums array in the range [i, j] inclusive (i.e., sum(nums[i], nums[i + 1], ... , nums[j]))
 */


class NumArray {
    
    var cache: [Int]!

    init(_ nums: [Int]) {
        cache = Array(repeating: 0, count: nums.count + 1)
        var sum = 0
        for i in 0 ..< nums.count {
            sum += nums[i]
            cache[i+1] = sum
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return cache[j + 1] - cache[i]
    }
}
