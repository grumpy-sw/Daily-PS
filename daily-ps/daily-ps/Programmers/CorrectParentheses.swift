//
//  CorrectParentheses.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class CorrectParentheses {
    func run() {
        print(solution("))))))"))
    }
    
    func solution(_ s:String) -> Bool {
        var ans: Bool = false
        let parentheses = Array(s).map { String($0) }
        var stack: [String] = []
        
        for index in 0..<parentheses.count {
            if parentheses[index] == "(" {
                stack.append(parentheses[index])
            } else {
                if stack.isEmpty {
                    return false
                } else {
                    stack.removeLast()
                }
            }
        }
        
        return stack.isEmpty
    }
}
