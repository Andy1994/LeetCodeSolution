/*
 449. Serialize and Deserialize BST
 
 Serialization is converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary search tree. There is no restriction on how your serialization/deserialization algorithm should work. You need to ensure that a binary search tree can be serialized to a string, and this string can be deserialized to the original tree structure.

 The encoded string should be as compact as possible.
 */

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Codec {
    
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var data = [String]()
        serialize(root, data: &data)
        return data.joined(separator: ",")
    }
    
    func serialize(_ root: TreeNode?, data: inout [String]) {
        guard let root = root else {
            data.append("#")
            return
        }
        data.append("\(root.val)")
        serialize(root.left, data: &data)
        serialize(root.right, data: &data)
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        var data = data.components(separatedBy: ",")
        guard !data.isEmpty, let rootVal = Int(String(data.removeFirst())) else {
            return nil
        }
        let root = TreeNode(rootVal)
        root.left = deserialize(&data)
        root.right = deserialize(&data)
        return root
    }
    
    func deserialize(_ data: inout [String]) -> TreeNode? {
        guard !data.isEmpty, let rootVal = Int(data.removeFirst()) else {
            return nil
        }
        let root = TreeNode(rootVal)
        root.left = deserialize(&data)
        root.right = deserialize(&data)
        return root
    }
}
