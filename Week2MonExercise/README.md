## 연습문제 1 - 배열

### 미션1. 2차원 배열 만들기 & 출력하기

> <span class="evidence">ArrayPractice struct</span>  생성, <span class="evidence">fillArray() -> Void</span>  함수 이용

<img src="https://ifh.cc/g/bqdFfy.png" align="left">

### 미션2. setBoolArray와 printArray

> true가 우측 정렬된 삼각형 모양의 Bool 배열을 반환하는 <span class="evidence">setBoolArray()</span> 함수 생성
>
> true면 newChar을, false면 빈 공백을 출력하는 <span class="evidence">printArray(arr:[[Bool]], newChar: Character)</span> 함수 생성

<img src="https://ifh.cc/g/qmYTu6.png" align="left">

### 미션3. 마방진

> 마방진 배열을 생성하는 <span class="evidence">makeMagicSquare(row:Int)->[[Int]]</span> 메서드 생성
>
> 마방진 배열을 출력하는 <span class="evidence">printMagicSquare([[Int]])</span> 메서드 생성

<img src="https://ifh.cc/g/8mAK8G.png" align="left">

---



## 연습문제 2 - 아이디 규칙 검사

> 아이디 규칙을 검사하는 <span class="evidence">func IDValidator(password:String) -> Bool</span> 메서드 생성
>
> * 지켜야할 아이디 규칙
>   1. 아이디 길이가 5~23글자 -> password.count로 해결
>   2. 영문 대소문자, 숫자, 특수문자 <span class="evidence">-</span> 만 포함 가능 -> CharacterSet 이용해 해결/ ascii코드로 해결
>   3. 같은 숫자 연속 3회 금지 -> String index를 이용해 접근
>   4. 세 숫자가 오름차순 순으로 정렬 -> 위와 동

---



## 연습문제 3 - 비밀번호 등급 확인

> 비밀번호 등급을 return하는 <span class="evidence">func passwordValidator(password:String) -> Int</span> 메서드 생성
>
> * 비밀번호 등급
>   1. 숫자로만 구성 + 8글자 미만 : 1Level -> CharacterSet과 password.count 이용 
>   2. 영문자로만 구성 + 8글자 미만 : 2Level -> 위와 동
>   3. 영문자  + 1개 이상의 숫자 + 8글자 이상 : 4Level -> 위와 동
>   4. 영문자, 숫자, 특수문자로 구성 + 8글자 이상 : 5Level -> 위와 동
>   5. 나머지 경우 : 3Level

---



## 연습문제 4 - 주민번호 판별 검사



> 주민번호 앞에서부터 12자리에 2~9, 2~5 상수값을 곱해서 더하고, 전체 더한 수를 11로 나눈 나머지를 구한다.
>
> 11에서 그 나머지를 빼서 10으로 나눈다.
>
> 결과값이 주민번호의 13번째 자리와 같은지 비교한다.

---



## 연습문제 5 - 개미 속 퍼즐

> 입력된 배열의 값, 개수를 차례대로 출력하는 <span class="evidence">func antFunction(inputArray:[Int]) -> [Int]</span>  함수를 생성

[1, 1] -> [1, 2] -> [1, 1, 2, 1] -> [1, 2, 2, 1, 1, 1]...

---

## 연습문제 6 - 사전(Dictionary) 활용하기

> 2번 이상 반복되는 단어만 리턴하는 <span class="evidence">func duplicatedWords(inputWords: [String]) -> [String]</span> 함수 생성