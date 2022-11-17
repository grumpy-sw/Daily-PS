//
//  NextNumber.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/17.
//

// Level 2. 다음 큰 수
import Foundation

final class NextNumber {
    func run () {
        print(solution(78)) // 83
    }
    
    func solution(_ n: Int) -> Int {
        var answer: Int = n + 1
        
        // n을 2진수로 변환했을 때 1의 개수 구하기
        let count = oneCount(n)
        
        while true {
            if count == oneCount(answer) {
                break
            } else {
                answer += 1
            }
        }
        
        return answer
    }
    
    func oneCount(_ n: Int) -> Int {
        return Array(String(n, radix: 2, uppercase: false)).filter{ $0 == "1" }.count
    }
}
