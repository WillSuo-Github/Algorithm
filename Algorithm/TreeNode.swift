//
//  TreeNode.swift
//  Algorithm
//
//  Created by great Lock on 2018/12/31.
//  Copyright © 2018 great Lock. All rights reserved.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(val: Int) {
        self.val = val
    }
    
    func maxDepth(root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(maxDepth(root: root.left), maxDepth(root: root.right)) + 1
    }
    
    func isValidBST(root: TreeNode?) -> Bool {
    
        return _helper(node:root);
    }
    
    private func _helper(node: TreeNode?) -> Bool {
        guard let node = node else {
            return true
        }
        
        if let left = node.left, node.val <= left.val {
            return false
        }
        
        if let right = node.right, node.val >= right.val {
            return false
        }
        
        return _helper(node:node.left) && _helper(node:node.right)
    }
    
    
    func preTraversal(root: TreeNode?) -> [Int] {
        var result = [Int]()
        var node = root
        var stack = [TreeNode]()
        
        while node != nil || !stack.isEmpty {
            if node != nil {
                result.append(node!.val)
                stack.append(node!)
                node = node!.left
            } else {
                node = stack.removeLast().right
            }
        }
        return result
    }
    
    func preTraversal2(root: TreeNode?) -> [Int] {
        var result = [Int]()
        if let node = root {
            result.append(node.val)
            if let left = node.left {
                result.append(contentsOf: preTraversal2(root: left))
            }
            if let right = node.right {
                result.append(contentsOf: preTraversal2(root: right))
            }
        }
        return result
    }
    
    func middleTraversal(root: TreeNode?) -> [Int] {
        
        var result = [Int]()
        var node = root
        var stack = [TreeNode]()
        
        while node != nil || !stack.isEmpty {
            if node != nil {
                stack.append(node!)
                node = node!.left
            }else {
                let last = stack.removeLast()
                result.append(last.val)
                node = last.right
            }
        }
        return result
    }
    
    func middleTraversal2(root: TreeNode?) -> [Int] {
        var result = [Int]()
        
        if let node = root {
            result.append(node.val)
        }
        
        if let left = root?.left {
            result.insert(contentsOf: middleTraversal2(root: left), at: 0)
        }
        
        if let right = root?.right {
            result.append(contentsOf: middleTraversal2(root: right))
        }
        
        return result
    }
    
    func backTraversal(root: TreeNode?) -> [Int] {
        var result = [Int]()
        
        if let left = root?.left {
            result.append(contentsOf: backTraversal(root: left))
        }
        
        if let right = root?.right {
            result.append(contentsOf: backTraversal(root: right))
        }
        
        if let node = root {
            result.append(node.val)
        }
        
        return result
    }
    
    func backTraversal2(root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        var topStack = [TreeNode]()
        var node = root
        
        while node != nil || !stack.isEmpty {
            if node != nil {
                stack.append(node!)
                
                node = node!.left
            }else {
                let last = stack.removeLast()
                if let right = last.right {
                    node = right
                    topStack.append(last)
                }else {
                    result.append(last.val)
                    if let r = topStack.last?.right, r.val == last.val {
                        while !topStack.isEmpty {
                            result.append(topStack.removeLast().val)
                        }
                    }
                }
                
            }
        }
        return result
    }
}

class TreeNodeTest {
    init() {
        let rootNode = TreeNode(val: 1)
        let node2 = TreeNode(val: 2)
        let node3 = TreeNode(val: 3)
        let node4 = TreeNode(val: 4)
        let node5 = TreeNode(val: 5)
        let node6 = TreeNode(val: 6)
        let node7 = TreeNode(val: 7)
        let node8 = TreeNode(val: 8)
        node5.left = node7
        node5.right = node8
        node2.left = node4
        node2.right = node5
        node3.right = node6
        rootNode.left = node2
        rootNode.right = node3
        
        print(rootNode.backTraversal2(root: rootNode))
    }
}
