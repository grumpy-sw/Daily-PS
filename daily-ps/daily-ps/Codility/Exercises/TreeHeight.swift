//
//  TreeHeight.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/31.
//

import Foundation

final class TreeHeight {
    func run() {
        print(
            solution(
                Tree(5, Tree(3, Tree(20), Tree(21)), Tree(10, Tree(1)))
            )
        )
    }
    
    public func solution(_ T : Tree?) -> Int {
        guard let T = T else {
            return -1
        }
        return dfs(T, 0)
    }
    
    public func dfs(_ tree: Tree, _ depth: Int) -> Int {
        var leftDepth = 0
        var rightDepth = 0
        
        if let left = tree.l {
            leftDepth = dfs(left, depth + 1)
        }
        if let right = tree.r {
            rightDepth = dfs(right, depth + 1)
        }
        
        if tree.l == nil, tree.r == nil {
            return depth
        }
        return max(leftDepth, rightDepth)
    }
    
    public class Tree {
        public var x: Int = 0
        public var l: Tree?
        public var r: Tree?
        public init() { }
        
        init(_ x: Int = 0, _ l: Tree? = nil, _ r: Tree? = nil) {
            self.x = x
            self.l = l
            self.r = r
        }
    }
}
