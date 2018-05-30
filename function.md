# 함수

- 캡슐화를 위해 함수안에서도 사용 가능
- 함수의 파라메터들은 기본적으로 상수

**<1급 객체로서의 특징>**

- 파라미터 타입으로 사용 가능
- 리턴 타입으로 사용 가능
- 변수 데이터에 사용 가능

## 반환값이 없는 함수

> 정확히는 반환값이 없는게 아니라 Void 타입이다.
> Void는 빈 Tuple이고, ()로 표기한다.<br>
> 반환값을 무시할 수는 있지만, 함수는 항상 반환값을 가져야한다.<br>

## optional tuple return type

---|(Int, Int)?|(Int?, Int?)
---|---|---
요소 **nil**| x | (nil, nil)
반환값 **nil**| nil | x

```
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
```

```
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109
```

> 함수의 리턴 타입의 파라미터가 상수 bounds의 요소로 쓰임

## 기본 파라미터

- 기본값을 가지는 파라메터는 함수의 파라메터 리스트에서 마지막에 둔다. 이렇게 함으로써 함수 호출이 기본값을 가지지 않는 파라메터들이 언제나 같은 순서임을 보장할 수 있고, 매번 함수가 호출될 때마다 같은 함수가 호출되게 한다.

## 가변 갯수 파라미터

- 함수는 최대 한개의 가변 갯수 파라메터를 가질 수 있습니다. 그리고 가변 갯수 파라메터는 언제나 파라메터 목록의 마지막에 배치되어야 합니다. 이렇게 함으로써 복수의 파라메터를 가진 함수를 호출할때 생기는 모호함을 피할 수 있습니다. 만약 함수의 파라메터중 하나 이상의 파라메터가 기본값을 가지고, 그와 동시에 가변 갯수 파라메터를 가진다면 가변 갯수 파라메터는 기본 값을 가지는 파라메터의 맨 마지막에 두어야합니다.

```
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
```

## 입출력 파라미터(In-Out)

- 만약 함수가 파라메터의 값을 변경하고 그 변경이 함수 호출이 종료된 후에도 계속되길 원한다면, 파라메터를 입출력 파라메터로 정의

```
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3
```

> 입출력 파라메터는 함수가 값을 반환하는 것이 아닙니다. 위의 swapTwoInts 예제는 반환 타입이나 반환값을 정의하고 있지 않습니다. 하지만 someInt와 anotherInt의 값을 변경하죠. 입출력 파라메터는 함수가 함수 밖의 범위(scope)에 영향을 끼칠 수 있는 또다른 방법

