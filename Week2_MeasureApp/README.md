## 연습 문제 - Measure 앱 만들기

```swift
let street1 = Measurement(value: 73, unit: UnitLength.meters)
let street2 = Measurement(value: 67, unit: UnitLength.meters)
var commuteDistance = street1 + street2
commuteDistance.convert(to: UnitLength.yards)
```

[단위 목록 문서](https://developer.apple.com/documentation/foundation/dimension)를 보면 여러 길이, 부피, 무게 단위가 만들어져 있다. 이 중에 하나를 정해서 단위를 변환하는 앱을 구현한다.

![img](https://s3.ap-northeast-2.amazonaws.com/lucas-image.codesquad.kr/1603103468520Screen%20Shot%202020-10-19%20at%207.28.29%20PM.png)

입력을 위한 `TextField` , 변환 이벤트를 위한 `Button` , 변환을 완료한 다음 출력을 위한 `Label`을 디자인하고 연결한다.

#### 추가 미션

- 여러 단위를 변환하려면 어떻게 해야 할까?