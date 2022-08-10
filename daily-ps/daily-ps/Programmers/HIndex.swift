//
//  HIndex.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/10.
//

import Foundation

final class HIndex {
    func run() {
        let testCase = [100, 100, 100, 100, 100]
        print(solution(testCase))  // 3
    }
    
    func solution(_ citations:[Int]) -> Int {
        let sortedCitation = citations.sorted { before, after in
            return before > after
        }
        
        var maxIndex = 0
        for index in 0...sortedCitation.first! {
            if sortedCitation.filter({ $0 >= index }).count >= index {
                maxIndex = index
            }
        }
        
        
        
        return maxIndex
    }
}
