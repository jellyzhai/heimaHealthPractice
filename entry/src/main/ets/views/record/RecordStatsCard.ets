import { CommonConstants } from '../../common/constants/CommonConstants'
import { ScreenSizeEnum } from '../../common/constants/MediaQueryConstants'
import DateUtil from '../../common/utils/DateUtil'
import { CalorieRecommend } from './CalorieRecommend'
import { CalorieStats } from './CalorieStats'
import DatePickerCustomDialog from './DatePickerCustomDialog'

PersistentStorage.PersistProp('selectedStatsDate', new Date().toLocaleDateString())

@Component
export default struct RecordStatsCard {
  // api 9 版本的 new Date().toLocaleDateString() 结果是 '3/30/2024'; 浏览器控制台中是 '2024/3/26'
  @StorageProp('selectedStatsDate') selectedDate: string = new Date().toLocaleDateString()
  customDialogController = new CustomDialogController({
    builder: DatePickerCustomDialog()
  })
  @StorageProp('currentBreakpoint') screenSize: string = ScreenSizeEnum.BREAKPOINT_SM

  build() {
    Column() {
      Row() {
        Text(DateUtil.formatDateString(this.selectedDate))
        Image($r('app.media.ic_public_spinner'))
          .width(20)
          .fillColor($r('app.color.secondary_color'))
      }
      .padding(CommonConstants.SPACE_8)
      .onClick(() => {
        this.customDialogController.open()
      })

      Swiper() {
        CalorieStats()

        CalorieRecommend()
      }
      .width('100%')
      .displayCount(this.screenSize === ScreenSizeEnum.BREAKPOINT_LG ? 2 : 1)
      .indicator(this.screenSize !== ScreenSizeEnum.BREAKPOINT_LG)
      .backgroundColor(Color.White)
      .borderRadius(CommonConstants.DEFAULT_18)
      .indicatorStyle({ selectedColor: $r('app.color.primary_color') })
      .shadow({ radius: 1, color: $r('app.color.stats_title_bgc'), offsetY: 1 })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_18)
  }
}