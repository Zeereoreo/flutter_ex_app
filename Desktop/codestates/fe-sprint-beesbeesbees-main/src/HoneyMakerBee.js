const Bee = require('./Bee');

class HoneyMakerBee extends Bee{
  // TODO..
  constructor (age, color, food, job, honeyPot){
    super(color, food);
    this.age = 10;
    this.job = 'make honey'
    this.canFly = true;
    this.treasureChest = [];
    this.honeyPot = 0
  }
  eat(){
    return super.eat()
  }
  makeHoney (){
    this.honeyPot = this.honeyPot + 1
  }
  giveHoney (){
    this.honeyPot--
  }
}

module.exports = HoneyMakerBee;
// 1) `age` 속성은 `10`이어야 합니다
// 2) `job` 속성은 `make honey`이어야 합니다
// 3) `color` 속성은 `Bee`로부터 상속받습니다
// 4) `food` 속성은 `Grub`으로부터 상속받습니다
// 5) `eat` 메소드는 `Grub`으로부터 상속받습니다
// 6) `honeyPot` 속성은 `0`이어야 합니다
// 7) `makeHoney` 메소드는 `honeyPot`에 1씩 추가합니다
// 8) `giveHoney` 메소드는 `honeyPot`에 1씩 뺍니다
