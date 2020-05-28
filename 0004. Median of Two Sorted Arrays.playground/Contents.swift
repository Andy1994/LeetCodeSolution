/*
 4. Median of Two Sorted Arrays
 
 There are two sorted arrays nums1 and nums2 of size m and n respectively.

 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

 You may assume nums1 and nums2 cannot be both empty.
 
 */

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let num = (nums1 + nums2).sorted()
        let count = num.count
        if count % 2 == 0 {
            return Double(num[count / 2 - 1] + num[count / 2]) / 2
        } else {
            return Double(num[count / 2])
        }
    }
}

print(Solution().findMedianSortedArrays([1, 3], [2]))
