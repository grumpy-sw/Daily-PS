//
//  ParkingBill.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/31.
//

import Foundation

final class ParkingBill {
    func run() {
        var E = "10:00"
        var L = "13:21"
        print(solution(&E, &L))
    }
    
    public func solution(_ E : inout String, _ L : inout String) -> Int {
        let entranceFee = 2
        let firstTimeFee = 3
        let HoursFee = 4
        
        let entrances = E.components(separatedBy: ":").map{ Int($0)! }
        let lefts = L.components(separatedBy: ":").map{ Int($0)! }
        
        let totalMinutes = (lefts[0] - entrances[0]) * 60 + (lefts[1] - entrances[1])
        
        if totalMinutes % 60 == 0 {
            return ((totalMinutes / 60) - 1) * HoursFee + entranceFee + firstTimeFee
        } else {
            return (totalMinutes / 60) * HoursFee + entranceFee + firstTimeFee
        }
    }
}
