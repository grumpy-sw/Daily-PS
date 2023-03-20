### Codility Lession 14(Binary search algorithm) - NailingPlanks
👉 [문제 링크](https://app.codility.com/programmers/lessons/14-binary_search_algorithm/nailing_planks/)

### 나의 접근 방법
- 널빤지와 못이 주어질 때, 모든 널빤지에 못을 박을 때 필요한 최소한의 못의 수를 구하는 문제.
- 널빤지를 시작점 기준으로 정렬하고, 못을 하나씩 순회하며 이 못을 통해 어느 판자까지 뚫을 수 있는지 확인한다.
    - pos를 정할 때는 시작점만 보고 진행한다.
    - 뒤에서부터 시작점과 끝점을 확인하여 못이 널빤지 범위 사이에 있는지 하나씩 확인한다.
    - 관통할 수 있는 널빤지를 하나씩 지워나간다.
- 널빤지를 나타내는 배열이 비어있게 되면 다 해결한 것이므로 현재 Index + 1을 반환
- 계속 Timeout에 걸려 해결하는데 오래 걸렸는데, 아마 pos를 정한 뒤 1씩 줄여나가면서 체크한 것이 아니라 하나 지우고 이분 탐색을 반복적으로 사용했기 때문인 것 같다.(시간복잡도가 O((N + M) * N)이었음.) 
- 이 코드의 시간복잡도는 O((N + M) * log(M)) 이다.

### 코드(Swift)
```swift
public func solution(_ A : inout [Int], _ B : inout [Int], _ C : inout [Int]) -> Int {
    if B.max()! < C.min()! || C.max()! < A.min()! {
        return -1
    }
        
    var sortedPlankIndexes = (0..<A.count).sorted { l, r in
        return A[l] < A[r]
    }
        
    for index in 0..<C.count {
        let nail = C[index]
            
        let pos = findPlank(nail, A, sortedPlankIndexes)
        removeNailedPlankIndexes(nail, pos, A, B, &sortedPlankIndexes)
            
        if sortedPlankIndexes.isEmpty {
            return index + 1
        }
    }
        
    return -1
}
    
func findPlank(_ nail: Int, _ A: [Int], _ sortedPlankIndexes: [Int]) -> Int {
    var start = 0
    var end = sortedPlankIndexes.count - 1
    var pos = -1
        
    while start <= end {
        let mid = (start + end) / 2
        if A[sortedPlankIndexes[mid]] > nail {
            end = mid - 1
        } else {
            start = mid + 1
            pos = mid
        }
    }
    return pos
}
    
func removeNailedPlankIndexes(_ nail: Int, _ pos: Int, _ A: [Int], _ B: [Int], _  sortedPlankIndexes: inout [Int]) {
    var pos = pos
    while pos >= 0 {
        let maxIndex = sortedPlankIndexes[pos]
        if B[maxIndex] >= nail && A[maxIndex] <= nail {
            sortedPlankIndexes.remove(at: pos)
            pos -= 1
            continue
        }
        break
    }
}
```
