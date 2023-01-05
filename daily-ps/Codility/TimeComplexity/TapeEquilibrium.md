### Codility Lesson 3(Time Complexity) - TapeEquilibrium
👉 [문제 링크](https://app.codility.com/programmers/lessons/3-time_complexity/tape_equilibrium/)

### 나의 접근 방법
배열 A에 대한 누적합 배열을 구한다.

- 누적합을 구하는 이유
    - [0...N-1]까지 부분 누적합: sums[N-1]
    - [N...M]까지 부분 누적합: sums[M] - sums[N-1]

둘의 차이의 절대값이 가장 작은 값을 반환한다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    let sums = cumulativeSums(A)
    var diff = Int.max
    for index in 1..<A.count {
        let left = sums[index - 1]
        let right = sums.last! - sums[index - 1]
            
        diff = min(diff, abs(left - right))
    }
        
    return diff
}
    
func cumulativeSums(_ numbers: [Int]) -> [Int] {
    var result = [Int]()
    var sum = 0
    for index in 0..<numbers.count {
        sum += numbers[index]
        result.append(sum)
    }
    return result
}
```
