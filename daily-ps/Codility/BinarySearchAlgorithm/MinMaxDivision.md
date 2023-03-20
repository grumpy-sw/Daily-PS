### Codility Lession 14(Binary search algorithm) - MinMaxDivision
👉 [문제 링크](https://app.codility.com/programmers/lessons/14-binary_search_algorithm/min_max_division/)

### 나의 접근 방법
- 주어진 배열 A를 K개의 배열 조각으로 나눌 때, 각 조각의 합 중 최대값이 최소가 되도록 나누어야 한다.
- 먼저 배열 A로부터 전체 합(sum)과 가장 큰 원소의 값(maxElement)를 구한다.
- maxElement와 sum을 범위로 이분 탐색을 시작한다.
    - 배열 하나에 모두 담는다면 배열 조각의 합 = sum
    - 배열 하나에 하나의 원소씩 담는다면 배열 조각의 합 = maxElement
- dividable 메서드에서 배열의 값을 하나씩 더해가면서, mid 값(목표치)를 넘어가면 조각을 하나씩 추가한다.
    - 결국 K개로 나눌 수 있으면 true를, 없으면 false를 반환한다.
- 이 코드의 시간복잡도는 O(N*log(N+M)) 이다.
- 예외 처리
    - K >= N(A.count)이면 원소 하나씩 담은 것이 최대값이 가장 작다.

### 코드(Swift)
```swift
public func solution(_ K : Int, _ M : Int, _ A : inout [Int]) -> Int {
    let N = A.count
    if K >= N {
        return A.max()!
    }
        
    var sum = 0
    var maxElement = 0
        
    for index in 0..<N {
        sum += A[index]
        if maxElement < A[index] {
            maxElement = A[index]
        }
    }
    var result = sum
        
    while maxElement <= sum {
        let mid = (maxElement + sum) / 2
        if dividable(mid, K, A) {
            result = mid
            sum = mid - 1
        } else {
            maxElement = mid + 1
        }
    }
        
    return result
}
    
func dividable(_ mid: Int, _ K: Int, _ A: [Int]) -> Bool {
    var count = 0
    var sum = 0
        
    for index in 0..<A.count {
        sum += A[index]
        if sum > mid {
            count += 1
            sum = A[index]
        }
        if count == K {
            return false
        }
    }
    return true
}
```

