//
//  Baekjoon9012.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/16.
//

import Foundation

final class Baekjoon9012 {
    func run() {
        let N = Int(readLine()!)!
        var problems: [String] = []
        var results: [String] = []
        for _ in 0..<N {
            problems.append(readLine()!)
        }
        
        for problem in problems {
            results.append(checkVPS(problem))
        }
        
        results.forEach {
            print($0)
        }
    }
    
    func checkVPS(_ problem: String) -> String {
        let parentheses: [String] = Array(problem).map{ String($0) }
        
        // Earlt Exit
        if parentheses.count % 2 != 0 || parentheses.first != "(" || parentheses.last != ")" {
            return "NO"
        }
        
        var stack: [String] = []

        for index in 0..<parentheses.count {
            let p = parentheses[index]

            if p == "(" {
                // ())(()
                stack.append(p)

            } else {
                if stack.isEmpty {
                    return "NO"
                } else {
                    stack.removeLast()
                }
            }
        }
        
        if stack.isEmpty {
            return "YES"
        } else {
            return "NO"
        }
    }
}
