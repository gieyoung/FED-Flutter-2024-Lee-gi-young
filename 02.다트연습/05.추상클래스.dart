/****************************************** 
 [다트 추상클래스]
 -> 형식을 강제할때 사용하는 클래스 생성방법
 -> 일반 상속과 달리 추상클래스는 모든 속성과
 메서드를 다 구현해야함!
 * 사용법:
 * abstract 키워드로 클래스를 선언한다->추상클래스
 * abstract는 추상화한...라는 뜻
 * 
  abstract class 추상클래스명{
    구현부
  }
 
 * 추상클래스를 상속 받는 것처럼 연결하는 방법은
 * implements 키워드로 연결한다!
 * implement는 시행하다...라는 뜻!
 * -> 추상클래스에 정의된 모든 속성과 메서드를 구현해야함!
 
 class 클래스명 implements 추상클래스명 {
    구현부
 }
******************************************/

// 추상클래스 연습 : 사람클래스를 추상클래스로 만들기
// -> 특정인물 클래스에서 사람클래스를 받아서 구현함!

abstract class Saram{
  // 생성자
  Saram(this.name);

  // 속성과 메서드 설계하기
  // ->>> 추상클래스 메서드는 
  // 구체적으로 구현하지 않는다! -> 해당클래스에서 구현
  // -> 그러나 대체적인 틀을 잡을 수 있음

  // 1. 이름속성
  final String name;
  // 2. 성별메서드
  String gender();
  // 3. 나이메서드
  String age();
  // 4. 먹다메서드 : 내용틀잡기
  String eat() => '$name씨는 지금 아무것도 안먹는다!';
  // 람다식 앞에 함수일 경우 Function키워드가 없다!

  // 5. 말하다메서드 : 내용틀잡기
  String say() => '$name씨는 지금 아무말도 안한다!';
} 


// 추상클래스를 상속(implements)받아 사용하기!
// -> 오버라이드 필수!(재정의를 반드시 해야함!)
// 도경수 배우의 클래스
class KyungSu implements Saram {
  @override
  late String _name; // 셋팅변수
  String get name => _name;
  set name(String name) => _name = name;

  // String get name => '도경수';
  // get 키워드는 겟터를 사용하는 변수를 선언함

  @override
  String gender() => '$name씨는 남자다!';

  @override
  String age() => '$name씨의 나이는 30살이다!';

  @override
  String eat(){return '$name씨는 피자를 먹는다!';}
  // String eat() => '$name씨는 피자를 먹는다!';

  @override
  String say() => '$name씨는 무엇인가 말하고 있다!';

} //////////// KyungSu 클래스 /////////////


/// 남지현 배우 클래스 : Saram 클래스  일반 상속하기
 /// 일반상속은 부모클래스의 모든 내용을 재정의할 필요없음!
 /// -> 단, 구체적인 정의가 없는 메서드는 필수재정의!!!
 class JeeHyun extends Saram {
  // 생성자 : 받은 값을 부모클래스로 넘겨 먼저셋팅함!
   JeeHyun(String name) : super(name);

  @override
  String gender() => '$name씨는 여자다!';

  @override
  String age() => '$name씨는 28살이다!';

 } ////////// JeeHyun 클래스 ///////////

 // 일반적인 남자를 나타내는 클래스 /////////
 // 추상클래스임! -> 추상클래스를 일반상속한 추상클래스임!
 abstract class Namja extends Saram {
  // 생성자
  Namja(String name) : super(name);

  // 필수재정의는 없고 원하는 것을 재정의함!
  @override
  String gender() => '$name씨는 남자다!';

 } //////////// Namja 추상클래스 /////////////

 // 일반적인 여자를 나타내는 클래스 /////////
 // 추상클래스임! -> 추상클래스를 일반상속한 추상클래스임!
 abstract class Yeoja extends Saram {
  // 생성자
  Yeoja(String name) : super(name);

  // 필수재정의는 없고 원하는 것을 재정의함!
  @override
  String gender() => '$name씨는 여자다!';

 } //////////// Yeoja 추상클래스 /////////////


 /////// 박서준 배우의 클래스 /////////////
 /// 남자 추상클래스를 상속받는다!
 /// 추상클래스를 일반상속한 클래스는 추상클래스의 미정의 메서드를
 /// 필수정의 해야하는데 gender() 메서드는 상속받은
 /// 추상클래스인 Namja에서 이미 재정의 했으므로
 /// Saram 추상클래스에 남은 재정의 메서드 항목은 age만 남는다!
 class SeoJun extends Namja {
  SeoJun(String name) : super(name);

  // 필수재정의 항목 : age()
  String age() => '$name씨는 39살이다!';

  // 내가 추가로 하고 싶은 재정의하기
  String eat() => '$name씨는 햄버거를 먹는다!';

 } ///////// SeoJun 클래스 ///////////////