### Codility Lession 13(Fibonacci numbers) - Ladders
👉 [문제 링크](https://app.codility.com/programmers/lessons/13-fibonacci_numbers/ladder/)

### 나의 접근 방법
- 문제에 따르면 f(1) = 1, f(2) = 2인 피보나치 수열인 것은 쉽게 유추가 가능한데, 어떤 결과값을 반환해야 하는지 이해하기 어려웠다..
- A[i]에 대한 피보나치 수열의 값을 구하는데, 숫자가 너무 커져버리므로 상한값(2^B[i])으로 나눈 나머지를 결과에 담아 반환하라는 뜻.
- ladders 함수로 피보나치 수열을 저장하는 배열(map)을 만드는데, 상한값이 될 수 있는 가장 큰 값으로 나눈 나머지를 담는다.
- 배열 map이 만들어지고 나면 A[i]에 대한 피보나치 수열 값을 2^B[i]로 나눈 나머지를 구해주면 된다.
- 이 알고리즘의 시간복잡도는 O(L)이다. (L: A에 들어올 수 있는 최대값)

### 코드(Swift)
```swift
public func solution(_ A : inout [Int], _ B : inout [Int]) -> [Int] {
    var result: [Int] = []
    let N = A.count
    let maxA = A.max()!
    let maxB = B.max()!
    let map = ladders(maxA, maxB)
    for index in 0..<N {
        result.append(map[A[index]] % Int(pow(Double(2), Double(B[index]))))
    }
        
    return result
}
    
func ladders(_ n: Int, _ max: Int) -> [Int] {
    var result = Array(repeating: 0, count: n+1)
    result[0] = 1
    result[1] = 1
        
    if n == 1 {
        return result
    }
        
    let max = Int(pow(Double(2), Double(max)))
        
    for index in 2...n {
        result[index] = (result[index-1] + result[index-2]) % max
    }
    return result
}
```
