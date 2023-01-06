### Codility Lesson 7(Stacks and Queues) - Fish
👉 [문제 링크](https://app.codility.com/programmers/lessons/7-stacks_and_queues/fish/)

### 나의 접근 방법
두 물고기끼리 서로 잡아먹는 조건
- 방향 0의 물고기가 방향 1의 물고기를 만났을 때이다.
- 그렇기 때문에 예시에서 1번 물고기가 0번 물고기에게 먹히지 않는다.

해결 방법
- FishInRiver 구조체: 방향과 크기를 갖고 있는 구조체 생성
- 방향 1인 물고기들을 스택에 넣는다.
- 방향 0인 물고기들은 스택에 있는 물고기들을 모두 조회하여 크기를 비교한다.


### 코드

```swift
public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    var fishes: [FishInRiver] = []
        
    for index in 0..<A.count {
        fishes.append(FishInRiver(size: A[index], direction: B[index]))
    }
    var count = 0
        var stack = [FishInRiver]()
        for fish in fishes {
            if fish.direction == 1 {
                stack.append(fish)
            } else {
                while !stack.isEmpty {
                    let last = stack.last!
                    if last.size < fish.size {
                        stack.removeLast()
                    } else {
                        break
                    }
                }
                if stack.isEmpty {
                    count += 1
                }
            }
        }
        return count + stack.count
    }
    
    struct FishInRiver {
        let size: Int
        let direction: Int
    }
```
