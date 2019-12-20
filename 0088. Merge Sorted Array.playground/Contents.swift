class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var tempNums1:[Int] = []
        for i in 0 ..< m {
            tempNums1.append(nums1[i])
        }
        nums1 = tempNums1
        for num2 in nums2 {
            if nums1.count == 0 {
                nums1.append(num2)
                continue
            }
            for i in 0 ..< nums1.count {
                if nums1[i] <= num2 {
                    if i == nums1.count - 1 {
                        nums1.append(num2)
                    } else {
                        if num2 < nums1[i + 1] {
                            nums1.insert(num2, at: i + 1)
                            break
                        }
                    }
                } else {
                    nums1.insert(num2, at: i)
                    break
                }
            }
        }
    }
}

var nums1:[Int] = []
let nums2:[Int] = [1]
Solution().merge(&nums1, 0, nums2, 1)
print(nums1);

