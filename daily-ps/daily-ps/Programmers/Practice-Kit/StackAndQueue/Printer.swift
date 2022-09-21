//
//  Printer.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/24.
//

import Foundation

final class Printer {
    func run() {
        print(solution([1, 1, 9, 1, 1, 1], 0)) // C D A B
    }
    
    func solution(_ priorities:[Int], _ location:Int) -> Int {
        let target = Task(label: String(location), priority: priorities[location])
        var queue: [Task] = []
        
        for index in 0..<priorities.count {
            queue.append(Task(label: String(index), priority: priorities[index]))
        }
        
        let pos = process(queue).firstIndex(where: { task in
            task.label == target.label
        })! + 1
        
        return pos
    }
    
    func process(_ tasks: [Task]) -> [Task] {
        var queue = tasks
        var result: [Task] = []
        
        while !queue.isEmpty {
            let front = queue.removeFirst()
            let filtered = queue.filter {
                $0.priority > front.priority
            }
            
            if filtered.count == 0 {
                result.append(front)
            } else {
                queue.append(front)
            }
        }
        
        return result
    }
    
    struct Task {
        let label: String
        let priority: Int
    }
}
