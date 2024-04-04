import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemList from '../views/item/ItemList'
import ItemPanelHeader from '../views/item/ItemPanelHeader'
import ItemCard from '../views/item/ItemCard'
import NumberKeyboard from '../views/item/NumberKeyboard'
import { FoodCategoryEnum, WorkoutCategoryEnum } from '../model/EnergySourceCategoryModel'
import EnergySource from '../viewmodel/EnergySource'

@Entry
@Component
struct ItemIndex {
  routeParams = router.getParams()
  title: string = this.routeParams?.['title'] ?? '运动'
  @Provide isFood: string = this.routeParams?.['isFood'] ?? false
  @Provide categoryID: number = this.routeParams?.['categoryID'] ?? WorkoutCategoryEnum.WALKING
  @State isPanelShow: boolean = false
  @State amount: string = ''
  @Provide panelDetail: EnergySource = null

  showPanel(detail: EnergySource) {
    this.panelDetail = detail
    this.isPanelShow = true
  }

  updateAmount(value: string) {
    const numberLength = this.amount.length
    const includeDot = this.amount.includes('.')
    const isDotLastIndex = includeDot && this.amount.lastIndexOf('.') === numberLength - 1
    const isValidFraction = includeDot && this.amount.split('.')[1]

    if (
      (!this.amount.trim() && (value === '0' || value === '.'))
      || (includeDot && value === '.')
      || (isDotLastIndex && (value !== '5' && value !== '0'))
      || isValidFraction
      || +(this.amount + value) > 999.5
    ) {
      return
    }
    this.amount = this.amount + value
  }

  deleteNumber() {
    const numberLength = this.amount.length
    if (numberLength > 0) {
      this.amount = this.amount.slice(0, numberLength - 1)
    }
  }

  build() {
    Column() {
      // 头部
      this.Header()

      // tabs 默认撑满容器
      ItemList({ showPanel: this.showPanel.bind(this) })
        .layoutWeight(1)

      // 添加数据面板
      Panel(this.isPanelShow) {
        // 面板头部
        ItemPanelHeader()

        // 食物运动信息相关
        ItemCard({ amount: this.amount })

        // 数字键盘
        NumberKeyboard({ updateAmount: this.updateAmount.bind(this), deleteNumber: this.deleteNumber.bind(this) })

        // 按钮
        Row({ space: CommonConstants.SPACE_8 }) {
          Button('取消')
            .type(ButtonType.Normal)
            .width(120)
            .borderRadius(6)
            .backgroundColor($r('app.color.light_gray'))
            .onClick(() => this.isPanelShow = false)

          Button('确认')
            .type(ButtonType.Normal)
            .width(120)
            .borderRadius(6)
            .backgroundColor($r('app.color.primary_color'))
            .onClick(() => this.isPanelShow = false)
        }
        .margin({ top: 10 })
      }
      .mode(PanelMode.Full)
      .dragBar(false)
      .backgroundColor('white')
      .backgroundMask($r('app.color.light_gray'))
    }
    .width('100%')
    .height('100%')
  }

  @Builder Header() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(24)
        .position({ x: 0 })
        .onClick(() => router.back())

      Text(this.title)
    }
    .width(CommonConstants.THOUSANDTH_1000)
    .justifyContent(FlexAlign.Center)
    .padding(CommonConstants.DEFAULT_8)
  }
}