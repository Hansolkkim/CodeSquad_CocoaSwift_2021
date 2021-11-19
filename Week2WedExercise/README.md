## 연습문제 1 - 이자율 계산 구조체

> Day를 받아서 이자율을 계산하는 <span class="evidence">getInterestRate(byDay:Int)->Double</span> 메서드 구현
>
> * 일자에 따른 이자율
>   1. Day < 90 -> 0.5%
>   2. 91<=Day<=180 -> 1%
>   3. 181<=Day<=364 -> 2%
>   4. 365 <= Day -> 5.6%
>
>   예치 기간, 원금에 따른 예치 계산 금액을 return하는 <span class="evidence">calculateAmount(day:Int, amount:Int) -> Double</span> 메서드 구현
>
> 입력된 unitDay에 따른 원금 100만원의 예치 계산 금액을 return하는 <span class="evidence">testInterest(unitDay: Int) -> Double</span> 메서드 구현

<img src="https://ifh.cc/g/KDVm8r.gif" align="left">

---



## 연습문제 2 - 숫자 야구 게임 구조체

> Int.Random() 메서드를 이용해, 임의의 3자리 숫자를 생성해 내부 프로퍼티에 저장하는 <span class="evidence">newGame()</span> 메서드,
>
> 입력을 받은 3자리 숫자를 비교 후 결과를 return 하는 <span class="evidence">ht(num: Int) -> (strickeCount:Int, ballCount:Int)</span>  메서드,
>
> 9번 try 내에 3 스트라이크가 나오면 true, 안되면 false를 return 하는 <span class="evidence">showGameScore() -> Bool</span>  메서드를 포함하는 숫자야구 게임 구조체 만들기.

<img src="https://ifh.cc/g/saCmsR.gif" align="left" style = "zoom:200%">

