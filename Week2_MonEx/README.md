# 연습 문제

## 연습문제1 - 배열

### 미션1. 2차원 배열만들기 & 출력하기

```swift
[1]
[6, 7]
[11, 12, 13]
[16, 17, 18, 19]
[21, 22, 23, 24, 25]
```

> 테스트 코드

```swift
var myArray = ArrayPractice()
myArray.printArray(array:myArray.fillArray())
```

- 코드

  ```swift
  		func fillArray() -> [[Int]] {
          var Array2D: [[Int]] = [[Int]]()
          
          for row in 0...4 {
              
              var arrayPerRow = [Int]()
              for column in 0...4 {
                  
                  if column <= row { //1행은 1개, 2행은 2개...의 값만을 가지도록 조건문 사용
                      
                      arrayPerRow.append(5 * row + column + 1)
                  }
              }
              
              Array2D.append(arrayPerRow)
          }
          
          return Array2D
      }
      
      func printArray(array: [[Int]]){
          
          for i in array{
              print(i)
          }
      }
  ```

  배열의 값을 정하는 계산식을 구하는데 조금 시간이 걸렸다.

------

### 미션2. setBoolAray와 printArray

- setBoolArray() 는 Arrat<Array>배열을 리턴한다.

- 배열 내부에는 우측 정렬된 삼각형만 true로 채운다.

- printArray(array:Array<Array<Bool>>, newChar:Character) 는 true면 newChar을 출력하고 false면 빈 공백 ""을 출력한다.

- 코드

  ```swift
  		func setBoolArray() -> Array<Array<Bool>> {
          
          print("배열의 크기를 입력하세요 : ", terminator: "" )
          let sizeOfArray = Int(readLine()!)!
          
          var BoolArray: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: sizeOfArray), count: sizeOfArray)
          //정n각형이 아닌 경우네에는 우측 정렬된 삼각형이란 의미가 애매해졌기 때문에 정n각형의 배열만 다뤘음.
          for rows in 0..<sizeOfArray {
              
              var truePosition = 0 //true가 들어가는 위치 (-를 붙여서 endIndex에서 -truePosition만큼 떨어진 위치를 나타냄)
              
              while rows - truePosition >= 0 { //1행에선 하나, 2행에선 둘, 3행에선 세개...의 true를 가짐
                  
                  BoolArray[rows][BoolArray[rows].index(BoolArray[rows].endIndex, offsetBy: -truePosition-1)] = true
                  truePosition += 1
                  
              }
              
          }
          return BoolArray
      }
  
      func printArray(array: Array<Array<Bool>>, newChar:Character) {
          
          var arrayForPrinting: [[Character]] = [[Character]](repeating: [Character](repeating: " ", count: array[0].count), count: array.count)
          
          for rows in 0..<array[0].count {
              
              for columns in 0..<array.count {
                  
                  if array[rows][columns] == true {
                      
                      arrayForPrinting[rows][columns] = newChar
                  }
              }
              
          print(arrayForPrinting[rows])
          }
      }
  ```

------

### 미션3. 마방진

마방진 배열을 생성하고, 출력하는 두 가지 메소드를 구현한다.

```swift
makeMagicSquare(row: Int) -> Array<Array<Int>> 메서드
printMagicSquare(Array<Array<Int>>) 메서드
```

- 코드

  ```swift
  		var magicSquareSize: Int = 0
      mutating func setMagicSquareSize() -> Int {
          print("마방진의 크기를 입력하세요(홀수) : ", terminator: "")
          let size = Int(readLine()!)!
          magicSquareSize = size
          return size
      }
      
      func makeMagicSquare(row: Int) -> Array<Array<Int>> {
          var magicSquare: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: row), count: row)
          var numToPutIn = 1
          var myRow = 0, myColumn: Int = row/2
          
          magicSquare[0][row/2] = numToPutIn //마방진의 제일 위 행의 가운데 열에 1을 입력
          
          while numToPutIn < row*row { //정n각형의 마방진에서 가장 큰 수는 n^2
              
              numToPutIn += 1
              var nextRow = myRow - 1, nextColumn = myColumn + 1 //오른쪽 위로 이동하면서 numToPutIn을 대입
              
              if nextRow < 0 { //0행에서 위로 올라갔을 때
                  
                  nextRow = row - 1 //제일 아래로 이동((row-1)행으로)
              }
              
              if nextColumn > row - 1 { //오른쪽 끝에서 오른쪽으로 갔을 때
                  
                  nextColumn = 0 //제일 왼쪽으로 이동(0열으로)
              }
          
              if magicSquare[nextRow][nextColumn] == 0 { //이동할 자리가 비었을 경우
                  
                  magicSquare[nextRow][nextColumn] = numToPutIn
              } else { //이동할 자리가 안비었으면 원래의 자리의 바로 아래에 값 대입
                  
                  nextRow = myRow + 1
                  if nextRow > row - 1 { //마지막 행에서 아래로 이동할 경우
                      
                      nextRow = 0
                  }
                  nextColumn = myColumn
                  magicSquare[nextRow][nextColumn] = numToPutIn
              }
              myRow = nextRow; myColumn = nextColumn
          }
          return magicSquare
      }
  
      func printMagicSquare(input: Array<Array<Int>>) {
          if magicSquareSize % 2 != 0 { //홀수 마방진만 구현하여, 홀수에서만 출력하도록 함
              for i in 0..<magicSquareSize {
                  print(input[i])
              }
          } else {
              print("홀수 size의 마방진만 구현했습니다.")
          }
          
      }
  ```

------

------

## 연습문제 2. 아이디 규칙 검사

func IDValidator(password:String) → Bool

- 5글자 미만이거나 24글자 이상이면 실패

- 영문 대소문자, 숫자, - 만 포함 가능하고 그 외에는 실패

- 같은 숫자가 연속해서 3회 이상 나오면 실패  111 , 222

- 숫자가 연번으로 3개 나오면 실패  123 , 234

- 위 조건을 모두 통과하면 성공

- 코드

  ```swift
  		func getID() -> String {
          
          print("아이디를 입력하세요 : ", terminator: "")
          let ID = readLine()!
          
          return ID
      }
      
      func IDValidator(ID: String) -> Bool {
          
          if ID.count < 5 || ID.count >= 24 { //5글자 미만이거나 24글자 이상이면 실패
              
              return false
          }
          
          for i in 0..<ID.count { //영문 대소문자, 숫자, "-"만 포함 가능하고 그 외에는 실패
              
              let bit = ID[ID.index(ID.startIndex, offsetBy: i)]
              if bit.isNumber || bit.isLetter || bit.asciiValue! == 45 { //asciiValue == 45 : "-"
              }else {
                  
                  return false
              }
              
              if bit.isNumber && i != ID.count-1 { //ID의 i번째 요소의 값이 숫자이고, 마지막자리의 요소가 아닐 때
                  
                  let nextbit = ID[ID.index(ID.startIndex, offsetBy: i+1)]
                  if nextbit == bit { //i번째 요소와 i+1번째 요소가 같은 숫자일 때
                      
                      let nextnextbit = ID[ID.index(ID.startIndex, offsetBy: i+2)]
                      if nextbit == nextnextbit { //i번째 요소, i+1번째, i+2번째 요소가 같은 숫자일 때 실패
                          
                          return false
                      }
                      
                  }else if nextbit.asciiValue! - 1 == bit.asciiValue! { //(i번째 요소) + 1 = (i+1번쨰 요소)일 떄(i번째 요소가 숫자이면서)
                      
                      let nextnextbit = ID[ID.index(ID.startIndex, offsetBy: i+2)]
                      if nextbit.asciiValue! == nextnextbit.asciiValue! - 1 { //i번째 요소, i+1번째, i+2번째 요소가 오름차순 숫자일 때 실패
                          
                          return false
                      }
                  }
              }
  
          }
          return true
      }
      
      func printIDValidator(resultIDValidation: Bool) {
          
          if resultIDValidation == true {
              
              print("아이디가 규칙에 맞습니다.")
              
          } else {
              
              print("아이디가 규칙에 맞지 않습니다.")
          }
      }
  ```

------

------

## 연습문제 3. 비밀번호 등급 확인

func passwordValidator(password : String) → Int

- 숫자로만 구성되고 길이가 8글자 미만 : 아주 약한 암호 (1 Level)

- 영문자로만 구성되고 길이가 8글자 미만 : 약한 암호 (2 Level)

- 영문자와 한 개 이상의 숫자로 구성되어 있고 길이 8글자 이상 : 강한 암호 (4 Level)

- 영문자와 숫자, 특수문자로 구성되어 있고 길이가 8글자 이상 : 아주 강한 암호 (5 Level)

- 나머지 경우는 : 보통 암호 (3 Level)

- 코드

  ```swift
  		func getPassword() -> String {
          
          print("비밀번호를 입력하세요 : ", terminator: "")
          let password = readLine()!
          return password
      }
      
      func passwordValidator(password: String) -> Int {
          
          var grade = 0
          let length = password.count
          var bitIsNumber = 0, bitIsLetter = 0, bitIsSymbol = 0
          
          if length < 8 { //password 길이가 8글자 미만
              
              for bit in password {
                  
                  if bit.isNumber { //password 각 자리값이 숫자일 떄
                      
                      bitIsNumber += 1
                  } else if bit.isLetter { //password 각 자리값이 문자일 때
                      
                      bitIsLetter += 1
                  }
              }
              if bitIsNumber == length { //password가 숫자로만 구성되고 길이가 8글자 미만
                  grade += 1
              }else if bitIsLetter == length { //password가 문자로만 구성되고 길이가 8글자 미만
                  grade += 2
              }else { //숫자와 문자로 섞여서 구성되고 길이가 8글자 미만
                  grade += 3
              }
          } else if password.count >= 8 { //password 길이가 8글자 이상
              grade = 3 // 최소 3 Level
              for bit in password {
                  if bit.isNumber {
                      bitIsNumber += 1
                      continue
                  } else if bit.isLetter {
                      bitIsLetter += 1
                      continue
                  } else if bit.isSymbol || (bit.asciiValue! > 32 && bit.asciiValue! < 48) { //
                      bitIsSymbol += 1
                  }
              }
              if bitIsNumber > 0 && bitIsLetter > 0 { //영문자와 한 개 이상의 숫자, 길이 8글자 이상
                  grade += 1
                  if bitIsSymbol > 0 { //영문자, 숫자, 특수문자로 구성된 password
                      grade += 1
                  }
              }
          }
          
          return grade
      }
      
      func printPasswordValidator(input: Int) {
          print("당신의 Password 보안 등급은 \\(input)등급입니다.")
      }
  ```

------

------

## 연습문제 4. 주민번호 판별 검사

문제 정의 : 주민등록번호 13자리를 문자열(-는 제외)로 입력받아 정상적인 검사해서 결과를 참-거짓으로 출력하는 함수

1. 앞에서부터 12자리에 2~9, 2~5 각각의 상수 값을 곱해서 전체를 더한다.
2. 전체 더한 숫자를 11로 나눈 나머지를 구한다
3. 나머지 숫자를 11에서 빼고 10으로 나눈다.
4. 위에서 구한 숫자와 마지막 13번째 자리가 같은지 비교한다.

- 코드

  ```swift
  		func getSocialNum() -> String {
          
  		    print("주민등록번호 13자리를 입력해주세요 (-는 제외해주세요) : ", terminator: "")
  		    let socialNumber = readLine()!
          
  				return socialNumber
      }
      
      func socialNumValidator(socialNum: String) -> Bool {
          
          if socialNum.count != 13 {
              return false
          } else {
              var N: Int = 0
              let socialBit: [Int] = socialNum.map { Int(String($0)) ?? 0} //입력된 주민번호의 자릿수를 각각 하나의 원소로 갖는 배열 생성
              
              var a = 2
              for i in 0...7 {
                  N += a * socialBit[i]
                  a += 1
              }
              a = 2
              for i in 8...11{
                  N += a * socialBit[i]
                  a += 1
              }
              let K = (11 - (N % 11)) % 10
              if K == socialBit[12] {
                  return true
              } else {
                  return false
              }
          }
      }
      func printSocialNumValidator(input: Bool) {
          
          if input == true {
              print("정상적인 주민등록번호임이 확인되었습니다.")
          } else {
              print("잘못된 주민등록번호입니다.")
          }
      }
  ```

------

------

## 연습문제 5. 개미 속 퍼즐

func antFunction(inputArray:Array<Int>) → Array<Int>

```swift
- 직전값을 보관하는 변수를 선언한다 (초기값은?)
- 개수를 보관하는 변수를 선언한다 (초기값은?)

- 결과를 저장해서 리턴할 배열 변수를 선언한다
- inputArray 아이템 개수만큼 반복한다
- 아이템 값이 직전값과 같은지 비교한다
- 같으면 개수를 하나 증가한다
- 다르면 직전값과 현재 개수를 배열에 저장한다. 직전값을 아이템 값으로 변경한다.
- 결과 배열 변수를 리턴한다
```

- 코드

  ```swift
  		func antFunction(inputArray: Array<Int>) -> Array<Int> {
      
          var myValue = 0, mycnt = 1, myLocation = 0 //myValue : 직전값을 보관하는 변수, mycnt : 개수를 보관하는 변수(초깃값: 1)
          var outputArray: Array<Int> = [Int]()
          
          while myLocation <= inputArray.count-1 { //직전값의 위치가 배열의 맨 끝일 때까지
              
              myValue = inputArray[myLocation]
              
              if myLocation < inputArray.count-1 { //직전값의 위치가 배열의 맨 끝의 직전까지
                  
                  for i in myLocation+1...inputArray.count-1 { //직전값의 다음값부터 끝까지 비교
                      
                      if myValue == inputArray[i] { //직전값 = 비교하려는 값
                          
                          mycnt += 1
                          
                          if i == inputArray.count-1 { //비교하려는 값이 맨 끝자리 일 경우
                              
                              outputArray.append(myValue)
                              outputArray.append(mycnt)
                          }
                          
                      } else { // 직전값 != 비교하려는 값
                          
                          outputArray.append(myValue)
                          outputArray.append(mycnt)
                          break
                      }
                  }
              } else { //직접값의 위치가 배열의 맨 끝일 때
                  outputArray.append(myValue)
                  outputArray.append(mycnt)
              }
              
              
              myLocation = myLocation + mycnt //직전값과 같은 값을 가졌던 자리 이후의 자리부터 다음 비교를 시작할것임
              mycnt = 1 //개수 보관 변수 초기화(1)
              
          }
  
          return outputArray
      }
  ```

------

------

## 연습문제 6. 사전(Ditionary) 활용하기

- 다음과 같은 배열을 매개변수로 전달하면, 반복되는 문자열이 2개 이상인 단어만 배열로 리턴한다.

  `func duplicatedWords(inputWords: Array<String>) -> Array<String>`

- 예제1

> 입력

`["가을", "우주", "너굴", "우주", "겨울", "봄봄", "너굴", "너굴"]`

> 출력

`["우주", "너굴"]`

- 예제2

> 입력

`["가을", "너굴", "우주", "겨울", "봄봄", "여울"]`

> 출력

`[]`

- 코드

  ```swift
  		func duplicatedWords(inputWords: Array<String>) -> Array<String> {
  
          var cnt = 1
          var myLocation = 0
          var outputWords: [String] = [String]()
          
          while myLocation < inputWords.count {
  
              let myWord = inputWords[myLocation]
              
              if myLocation < inputWords.count-1 { //직전값의 위치가 배열의 맨 끝의 직전까지
                  
                  for i in myLocation+1...inputWords.count-1 {
  
                      if myWord == inputWords[i]{ //같은 단어 발견시
                          cnt += 1
                          break
                      }
                  }
  
                  if cnt != 1 { //비교가 끝나고, cnt > 0 인 값이 있는 경우
                      var cntSame = 0
                      for alreadyWritten in outputWords { //이미 입력된 단어라면 생략하기 위한 for + if 문
                          if myWord == alreadyWritten {
                              cntSame += 1
                              break
                          }
                      }
                      if cntSame == 0 {
                          outputWords.append(myWord)
                      }
                  }
                  cnt = 1 //같은 값 갯수 표시하는 변수 초기화
                  
              } else { //직전값의 위치가 배열의 맨 끝일 때
                  
                  if cnt != 1 {
                      
                      var cntSame = 0
                      for alreadyWritten in outputWords {
                          if myWord == alreadyWritten {
                              cntSame += 1
                              break
                          }
                      }
                      if cntSame == 0 {
                          outputWords.append(myWord)
                      }
                  }
              }
              myLocation += 1
          }
  
          return outputWords
  
      }
  ```