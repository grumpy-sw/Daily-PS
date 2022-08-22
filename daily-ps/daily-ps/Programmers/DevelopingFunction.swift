//
//  DevelopingFunction.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class DevelopingFunction {
    func run() {
        print(solution([93, 30, 55], [1, 30, 5]))
    }
    
    func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        var required: [Int] = []
        var result: [Int] = []
        
        for index in 0..<progresses.count {
            let remainProgress = 100 - progresses[index]
            let remainOver = remainProgress % speeds[index]
            
            if remainOver == 0 {
                required.append(remainProgress / speeds[index])
            } else {
                required.append(remainProgress / speeds[index] + 1)
            }
        }
        
        var queue = [Int]()
        for index in 0..<required.count {
            if queue.isEmpty {
                queue.append(required[index])
            } else {
                let front = queue.first!
                
                if required[index] <= front {
                    queue.append(required[index])
                } else {
                    result.append(queue.count)
                    queue = [required[index]]
                }
            }
        }
        
        result.append(queue.count)
        
        return result
    }
}
