import { CommonConstants } from '../../common/constants/CommonConstants'

@Extend(GridItem) function gridItemStyle() {
  .height(60)
  .borderRadius(8)
  .backgroundColor(Color.White)
}

@Component
export default struct NumberKeyboard {
  @State keyBoardStrings: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.']
  updateAmount: (value: string) => void
  deleteNumber: () => void

  build() {
    Grid() {
      ForEach(this.keyBoardStrings, num => {
        GridItem() {
          Text(num)
            .fontSize(20)
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
        }
        .gridItemStyle()
        .onClick(() => this.updateAmount(num))
      })

      GridItem() {
        Text('删除')
          .fontSize(20)
          .fontWeight(CommonConstants.FONT_WEIGHT_600)
      }
      .gridItemStyle()
      .onClick(() => this.deleteNumber())
    }
    .width('100%')
    .height(280)
    .backgroundColor($r('app.color.index_page_background'))
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(8)
    .rowsGap(8)
    .padding(8)
    .margin({ top: 8 })
  }
}