class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String:[String]]()
        for str in strs {
            let sortedStr = String(str.characters.sorted())
            var value = [String]()
            if let dictValue = dict[sortedStr] {
                value = dictValue
            }
            value.append(str)
            dict[sortedStr] = value
        }
        return dict.values.map { value in value.sorted() }
    }
}
print(Solution().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
