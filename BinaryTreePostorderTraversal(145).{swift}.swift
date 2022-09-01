//
//  BinaryTreePostorderTraversal(145).swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-08-26.
//

import Foundation
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        
        guard let root = root else { return [] }
        
        return postorderTraversal(root.left) + postorderTraversal(root.right) + [root.val]
        
    }
}