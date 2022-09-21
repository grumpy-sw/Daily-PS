//
//  DiscController.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/25.
//

import Foundation

final class DiscController {
    func run() {
        print(solution([[0, 3], [1, 9], [2, 6], [30, 3]]))
    }
    
    func solution(_ jobs:[[Int]]) -> Int {
        var current: Int = 0
        var total: Int = 0
        var count: Int = 0
        var sortedJob = sortByStartTime(jobs)
        var jobsQueue = [sortedJob.removeFirst()]
        current = jobsQueue.first![0]
        
        while count < jobs.count {
            let front = jobsQueue.removeFirst()
            
            if current <= front[0] {
                current = front[0]
            }
            
            total += current - front[0] + front[1]
            current += front[1]
            print("\(front), total: \(total), current: \(current)")
            
            if sortedJob.isEmpty {
                
                break
            }
            var waitings = sortedJob.filter { $0[0] <= current }
            if waitings.isEmpty {
                sortedJob = sortByRunningTime(sortedJob)
                jobsQueue.append(sortedJob.removeFirst())
            } else {
                let next = sortByRunningTime(waitings).first!
                jobsQueue.append(next)
                sortedJob.remove(at: sortedJob.firstIndex(of: next) ?? 0)
            }
            
            count += 1
        }
        
        return total / jobs.count
    }
    
    func sortByStartTime(_ jobs: [[Int]]) -> [[Int]] {
        let sorted = jobs.sorted {
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            } else {
                return $0[0] < $1[0]
            }
        }
        return sorted
    }
    
    func sortByRunningTime(_ jobs: [[Int]]) -> [[Int]] {
        let sorted = jobs.sorted(by: {
            $0[1] < $1[1]
        })
        return sorted
    }
}
