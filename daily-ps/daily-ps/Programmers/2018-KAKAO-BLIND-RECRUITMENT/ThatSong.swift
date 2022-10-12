//
//  ThatSong.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/12.
//

import Foundation

final class ThatSong {
    func run() {
        print(solution("A#", ["23:50,00:00,F,A#A#A#A#A#A#A#A#A#A#A#A#A#A#A#A#"]))
    }
    
    func solution(_ m: String, _ musicinfos: [String]) -> String {
        var musics: [MusicInfo] = []
        for musicinfo in musicinfos {
            let info = musicinfo.split(separator: ",").map{ String($0) }
            let music = MusicInfo(
                runningTime: calculateRunningTime(info[0], info[1]),
                name: info[2],
                notes: makeMelodyNote(calculateRunningTime(info[0], info[1]), replaceMelody(info[3]))
            )
            musics.append(music)
        }
        
        musics = musics.sorted { m1, m2 in
            return m1.runningTime > m2.runningTime
        }
        
        let listened = replaceMelody(m)

        for music in musics {
            if music.notes.contains(listened) {
                return music.name
            }
        }
        
        return "(None)"
    }
    
    func calculateRunningTime(_ start: String, _ end: String) -> Int {
        let startTimeArray = start.split(separator: ":").map{ Int($0)! }
        let endTimeArray = end.split(separator: ":").map{ Int($0)! }
        var runningHours = endTimeArray[0] - startTimeArray[0]
        if runningHours < 0 {
            runningHours += 24
        }
        return runningHours * 60 + (endTimeArray[1] - startTimeArray[1])
    }
    
    func replaceMelody(_ s: String) -> String {
        var result = s
        
        result = result.replacingOccurrences(of: "A#", with: "a")
        result = result.replacingOccurrences(of: "C#", with: "c")
        result = result.replacingOccurrences(of: "D#", with: "d")
        result = result.replacingOccurrences(of: "F#", with: "f")
        result = result.replacingOccurrences(of: "G#", with: "g")
        
        return result
    }
    
    func makeMelodyNote(_ runningTime: Int, _ note: String) -> String {
        var result = ""
        
        if runningTime > note.count {
            let repeatCount = runningTime / note.count
            let remainCount = runningTime % note.count
            
            for _ in 0..<repeatCount {
                result += note
            }
            result += note.prefix(remainCount)
        } else {
            result = String(note.prefix(runningTime))
        }
        
        return result
    }
    
    struct MusicInfo {
        let runningTime: Int
        let name: String
        let notes: String
    }
}
