//
//  ParenthesisConversion.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/28.
//

// Level 2. 괄호 변환
import Foundation

final class ParenthesisConversion {
    func run() {
        print(solution("(()())()"))
    }
    
    
    func solution(_ p: String) -> String {
        if p.isEmpty || isCorrect(Array(p).map{ String($0) }) {
            return p
        }
        
        let parr = Array(p).map{ String($0) }
        var u: [String] = []
        var v: [String] = []
        var result: [String] = []
        
        for i in 1...(parr.count)/2 {
            if isBalanced(Array(parr[0..<2*i])) {
                u = Array(parr[0..<2*i])
                v = Array(parr[2*i..<parr.count])
                break
            }
        }
        
        if isCorrect(u) {
            result += (u + Array(solution(v.joined())).map{ String($0) })
        } else {
            result.append("(")
            result.append(solution(v.joined()))
            result.append(")")
            
            for index in 1..<u.count-1 {
                result.append((u[index] == "(") ? ")" : "(")
            }
        }
        
        return result.joined()
    }
    
    // 균형잡힌 괄호 문자열인지 확인하는 메서드
    func isBalanced(_ p: [String]) -> Bool {
        var count = 0
        for index in p {
            count += (index == "(" ? 1 : -1)
        }
        if count != 0 {
            return false
        }
        return true
    }
    
    // 올바른 괄호 문자열인지 확인하는 메서드
    func isCorrect(_ p: [String]) -> Bool {
        var stack: [String] = []
        for index in p {
            if index == "(" {
                stack.append(index)
            } else {
                if stack.isEmpty {
                    return false
                } else {
                    stack.removeLast()
                }
            }
        }
        
        if stack.isEmpty {
            return true
        }
        
        return false
    }
}
