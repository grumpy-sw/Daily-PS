### Codility Lesson 1(Iterations) - BinaryGap
👉 [문제 링크](https://app.codility.com/programmers/lessons/1-iterations/binary_gap/)

### 나의 접근 방법

Binary Gap란 양의 정수 N에 대하여 이진법으로 변환했을 때 양 옆이 1로 둘러쌓인 0의 최대 길이를 의미한다.

예를 들어 529를 이진법으로 변환하면 `1000010001`가 된다. 이 때 이 숫자의 Binary Gap은 `0000`이 된다.

입력으로 들어오는 양의 정수 N을 이진법으로 변환하고 1을 기준으로 문자열을 나눠 0으로 이루어진 문자열 배열을 얻는다.
양쪽이 1로 둘러쌓인 연속된 0의 길이 중 최대값을 구하면 되므로 문자열 배열에서 맨 처음과 마지막을 제외한 원소들 중에서 최대 길이를 반환한다.

### 코드

```swift
public func solution(_ N : Int) -> Int {
    let binaryNumbers = String(N, radix: 2)
    let binaryGaps = binaryNumbers.components(separatedBy: "1")
    var length = 0
    for index in 1..<binaryGaps.count - 1 {
        length = max(length, binaryGaps[index].count)
    }
    return length
}
```
