//
//  Tuples.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/11.
//

import Foundation

final class Tuples {
    
    func run() {
        print(solution("{{1,2,3},{2,1},{1,2,4,3},{2}}"))
    }
    
    func solution(_ s: String) -> [Int] {
        var result: [Int] = []
        let sets = removeBothOutsideParenthesis(s).components(separatedBy: "},{").map{  removeOutsideParenthesis($0) }.map{ $0.split(separator: ",").map{ Int($0)! }}.sorted { s1, s2 in
            return s1.count < s2.count
        }
        
        result = sets[0]
        
        for index in 1..<sets.count {
            let next = sets[index].filter{ !result.contains($0) }.last!
            result.append(next)
        }
        
        return result
    }
    
    func removeBothOutsideParenthesis(_ s: String) -> String {
        let array = Array(s).map{ String($0) }
        
        return array[1...array.count-2].joined()
    }
    
    func removeOutsideParenthesis(_ s: String) -> String {
        var array = Array(s).map{ String($0) }
        if array.last == "}" {
            array.removeLast()
        }
        if array.first == "{" {
            array.removeFirst()
        }
        return array.joined()
    }
    
}

