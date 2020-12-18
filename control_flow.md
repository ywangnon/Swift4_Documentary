# 흐름 제어

* 반복: `while`, `for-in`
* 분기: `if`, `guard`, `switch`
* 이동: `break`, `continue`

## For-In Loops

* array, dictionary, range, strings 와 다른 sequences를 반복
* 대체로 폐쇄 영역\(제한된 범위\)을 가질 경우 사용

**\[array\]**

```text
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!
```

**\[dictionary\]**

```text
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// ants have 6 legs
// spiders have 8 legs
// cats have 4 legs
```

* \(key, value\) 의 튜플 형태로 반환

**\[Sequences\]**

```text
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
```

**\[Sequences 값이 필요 없을 경우\]**

```text
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// Prints "3 to the power of 10 is 59049
```

* \_\(밑줄\)로 무시

**\[마지막을 반복하지 않을 경우\]**

```text
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}
```

**\[간격이 있게 반복\]**

```text
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {

    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
```

* from: 시작점
* to: 끝점\(반복하지 않고 끝냄\)
* by: 간격

**\[마지막까지 간격 있게 반복\]**

```text
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {

    // render the tick mark every 3 hours (3, 6, 9, 12)
}
```

* from: 시작점
* to: 끝점\(반복하고 끝냄\)
* by: 간격

## While Loops

* 조건이 `true`가 될 때까지 반복
* 반복횟수를 알 수 없을 때 사용

### while

* 조건을 검사하고 시작

### Repeat-While

* 검사 전에 루프 블록 한 번 실행

> `[Type](repeating: Value, count: Int)`  
> `Type`: 데이터 타입  
>  `Value`: 채워넣을 값  
>  `count`: 반복 횟수

## Conditional Statements

* 특정 조건이 충족되면 실행

### If

* 조건의 수가 많지 않을 때 사용

### Switch

* 조건의 수가 많고 복잡할 때 사용
* case에서 일치된 값을 임시 상수나 변수에 binding 가능
* 조건이 까다로울 경우 case에 where절 사용 가능
* 비교하는 값이 가질 수 있는 모든 경우를 정의해서 처리해야 함

## 흐름 이동문

### Continue

* 루프에게 현재 하고 있는 것을 멈추고, 루프의 다음 반복문을 시작하라고 명령

### Break

* 흐름제어문 전체를 즉시 종료

#### Loop 안에서의 break

* 루프문 안에서 쓰이면, 루프의 실행을 즉시 종료

#### Switch 안에서의 break

* switch문 전체를 즉시 종료

### Fallthrough

* 한 `case`와 매치된 후, 다음 `case`로 넘어감

## Labeled 구문

* 흐름 이동문이 어디로 갈지를 명시하는 것

```text
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
```

> gameLoop를 사용하지 않으면 switch문을 종료시킴

## 조기 탈출

* guard문을 이용

## API 검사

* if, guard문을 이용해 api가 사용가능한지 검사 가능

