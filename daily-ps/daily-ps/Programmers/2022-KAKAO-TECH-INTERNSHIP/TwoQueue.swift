//
//  TwoQueue.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/20.
//

// Level 2. 두 큐 합 같게 만들기

import Foundation

final class TwoQueue {
    func run() {
        print(solution([1, 2, 1, 2], [1, 10, 1, 2]))
    }
    
    func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
        let total = queue1 + queue2
        let sum = total.reduce(0, +)
        let target = sum / 2
        // Early Exit: 1) 두 큐의 합이 홀수이거나 2) target보다 큰 숫자가 있는 경우
        if sum % 2 == 1 {
            return -1
        }
        
        if total.filter { $0 > target }.count > 0 {
            return -1
        }
        
        var start = 0
        var end = queue1.count
        var count = 0
        var sumOfQueue1 = queue1.reduce(0, +)
        
        while end < total.count && start <= end {
            if sumOfQueue1 == target {
                break
            } else if sumOfQueue1 > target {
                sumOfQueue1 -= total[start]
                start += 1
            } else {
                sumOfQueue1 += total[end]
                end += 1
            }
            count += 1
        }
        if sumOfQueue1 != target {
            return -1
        }
        return count
    }
}
