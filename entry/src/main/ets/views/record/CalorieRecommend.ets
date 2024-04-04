import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export struct CalorieRecommend {
  build() {
    Row({ space: CommonConstants.SPACE_6 }) {
      this.recommendText({
        progress: 0,
        total: 237,
        ringColor: $r('app.color.carbon_color'),
        tips: '碳水化合物'
      })

      this.recommendText({
        progress: 0,
        total: 237,
        ringColor: $r('app.color.protein_color'),
        tips: '蛋白质'
      })

      this.recommendText({
        progress: 0,
        total: 237,
        ringColor: $r('app.color.fat_color'),
        tips: '脂肪'
      })
    }
    .padding({ top: 30, bottom: 35 })
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder recommendText($$: {
    progress: number,
    total: number,
    ringColor: Resource,
    tips: string
  }) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Stack() {
        Progress({ type: ProgressType.Ring, value: $$.progress, total: $$.total })
          .width(95)
          .style({ strokeWidth: CommonConstants.DEFAULT_6 })
          .color($$.ringColor)

        Column({ space: CommonConstants.SPACE_6 }) {
          Text('摄入推荐')
            .fontSize(12)
            .fontColor($r('app.color.gray'))
          Text(`${$$.progress.toString()}/${$$.total.toString()}`)
            .fontSize(18)
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
        }
      }

      Text(`${$$.tips}/ (克)}`)
        .fontSize(12)
        .fontColor($r('app.color.light_gray'))
    }
  }
}