### Codility Lesson 10(Prime and composite numbers) - MinPerimeterRectangle
👉 [문제 링크](https://app.codility.com/programmers/lessons/10-prime_and_composite_numbers/min_perimeter_rectangle/)

### 나의 접근 방법
N의 제곱근 이하의 약수들을 구하고, 그 약수들을 한 변으로 한 직사각형의 둘레들 중 최소값을 구한다.

### 코드
```swift
public func solution(_ N : Int) -> Int {
    if N == 1 {
        return 4
    }
        
    var minValue = Int.max
    let possibleEdges = factors(N)
        
    for edge in possibleEdges {
        minValue = min(minValue, 2 * (edge + (N / edge)))
    }
        
    return minValue
}

func factors(_ N: Int) -> [Int] {
    var edges: [Int] = []
        
    let sqr = Int(sqrt(Double(N)))
        
    for number in 1...sqr {
        if N % number == 0 {
            edges.append(number)
        }
    }
        
    return edges
}
```
