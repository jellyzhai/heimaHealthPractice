import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct ItemPanelHeader {
  build() {
    Row() {
      Text('2024/3/28 早餐')
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Image($r('app.media.ic_public_spinner'))
        .width(20)
        .fillColor(Color.Black)
    }
    .padding(CommonConstants.SPACE_8)
  }
}