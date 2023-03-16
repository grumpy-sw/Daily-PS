### Codility Lession 10(Prime and composite numbers) - Peaks
👉 [문제 링크](https://app.codility.com/programmers/lessons/10-prime_and_composite_numbers/peaks/)

### 나의 접근 방법
- 주어진 배열을 더 작은 배열로 나눈다면 각각의 모든 배열 조각들이 peak을 포함하도록 나눌 때 가장 많은 조각으로 나누는 방법을 구하는 문제
- 먼저 배열 A로부터 peak이 되는 지점을 구해서 peaks 배열에 담는다.
- 가장 작게 자르는 방법은 peaks.count만큼의 조각을 만드는 것이므로 peaks.count부터 수를 줄여가면 반복문을 돌린다.
- 이 때 각 slice들에 peak가 들어있는지 판별하기 위해 Boolean 배열인 checkArray를 만들어 peak를 offset 변수로 하나씩 확인하면서 범위에 포함되는지 체크한다.
- 이 코드의 시간복잡도는 O(N * log(log(N))) 이다.
- 예외 처리
    - N < 3이면 peak가 만들어지지 않아 0을 반환한다.
    - peaks.count < 2 이면 peaks.count를 반환한다.
    - 있을 수 있는 가장 작은 slice는 배열 A 전체이기 때문에 0이 아닌 1을 기본값으로 반환한다.

### 코드(Swift)
```swift
public func solution(_ A : inout [Int]) -> Int {
    let N = A.count
    if N < 3 {
        return 0
    }
    var result = 1
    var peaks = [Int]()
        
    for index in 1..<(N-1) {
        if A[index] > A[index-1], A[index] > A[index+1] {
            peaks.append(index)
        }
    }
        
    if peaks.count < 2 {
        return peaks.count
    }
        
    for count in stride(from: peaks.count, to: 1, by: -1) {
        if N % count != 0 {
            continue
        }
        let lengthOfSlice = N / count
        var checkArray = Array(repeating: false, count: count)
        var offset = 0
        var check = 0
        while offset < peaks.count, check < checkArray.count {
            let peak = peaks[offset]
            if checkArray[check] {
                check += 1
            }
            if peak >= (check * lengthOfSlice), peak < (check + 1) * lengthOfSlice {
                checkArray[check] = true
                check += 1
            }
            offset += 1
        }
        if checkArray.count == check {
            result = max(count, result)
        }
    }
        
    return result
}
```

