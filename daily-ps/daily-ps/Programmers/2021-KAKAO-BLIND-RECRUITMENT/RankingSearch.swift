//
//  RankingSearch.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/24.
//

import Foundation

final class RankingSearch {
    func run() {
        print(solution(
            ["java backend junior pizza 150",
             "python frontend senior chicken 210",
             "python frontend senior chicken 150",
             "cpp backend senior pizza 260",
             "java backend junior chicken 80",
             "python backend senior chicken 50"
            ],
            ["java and backend and junior and pizza 100",
             "python and frontend and senior and chicken 200",
             "cpp and - and senior and pizza 250",
             "- and backend and senior and - 150",
             "- and - and - and chicken 100",
             "- and - and - and - 150"
            ]
        ))
    }
    
    func solution(_ info:[String], _ query:[String]) -> [Int] {
        var result: [Int] = []
        var db: [String: [Int]] = [:]
        
        for volunteer in info {
            let infos = volunteer.split(separator: " ").map{ String($0) }
            let languages = [infos[0], "-"]
            let jobs = [infos[1], "-"]
            let careers = [infos[2], "-"]
            let soulFoods = [infos[3], "-"]
            let score = Int(infos[4])!
            
            for lang in languages {
                for job in jobs {
                    for career in careers {
                        for food in soulFoods {
                            let key = "\(lang) \(job) \(career) \(food)"
                            if db.keys.contains(key) {
                                db[key]?.append(score)
                            } else {
                                db[key] = [score]
                            }
                        }
                    }
                }
            }
        }
        
        for data in db {
            let sortValue = data.value.sorted()
            db[data.key] = sortValue
        }
        
        query.forEach {
            let excuteQuery = $0.replacingOccurrences(of: "and", with: "").split(separator: " ").map{ String($0) }
            
            let lang = excuteQuery[0]
            let job = excuteQuery[1]
            let career = excuteQuery[2]
            let food = excuteQuery[3]
            let score = Int(excuteQuery[4])!
            
            let key = "\(lang) \(job) \(career) \(food)"
            if let scores = db[key] {
                let pos = binarySearch(scores, score)
                result.append(scores.count - pos)
            } else {
                result.append(0)
            }
            
        }
        return result
    }
    
    func binarySearch(_ scores: [Int], _ target: Int) -> Int {
        var start = 0
        var end = scores.count
        while start < end {
            let mid = (start + end) / 2
            
            if scores[mid] >= target {
                end = mid
            } else {
                start = mid + 1
            }
        }
        return start
    }
}
