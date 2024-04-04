import { CommonConstants } from '../../common/constants/CommonConstants'
import { FoodCategories, WorkoutCategories } from '../../model/EnergySourceCategoryModel'
import energySourceModelService from '../../model/EnergySourceModel'
import EnergySource from '../../viewmodel/EnergySource'
import EnergySourceCategory from '../../viewmodel/EnergySourceCategory'

@Component
export default struct ItemList {
  @Consume isFood: boolean
  @Consume categoryID: number
  @State categories: EnergySourceCategory[] = []
  @State energySources: EnergySource[] = []
  @State displayedEnergySources: EnergySource[] = []
  showPanel: (item: EnergySource) => void

  aboutToAppear() {
    this.categories = this.isFood ? FoodCategories : WorkoutCategories
    this.energySources = energySourceModelService.list(this.isFood)
    this.updateDisplayedEnergySources(this.categoryID)
  }

  updateDisplayedEnergySources(id: number) {
    this.displayedEnergySources = id < 0 ? this.energySources : this.energySources.filter(item => item.categoryId === id)
  }

  build() {
    Tabs({ index: this.categoryID + 1 }) {
      TabContent() {
        this.TabContentBuilder()
      }.tabBar('全部')

      ForEach(this.categories, (category: EnergySourceCategory) => {
        TabContent() {
          this.TabContentBuilder()
        }.tabBar(category.name)
      })
    }
    .barMode(BarMode.Scrollable)
    .padding({ left: 8, right: 8 })
    .onChange(index => this.updateDisplayedEnergySources(index - 1))
  }

  @Builder TabContentBuilder() {
    List({ space: CommonConstants.SPACE_10 }) {
      ForEach(this.displayedEnergySources, (item: EnergySource) => {
        ListItem() {
          Row({ space: CommonConstants.SPACE_6 }) {
            Image(item.image)
              .width(50)
            Column() {
              Text(item.name)
                .fontWeight(CommonConstants.FONT_WEIGHT_500)
              Text(`${item.calorie}千卡/${item.unit}`)
                .fontSize(14)
                .fontColor($r('app.color.light_gray'))
            }

            Blank()

            Image($r('app.media.ic_public_add_norm_filled'))
              .width(18)
              .fillColor($r('app.color.primary_color'))
              .onClick(() => {
                this.showPanel(item)
              })
          }
          .width('100%')
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}