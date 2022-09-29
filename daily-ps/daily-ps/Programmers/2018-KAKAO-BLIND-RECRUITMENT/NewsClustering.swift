//
//  NewsClustering.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/29.
//

import Foundation

final class NewsClustering {
    func run() {
        print(solution("12444", "abbb"))
    }
    
    func solution(_ str1: String, _ str2: String) -> Int {
        let const = 65536
        if str1.isEmpty, str2.isEmpty {
            return 1 * const
        }
        
        let str1 = Array(str1.lowercased()).map{ String($0) }
        let str2 = Array(str2.lowercased()).map{ String($0) }
        
        let subset1 = subset(str1).sorted()
        let subset2 = subset(str2).sorted()
        
        if subset1.isEmpty, subset2.isEmpty {
            return 1 * const
        }
        
        let inter = intersection(subset1, subset2)
        let union: Double = Double(subset1.count + subset2.count - inter.count)
        
        if inter.isEmpty, union <= 0 {
            return 65536
        } else {
            return Int(Double(inter.count)/Double(union) * Double(const))
        }
    }
    
    func subset(_ array: [String]) -> [String] {
        var result: [String] = []
        
        for offset in 0..<array.count-1 {
            if isAlphabet(array[offset]) && isAlphabet(array[offset+1]) {
                result.append("\(array[offset])\(array[offset+1])")
            }
        }
        return result
    }
    
    func isAlphabet(_ str: String) -> Bool {
        return str >= "a" && str <= "z"
    }
    
    func intersection(_ array1: [String], _ array2: [String]) -> [String] {
        var result: [String] = []
        var i: Int = 0
        var j: Int = 0
        
        func D(_ n1: inout Int, _ n2: inout Int) {
            if n1 == array1.count || n2 == array2.count {
                return
            }
            if array1[n1] == array2[n2] {
                result.append(array1[n1])
                n1 += 1
                n2 += 1
                D(&n1, &n2)
            } else if array1[n1] > array2[n2] {
                n2 += 1
                D(&n1, &n2)
            } else {
                n1 += 1
                D(&n1, &n2)
            }
        }
        D(&i, &j)
        return result
    }
}
