//
//  NumberStringAndWord.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/29.
//

// Level 1. 숫자 문자열과 영단어
import Foundation

final class NumberStringAndWord {
    func run() {
        print(solution("2three45sixseven"))
    }
    
    func solution(_ s: String) -> Int {
        if let num = Int(s) {
            return num
        }
        
        var offset = 0
        let arr = Array(s).map{ String($0) }
        var result: [String] = []
        
        while offset < s.count {
            let head = arr[offset]
            
            if head == "z" {
                result.append("0")
                offset += 4
            } else if head == "o" {
                result.append("1")
                offset += 3
            } else if head == "t" {
                if arr[offset...offset+2].joined() == "two" {
                    result.append("2")
                    offset += 3
                } else if arr[offset...offset+4].joined() == "three" {
                    result.append("3")
                    offset += 5
                }
            } else if head == "f" {
                if arr[offset...offset+3].joined() == "five" {
                    result.append("5")
                } else if arr[offset...offset+3].joined() == "four" {
                    result.append("4")
                }
                offset += 4
            } else if head == "s" {
                if arr[offset...offset+2].joined() == "six" {
                    result.append("6")
                    offset += 3
                } else if arr[offset...offset+4].joined() == "seven" {
                    result.append("7")
                    offset += 5
                }
            } else if head == "e" {
                result.append("8")
                offset += 5
            } else if head == "n" {
                result.append("9")
                offset += 4
            } else {
                result.append(arr[offset])
                offset += 1
            }
        }
        
        return Int(result.joined())!
    }
}
