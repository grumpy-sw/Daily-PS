//
//  ParkingFeeCalculation.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/12.
//

import Foundation

final class ParkingFeeCalculation {
    func run() {
        print(
            solution(
                [120, 0, 60, 591],
                ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]))
    }
    
    func solution(_ fees:[Int], _ records:[String]) -> [Int] {
        var ids: [String] = []
        var result: [Int] = []
        
        var parkingRecords: [[String]] = []
        records.forEach {
            let record = $0.split(separator: " ").map{ String($0) }
            parkingRecords.append(record)
        }
        
        
        parkingRecords.forEach {
            let id = $0[1]
            ids.append(id)
        }
        ids = removeDuplicateWord(ids).sorted()
        
        for id in ids {
            let records = parkingRecords.filter {
                $0[1] == id
            }
            let parkingTime = calculateParkingTime(records)
            if parkingTime <= fees[0] {
                result.append(fees[1])
            } else {
                let fee = fees[1] + Int(ceil(Double(parkingTime - fees[0]) / Double(fees[2]))) * fees[3]
                result.append(fee)
            }
        }
        print(result)
        
        return result
    }
    
    func removeDuplicateWord(_ id: [String]) -> [String] {
        let set = Set(id)
        return Array(set).map{ String($0) }
    }
    
    func calculateParkingTime(_ records: [[String]]) -> Int {
        var inoutStack: [String] = []
        var times = 0
        
        records.forEach {
            if $0[2] == "IN" {
                inoutStack.append($0[0])
            } else if $0[2] == "OUT" {
                let parkingTime: Int = Int(toDate($0[0])!.timeIntervalSince(toDate(inoutStack.removeLast())!)) / 60
                times += parkingTime
            }
        }
        if !inoutStack.isEmpty {
            let parkingTime: Int = Int(toDate("23:59")!.timeIntervalSince(toDate(inoutStack.removeLast())!)) / 60
            times += parkingTime
        }
        return times
    }
    
    func toDate(_ s: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: s) {
            return date
        } else {
            return nil
        }
    }
}
