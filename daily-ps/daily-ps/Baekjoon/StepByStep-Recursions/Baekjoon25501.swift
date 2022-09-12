//
//  Baekjoon25501.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/12.
//

import Foundation

final class Baekjoon25501 {
    var count: Int = 0
    func run() {
        let N = Int(readLine()!)!
        var words: [String] = []
        for _ in 0..<N {
            words.append(readLine()!)
        }
        var result: String = ""
        words.forEach {
            count = 0
            result += "\(isPalindrome($0)) \(count)\n"
        }
        
        print(result)
    }

    func isPalindrome(_ s: String) -> Int {
        return recursion(s, 0, s.count - 1)
    }
    
    func recursion(_ s: String, _ l: Int, _ r: Int) -> Int {
        let stringArray = Array(s).map{ String($0) }
        var isPal: Int = 1
        
        var left = l
        var right = r
        
        while true {
            count += 1
            if left >= right {
                isPal = 1
                break
            }
            
            if stringArray[left] != stringArray[right] {
                isPal = 0
                break
            } else {
                left += 1
                right -= 1
            }
        }
        
        return isPal
    }
}
