import { CommonConstants } from '../../common/constants/CommonConstants'
import EnergySource from '../../viewmodel/EnergySource'

@Component
export default struct ItemCard {
  @Prop @Watch('onAmountChange') amount: string
  @Consume @Watch('onPanelDetailChange') panelDetail: EnergySource
  @State isDotLastIndex: boolean = false

  onAmountChange() {
    this.isDotLastIndex = this.amount.includes('.') && this.amount.lastIndexOf('.') === this.amount.length - 1
  }

  onPanelDetailChange() {
    console.log('testTag onPanelDetailChange', JSON.stringify(this.panelDetail))
  }

  build() {
    if (this.panelDetail) {
      Column({ space: CommonConstants.SPACE_8 }) {
        Image(this.panelDetail.image)
          .width(150)
        Text(this.panelDetail.name)
          .fontWeight(CommonConstants.FONT_WEIGHT_700)
          .padding(5)
          .backgroundColor($r('app.color.lightest_primary_color'))
        Divider()
          .width(CommonConstants.THOUSANDTH_940)
          .opacity(0.6)
        Row({ space: CommonConstants.SPACE_8 }) {
          if (this.panelDetail.calorie) {
            Column({ space: CommonConstants.SPACE_6 }) {
              Text(`热量(千卡)`)
                .fontSize(12)
                .fontColor($r('app.color.light_gray'))
              Text(`${+this.amount > 0 ? (this.panelDetail.calorie * +this.amount).toFixed(1) : this.panelDetail.calorie.toFixed(1)}`)
                .fontSize(14)
                .fontWeight(CommonConstants.FONT_WEIGHT_600)
            }

            // 父组件传递给子组件的object对象数据A，在更新后，子组件中 使用A的属性值的 @Builder封装的组件，没有重新渲染
            // this.NutrientInfo(`热量(千卡)`, this.panelDetail.calorie)
          }
          if (this.panelDetail.carbon) {
            Column({ space: CommonConstants.SPACE_6 }) {
              Text(`碳水(克)`)
                .fontSize(12)
                .fontColor($r('app.color.light_gray'))
              Text(`${+this.amount > 0 ? (this.panelDetail.carbon * +this.amount).toFixed(1) : this.panelDetail.carbon.toFixed(1)}`)
                .fontSize(14)
                .fontWeight(CommonConstants.FONT_WEIGHT_600)
            }

            // this.NutrientInfo(`碳水(克)`, this.panelDetail.carbon)
          }
          if (this.panelDetail.protein) {
            Column({ space: CommonConstants.SPACE_6 }) {
              Text(`蛋白质(克)`)
                .fontSize(12)
                .fontColor($r('app.color.light_gray'))
              Text(`${+this.amount > 0 ? (this.panelDetail.protein * +this.amount).toFixed(1) : this.panelDetail.protein.toFixed(1)}`)
                .fontSize(14)
                .fontWeight(CommonConstants.FONT_WEIGHT_600)
            }
            // this.NutrientInfo(`蛋白质(克)`, this.panelDetail.protein)
          }
          if (this.panelDetail.fat) {
            Column({ space: CommonConstants.SPACE_6 }) {
              Text(`脂肪(克)`)
                .fontSize(12)
                .fontColor($r('app.color.light_gray'))
              Text(`${+this.amount > 0 ? (this.panelDetail.fat * +this.amount).toFixed(1) : this.panelDetail.fat.toFixed(1)}`)
                .fontSize(14)
                .fontWeight(CommonConstants.FONT_WEIGHT_600)
            }
            // this.NutrientInfo(`脂肪(克)`, this.panelDetail.fat)
          }
        }

        Divider()
          .width(CommonConstants.THOUSANDTH_940)
          .opacity(0.6)

        Row() {
          Column() {
            Row() {
              Text(this.amount.trim() === '' ? '0' : this.amount)
                .fontSize(50)
                .fontColor($r('app.color.primary_color'))
              if (this.isDotLastIndex) {
                Text('0')
                  .fontSize(50)
                  .fontColor($r('app.color.light_gray'))
              }
            }

            Divider()
              .color($r('app.color.primary_color'))
              .width(130)
          }

          Text(this.panelDetail.unit)
            .fontSize(12)
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
            .fontColor($r('app.color.light_gray'))
        }
      }
    }
  }

  @Builder NutrientInfo(label: string, value: number) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Text(label)
        .fontSize(12)
        .fontColor($r('app.color.light_gray'))
      Text(`${+this.amount > 0 ? (value * +this.amount).toFixed(1) : value.toFixed(1)}`)
        .fontSize(14)
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
    }
  }
}