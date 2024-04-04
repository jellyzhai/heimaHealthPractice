import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export struct CalorieStats {
  @Builder statsText(firstText: string, count: number, thirdText?: string) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Text(firstText)
      Text(count.toString())
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      if (thirdText) {
        Text(thirdText)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }
    }
  }

  build() {
    Row({ space: CommonConstants.SPACE_6 }) {
      this.statsText('饮食摄入', 0)

      Stack() {
        Progress({ type: ProgressType.Ring, value: 0 })
          .width(120)
          .style({ strokeWidth: CommonConstants.DEFAULT_10 })

        this.statsText('还可以吃', 0, '推荐/1962')
      }

      this.statsText('运动消耗', 0)
    }
    .padding({ top: 30, bottom: 35 })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}