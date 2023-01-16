const Bee = require('./Bee');

class ForagerBee extends Bee {
  // TODO..
  constructor (age, color, food, job){
    super(color, food);
    this.age = 10;
    this.canFly = true;
    this.job = 'find pollen';
    this.treasureChest = [];
  }
  eat(){
    return super.eat()
  }
  forage(el){
    this.treasureChest.push(el)
  }
}

module.exports = ForagerBee;
// ForagerBee class functionality
// 1) `age` 속성은 `10`이어야 합니다
// 2) `job` 속성은 `find pollen`이어야 합니다
// 3) `color` 속성은 `Bee`로부터 상속받습니다
// 4) `food` 속성은 `Grub`으로부터 상속받습니다
// 5) `eat` 메소드는 `Grub`으로부터 상속받습니다
// 6) `canFly` 속성은 `true`이어야 합니다
// 7) `treasureChest` 속성은 빈 배열 `[]`이어야 합니다
// 8) `forage` 메소드를 통해 `treasureChest` 속성에 보물을 추가할 수 있어야 합니다