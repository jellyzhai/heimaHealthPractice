import { ScreenSizeEnum, TabBarPosition, TabOrientation } from '../common/constants/MediaQueryConstants'
import MediaQuerySystem from '../common/utils/MediaQuerySystem'
import RecordTabContent from '../views/record/RecordTabContent'

@Entry
@Component
struct Index {
  @State selectedIndex: number = 0
  @StorageProp('currentBreakpoint') screenSize: string = ScreenSizeEnum.BREAKPOINT_SM
  mediaQuerySystem: MediaQuerySystem = new MediaQuerySystem()

  getSelectedColor(index: number) {
    return this.selectedIndex === index ? $r('app.color.primary_color') : $r('app.color.gray')
  }

  aboutToAppear() {
    this.mediaQuerySystem.startToListen()
  }

  aboutToDisappear() {
    this.mediaQuerySystem.cancelListen()
  }

  @Builder tabBarBuilder(icon: Resource, text: Resource, index: number) {
    // 图片均为 svg 可以填充改变颜色
    Column({ space: 5 }) {
      Image(icon)
        .width(22)
        .fillColor(this.getSelectedColor(index))
      Text(text)
        .fontSize(14)
        .fontColor(this.getSelectedColor(index))
    }
  }

  build() {
    // Tabs组件默认撑满容器
    Tabs({ barPosition: TabBarPosition[this.screenSize] }) {
      TabContent() {
        RecordTabContent()
      }
      .tabBar(this.tabBarBuilder($r('app.media.ic_calendar'), $r('app.string.tab_record'), 0))

      TabContent() {
        Text('发现')
      }
      .tabBar(this.tabBarBuilder($r('app.media.discover'), $r('app.string.tab_discover'), 1))

      TabContent() {
        Text('我的')
      }
      .tabBar(this.tabBarBuilder($r('app.media.ic_user_portrait'), $r('app.string.tab_user'), 2))
    }
    .vertical(TabOrientation[this.screenSize])
    .onChange(index => this.selectedIndex = index)
  }
}