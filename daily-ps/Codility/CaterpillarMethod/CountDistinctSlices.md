### Codility Lession 15(Caterpillar Method) - CountDistinctSlices
👉 [문제 링크](https://app.codility.com/programmers/lessons/15-caterpillar_method/count_distinct_slices/)

### 나의 접근 방법
Slice의 개수를 구하는 방법
- 일일이 개수를 추가하지 않고 `slices += (end - start + 1)`로 계산

Slice가 Distinct한지 확인하는 방법
- Boolean 배열을 통해 해당 위치에 해당하는 숫자가 Slice에 포함되었는지 확인(visited[3] = true라면 3이 Slice에 들어있다는 뜻)
- 배열 A의 element들은 모두 M 이하의 값이기 때문에 M+1 길이의 Boolean 배열 사용

### 코드
```swift
public func solution(_ M : Int, _ A : inout [Int]) -> Int {
    let N = A.count
    var end = 0
    var slices = 0
    var visited = Array(repeating: false, count: M+1)
        
    for start in 0..<N {
        while end < N, !visited[A[end]] {
            visited[A[end]] = true
            slices += (end - start + 1)
            end += 1
        }
        visited[A[start]] = false
    }
        
    if slices > 1000000000 {
        slices = 1000000000
    }
        
    return slices
}
```
