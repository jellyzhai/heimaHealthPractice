import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export default struct DatePickerCustomDialog {
  controller: CustomDialogController
  // api 9 版本的 new Date().toLocaleDateString() 结果是 '3/30/2024'; 浏览器控制台中是 '2024/3/26'
  @StorageLink('selectedStatsDate') date: string = new Date().toLocaleDateString()
  selectedDate: string

  build() {
    Column({ space: CommonConstants.SPACE_12 }) {
      DatePicker({ selected: new Date(this.date) })
        .onChange(res => {
          this.selectedDate = `${res.month + 1}/${res.day}/${res.year}`
        })
      Row({ space: CommonConstants.SPACE_12 }) {
        Button('取消')
          .width(120)
          .backgroundColor($r('app.color.light_gray'))
          .onClick(() => this.controller.close())

        Button('确定')
          .width(120)
          .backgroundColor($r('app.color.primary_color'))
          .onClick(() => {
            this.date = this.selectedDate
            this.controller.close()
          })
      }
    }
    .padding(CommonConstants.SPACE_12)
  }
}