import EnergySourceCategory from '../viewmodel/EnergySourceCategory'

/**
 * 食物类型的枚举
 */
enum FoodCategoryEnum {
  /**
   * 主食
   */
  STAPLE,
  /**
   * 蔬果
   */
  FRUIT,
  /**
   * 肉蛋奶
   */
  MEAT,
  /**
   * 坚果
   */
  NUT,
  /**
   * 其它
   */
  OTHER,
}

/**
 * 食物类型数组
 */
const FoodCategories = [
  new EnergySourceCategory(0, $r('app.string.staple')),
  new EnergySourceCategory(1, $r('app.string.fruit')),
  new EnergySourceCategory(2, $r('app.string.meat')),
  new EnergySourceCategory(3, $r('app.string.nut')),
  new EnergySourceCategory(4, $r('app.string.other_type')),
]

/**
 * 运动类型枚举
 */
enum WorkoutCategoryEnum {
  /**
   * 走路
   */
  WALKING,
  /**
   * 跑步
   */
  RUNNING,
  /**
   * 骑行
   */
  RIDING,
  /**
   * 跳操
   */
  AEROBICS,
  /**
   * 游泳
   */
  SWIMMING,
  /**
   * 打球
   */
  BALLGAME,
  /**
   * 力量训练
   */
  STRENGTH
}

/**
 * 运动类型数组
 */
const WorkoutCategories = [
  new EnergySourceCategory(0, $r('app.string.walking_type')),
  new EnergySourceCategory(1, $r('app.string.running')),
  new EnergySourceCategory(2, $r('app.string.riding')),
  new EnergySourceCategory(3, $r('app.string.aerobics')),
  new EnergySourceCategory(4, $r('app.string.swimming')),
  new EnergySourceCategory(5, $r('app.string.ballgame')),
  new EnergySourceCategory(6, $r('app.string.strength')),
]

export { FoodCategories, WorkoutCategories, FoodCategoryEnum, WorkoutCategoryEnum }