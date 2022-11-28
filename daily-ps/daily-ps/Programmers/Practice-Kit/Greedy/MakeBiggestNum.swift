//
//  MakeBiggestNum.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/25.
//

import Foundation

final class MakeBiggestNum {
    func run() {
        print(solution("4177252841", 4))
    }
    
    func solution(_ number: String, _ k: Int) -> String {
        var k = k
        let numbers = Array(number).map{ String($0) }
        var stack: [String] = []
        
        for number in numbers {
            if k == 0 || number == "9" {
                stack.append(number)
            } else {
                if stack.isEmpty {
                    stack.append(number)
                } else {
                    var index = stack.count - 1
                    
                    while index >= 0 && k > 0 {
                        let last = stack[index]
                        if last == "9" || last >= number {
                            break
                        } else {
                            k -= 1
                            index -= 1
                            stack.removeLast()
                        }
                    }
                    stack.append(number)
                }
            }
        }
        
        while k > 0 {
            stack.removeLast()
            k -= 1
        }
        
        return stack.joined()
    }
}
