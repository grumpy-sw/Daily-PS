//
//  Baekjoon2477.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/28.
//

import Foundation

final class Baekjoon2477 {
    func run() {
        var x: [Int] = []
        var y: [Int] = []
        let melon = Int(readLine()!)!
        
        var nx = 0
        var ny = 0
        
        for _ in 0..<6 {
            let tokens = readLine()!.split(separator: " ").map{ Int($0)! }
            let type = tokens[0]
            let len = tokens[1]
            
            if type == 1 {
                nx += len
            } else if type == 2 {
                nx -= len
            } else if type == 3 {
                ny -= len
            } else {
                ny += len
            }
            
            x.append(nx)
            y.append(ny)
        }
        
        var temp = 0
        for index in 0..<x.count-1 {
            temp += (x[index] + x[index+1]) * (y[index] - y[index+1])
        }
        let volume = abs(temp) / 2
        
        print(volume * melon)
    }
}
