//
//  SheepsAndWolves.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/15.
//

import Foundation

final class SheepsAndWolves {
    func run() {
        print(solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]))
    }
    
    var type: [Int] = []
    var map: [Node] = []
    var maxSheep: Int = 0
    
    func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
        map = Array(repeating: Node(edges: []), count: info.count)
        type = info
        
        for edge in edges {
            map[edge[0]].edges.append(edge[1])
        }
        dfs(0, 0, 0, map)
        return maxSheep
    }
    
    func dfs(_ current: Int, _ sheep: Int, _ wolf: Int, _ nodes: [Node]) {
        var sheep = sheep
        var wolf = wolf
        
        sheep += (type[current] == 0 ? 1 : 0)
        wolf += (type[current] == 1 ? 1 : 0)
        
        if wolf >= sheep {
            return
        }
        
        if maxSheep < sheep {
            maxSheep = sheep
        }
        
        for index in 0..<nodes[current].edges.count {
            var newNodes = nodes
            newNodes[current].edges.remove(at: index)
            newNodes[nodes[current].edges[index]].edges.append(contentsOf: newNodes[current].edges)
            dfs(nodes[current].edges[index], sheep, wolf, newNodes)
        }
    }
    
    struct Node {
        var edges: [Int]
    }
}
