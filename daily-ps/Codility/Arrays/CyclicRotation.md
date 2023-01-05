### Codility Lesson 2(Arrays) - CyclicRotation
👉 [문제 링크](https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/)

### 나의 접근 방법

N개의 정수로 구성된 배열 A가 주어지면 배열 A가 K회 오른쪽으로 이동한 후의 결과를 반환해야 한다. 배열의 회전은 각 원소가 한칸씩 오른쪽으로 이동하고 마지막 원소가 첫 번째 위치로 이동됨을 의미한다. 

1) K를 A의 길이로 나눈 나머지를 구하여 각 원소들의 실제 이동 위치를 구한다.
    - K = 23, A의 길이 = 5인 경우 네 바퀴를 돌고 나서 3회 회전하므로 실질적으로는 K = 3과 결과가 같다.
2) A의 각 원소들을 0으로 초기화한 결과 배열의 알맞은 위치에 대입한다.
    - 1)에서 구한 rotateCount를 index에 더한 위치에 원소를 배치한다.
    - 배열의 끝을 넘어간 경우 초과한 위치만큼 맨 앞에서 배치한다.

### 코드
```swift
public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    if A.isEmpty {
        return A
    }
        
    var result = Array(repeating: 0, count: A.count)
    let rotateCount = K % A.count
    for index in 0..<A.count {
        if index + rotateCount < A.count {
            result[index + rotateCount] = A[index]
        } else {
            result[index + rotateCount - A.count] = A[index]
        }
    }
    return result
}
```
