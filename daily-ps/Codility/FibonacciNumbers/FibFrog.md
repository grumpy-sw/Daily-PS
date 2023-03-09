### Codility Lession 13(Fibonacci numbers) - FibFrog
👉 [문제 링크](https://app.codility.com/programmers/lessons/13-fibonacci_numbers/fib_frog/)

### 나의 접근 방법
- fiboMap: 처음 위치(-1)에서 한 번에 목적지(A.count)까지 가는 경우가 있으므로 A.count + 1이 될 때까지 피보나치 수열을 구해 큰 순서로 정렬한다.
- 개구리의 위치와 단계(몇 번 점프했는지)를 갖는 Point 구조체를 정의하고 인스턴스를 생성하여 배열에 담는다.
- BFS로 개구리가 목적지에 도착할 때까지 탐색 시작
    - 큰 순서로 위치를 옮기기 때문에 이미 갔던 위치라면 앞에 도달한 depth보다 무조건 큰 depth이므로 더 이상 탐색하지 않는다.
    - queue 배열을 앞으로 당기면서 발생할 오버헤드를 줄이기 위해 offset을 사용
    - 목적지에 도착하면 depth를 반환하고, queue의 끝까지 탐색했는데 도착하지 못했으면 -1을 반환한다.
- Codility 문제를 풀다 보면 예외 처리에 많이 신경쓰게 되는 것 같다. 배열이 비어있는 경우 1을 리턴해야 한다.
- 자꾸 50%로 시간 초과가 나서 통과가 안됐는데, visited를 통해 이미 갔던 곳은 탐색하지 않게 했더니 통과되었다.

### 코드(Swift)
```swift
public func solution(_ A : inout [Int]) -> Int {
    if A.isEmpty {
        return 1
    }
        
    let target = A.count
    let A = A + [1]
    let fiboMap = Array(fibonacciMap(A))
    var queue = [Point]()
    queue.append(Point(pos: -1, depth: 0))
    var offset = 0
    var visited = Array(repeating: false, count: A.count)
        
    while offset < queue.count {
        let current = queue[offset]
        offset += 1
        if current.pos > target {
            continue
        }
            
        if current.pos == target {
            return current.depth
        } else {
            for step in fiboMap {
                let next = current.pos + step
                if next < A.count && !visited[next] && A[next] == 1 {
                    visited[next] = true
                    queue.append(Point(pos: next, depth: current.depth+1))
                }
            }
        }
    }
        
    return -1
}
    
public func fibonacciMap(_ arr: [Int]) -> [Int] {
    var result = [Int]()
    result.append(1)
    result.append(2)
    var index = 2
    var value = 0
    while true {
        value = result[index - 1] + result[index - 2]
        if value > arr.count {
            break
        }
        result.append(value)
        index += 1
    }
    return result.reversed()
}
    
struct Point {
    var pos: Int
    var depth: Int
}
```
