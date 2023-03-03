### Codility Lession 5(Prefix Sums) - GenomicRangeQuery
👉 [문제 링크](https://app.codility.com/programmers/lessons/5-prefix_sums/genomic_range_query/)

### 나의 접근 방법
- 각 위치까지 나온 Genom들의 개수를 갖는 2차원 Int 배열 map을 생성한다.
- 예시로 주어진 `CAGCCTA`를 보면
    - 첫 번째 문자가 `C` 이므로 map[1]의 값은 [0, 1, 0, 0]이 된다.
    - 두 번째 문자가 `A` 이므로 map[2]의 값은 [1, 1, 0, 0]이 된다.
    - 세 번째 문자가 `G` 이므로 map[3]의 값은 [1, 1, 1, 0]이 된다.
- 누적 합을 통해 구간 합을 구한다.
    - i부터 j까지의 구간 합: map[j+1] - map[i]
- 구간 합에서 가장 작은 factor를 결과 배열에 담아 리턴한다.

  
### 코드(Swift)
```swift
enum Genom: String {
    case A = "A"
    case C = "C"
    case G = "G"
    case T = "T"
        
    var factor: Int {
        switch self {
        case .A:
            return 1
        case .C:
            return 2
        case .G:
            return 3
        case .T:
            return 4
        }
    }
}

public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    var S = Array(S).map{ String($0) }
    var result: [Int] = []
    var map: [[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: S.count + 1)
        
    for index in 0..<S.count {
        map[index + 1][0] = map[index][0]
        map[index + 1][1] = map[index][1]
        map[index + 1][2] = map[index][2]
        map[index + 1][3] = map[index][3]
            
        map[index + 1][Genom(rawValue: S[index])!.factor - 1] += 1
    }
        
    for index in 0..<P.count {
        let slice = [map[Q[index]+1][0] - map[P[index]][0], map[Q[index]+1][1] - map[P[index]][1], map[Q[index]+1][2] - map[P[index]][2], map[Q[index]+1][3] - map[P[index]][3]]
        result.append(getMinimumImpactFactor(of: slice))
    }
        
    return result
}
    
func getMinimumImpactFactor(of slice: [Int]) -> Int {
    if slice[0] != 0 {
        return 1
    } else if slice[1] != 0 {
        return 2
    } else if slice[2] != 0 {
        return 3
    } else {
        return 4
    }
}
```

