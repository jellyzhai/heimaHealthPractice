import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export default struct UserPrivacyDialog {
  dialogController: CustomDialogController
  confirm: () => void
  cancel: () => void

  build() {
    Column({ space: CommonConstants.SPACE_10 }) {
      Text($r('app.string.user_privacy_title'))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_600)

      Text($r('app.string.user_privacy_content'))

      Button($r('app.string.agree_label'))
        .width(150)
        .backgroundColor($r('app.color.primary_color'))
        .onClick(() => {
          this.confirm()
          this.dialogController.close()
        })

      Button($r('app.string.refuse_label'))
        .width(150)
        .fontColor($r('app.color.light_gray'))
        .backgroundColor($r('app.color.lightest_primary_color'))
        .onClick(() => {
          this.cancel()
          this.dialogController.close()
        })

    }
    .padding(10)
  }
}