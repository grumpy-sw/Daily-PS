### Codility Lession 16(Greedy algorithms) - MaxNonoverlappingSegments
👉 [문제 링크](https://app.codility.com/programmers/lessons/16-greedy_algorithms/max_nonoverlapping_segments/)

### 나의 접근 방법
A: 시작점, B: 끝점이 되는 선 중에서 겹치지 않는 선의 최대 개수를 구하는 문제.
B[K] <= B[K+1] 이기 때문에 시작점 기준으로 정렬할 필요 없이 앞에서부터 확인해도 된다.
첫 선분을 시작점으로 놓고 겹치지 않는 선분이 나올 때까지 반복문을 통해 순회한다. 겹치지 않는 선분이 나오면(끝점 < 시작점) 끝점을 갱신하고 카운트를 증가시킨다.

### 코드
```swift
public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    let N = A.count
        
    if N == 0 || N == 1 {
        return N
    }
        
    var endpoint = B[0]
    var count = 1
        
    for index in 1..<N {
        if endpoint < A[index] {
            count += 1
            endpoint = B[index]
        }
    }
        
    return count
}
```
