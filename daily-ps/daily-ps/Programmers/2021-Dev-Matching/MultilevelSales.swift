//
//  MultilevelSales.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/21.
//

import Foundation

final class MultilevelSales {
    func run() {
        print(solution(
            ["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"],
            ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"],
            ["young", "john", "tod", "emily", "mary"],
            [12, 4, 2, 5, 10]
        ))
    }
    
    func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
        var workers: [String: WorkerInfo] = ["-": WorkerInfo(referal: "", income: 0)]
        
        for index in 0..<enroll.count {
            let workerInfo = WorkerInfo(referal: referral[index], income: 0)
            workers.updateValue(workerInfo, forKey: enroll[index])
        }
        
        for index in 0..<seller.count {
            var stack: [String] = [seller[index]]
            var income = amount[index] * 100
            while !stack.isEmpty {
                let worker = stack.removeLast()
                
                if income < 10 {
                    workers[worker]?.income += income
                } else if income >= 10 {
                    // 본인의 수입 세팅
                    let distribution = income / 10
                    workers[worker]?.income += (income - distribution)
                    
                    // 추천인에게 수입 전달
                    income = distribution
                    if let referal = workers[worker]?.referal {
                        stack.append(referal)
                    }
                }
            }
        }
        
        var result: [Int] = []
        enroll.forEach {
            let income = workers[$0]?.income
            result.append(income ?? 0)
        }
        
        return result
    }
    
    struct WorkerInfo {
        let referal: String
        var income: Int
    }
}
