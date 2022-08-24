//
//  TrucksPassingTunnel.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/24.
//

import Foundation

final class TrucksPassingTunnel {
    func run() {
        print(solution(100, 100, [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]))
    }
    
    func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
        var queue: [Truck] = []
        var tunnel: [Truck] = []
        var seconds: Int = 0
        var passed: [Int] = []
        truck_weights.forEach {
            queue.append(Truck(weight: $0, position: 0))
        }
        
        while passed != truck_weights {
            if !tunnel.isEmpty {
                for index in 0..<tunnel.count {
                    let truck = tunnel[index]
                    tunnel[index] = Truck(weight: truck.weight, position: truck.position + 1)
                }
                if tunnel[0].position > bridge_length {
                    passed.append(tunnel.removeFirst().weight)
                }
            }
            if !queue.isEmpty {
                var front = queue.removeFirst()
                if tunnel.count < bridge_length + 1 && tunnel.map({ $0.weight }).reduce(0, +) + front.weight <= weight {
                    front.position += 1
                    tunnel.append(front)
                } else {
                    queue.insert(front, at: 0)
                }
            }
            print(tunnel.map{ $0.weight})
            seconds += 1
        }
        
        return seconds
    }
    
    struct Truck {
        var weight: Int
        var position: Int
    }
}
