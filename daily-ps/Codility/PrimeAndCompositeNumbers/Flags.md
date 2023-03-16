### Codility Lession 10(Prime and composite numbers) - Flags
👉 [문제 링크](https://app.codility.com/programmers/lessons/10-prime_and_composite_numbers/flags/)

### 문제 이해
- N개의 요소를 가진 정수 배열이 주어질 때, 각 Peak 지점에 깃발을 꽂으려 한다.
    - Peak: A[i-1] < A[i] > A[i+1]인 지점
- 단, 깃발들 사이끼리는 최소한 깃발의 수 만큼 떨어져 있어야 한다.

![](https://codility-frontend-prod.s3.amazonaws.com/media/task_static/flags/static/images/auto/6f5e8faa3000c0a74157e6e0bc759b8a.png)

- 2개의 깃발을 꽂는다면, 1과 5에 꽂을 수 있다.(왜 3이 아닌건지 잘 모르겠다..)
- 3개의 깃발을 꽂는다면, 1, 5, 10에 꽂을 수 있다.
- 4개의 깃발을 꽂는다면, 1, 5, 10에 꽂을 수 있다. 깃발 사이의 거리 제한 때문에 3에 꽂을 수 없고 따라서 최대 꽂을 수 있는 깃발의 수는 3이다.

### 나의 접근 방법
- 우선 될 수 있는 모든 peak들을 구하여 peaks 배열에 담는다.
- 그 후 꽂을 수 있는 최대 깃발 수부터 하나씩 줄여가며 peak 사이의 간격을 체크한다.
    - 처음엔 peaks 배열의 길이를 사용했는데 performance에서 통과하지 못했다.
    - 주어진 배열 A의 전체 길이와 최대 깃발의 수를 점화식을 통해 구하여 최대값을 처리했다.
- N개의 깃발을 꽂으려고 할 때 필요한 배열 A의 최대 길이를 구하는 방법
    - 아이디어 from [https://github.com/BaeMinCheon/study-101/tree/master/Workspace/2020/06/26](https://github.com/BaeMinCheon/study-101/tree/master/Workspace/2020/06/26)
    ```
    K개의 깃발을 꽂으려고 할 때, 필요한 배열의 길이를 M(K)라고 하면
    
    2
    X P X P X => M(2) = 5
    
    3
    X P XX P XX P X => M(3) = 9
    
    4
    X P XXX P XXX P XXX P X => M(4) = 15
    
    위 식을 통해 M(K)에 대한 일반식을 구하면
    - 맨 처음과 마지막 X와 P : 4
    - P와 P 사이의 (K-1)만큼의 간격 (K-1)개 : (K-1)^2
    - 맨 처음과 마지막을 제외한 P의 개수 : K - 2
    로 나눌 수 있다. 이를 모두 더하면
    M(K) = (K-1)^2 + 4 + K - 2 = K^2 - K + 3
    이다.
    
    주어진 배열 A의 길이를 N이라고 하면,
    M(K) = N이다.
    따라서 N에 대하여 최대로 꽂을 수 있는 깃발의 수 K는 
    K^2 - K + 3 - N = 0
    K = (1 + sqrt(4N - 11)) / 2
    이다.
    
    ∴ maxFlagCount = (1 + Int(sqrt(Double(4*N - 11)))) / 2
    ```
- 이 알고리즘의 시간복잡도는 O(N)이다.
- 예외 처리
    - N < 3일 때, peak를 만들 수 없으므로 0을 반환한다.
    - peak < 2일 때, peak의 길이를 반환한다.
### 코드(Swift)
```swift
public func solution(_ A : inout [Int]) -> Int {
        let N = A.count
        if N < 3 {
            return 0
        }
        
        var peaks = [Int]()
        var result = 0
        
        for index in 1..<(N-1) {
            if A[index] > A[index-1], A[index] > A[index+1] {
                peaks.append(index)
            }
        }
        
        if peaks.count < 2 {
            return peaks.count
        }
        
        let maximumFlagCount = (1 + Int(sqrt(Double(4*N - 11)))) / 2
        
        for d in stride(from: maximumFlagCount, to: 1, by: -1) {
            if d <= result {
                return result
            }
            
            var current = 0
            var flags = 1
            
            for index in 1..<peaks.count {
                if flags == d {
                    break
                }
                
                if abs(peaks[current] - peaks[index]) >= d {
                    flags += 1
                    current = index
                }
            }
            result = max(result, flags)
        }
        
        return result
    }
```
