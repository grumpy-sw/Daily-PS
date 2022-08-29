//
//  Baekjoon2941.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/29.
//

import Foundation

final class Baekjoon2941 {
    func run() {
        solution()
    }
    
    func solution() {
        let croatian = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
        let input = Array(readLine()!).map { String($0) }
        var offset = 0
        var result = input.count
        
        for index in 0..<input.count {
            if index + offset >= input.count {
                break
            }
            
            if input[index + offset] == "c" || input[index + offset] == "l" || input[index + offset] == "n" || input[index + offset] == "s" || input[index + offset] == "j" || input[index + offset] == "z" {
                if (index + offset) + 1 < input.count {
                    let word = [input[index + offset], input[index + offset + 1]].joined()
                    if croatian.contains(word) {
                        offset += 1
                    }
                }
            } else if input[index + offset] == "d" {
                if (index + offset) + 2 < input.count {
                    let word = [input[index + offset], input[index + offset + 1], input[index + offset + 2]].joined()
                    if word == "dz=" {
                        offset += 2
                    }
                }
                
                if (index + offset) + 1 < input.count {
                    let word = [input[index + offset], input[index + offset + 1]].joined()
                    if croatian.contains(word) {
                        offset += 1
                    }
                }
            }
        }
        print(result - offset)
    }
}
