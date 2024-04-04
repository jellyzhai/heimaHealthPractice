import preferenceUtil from '../common/utils/PreferenceUtil'
import router from '@ohos.router'
import common from '@ohos.app.ability.common'
import UserPrivacyDialog from '../views/welcome/UserPrivacyDialog'

@Extend(Text) function welcomeText(opacity: number, size: number = 12) {
  .fontSize(size)
  .opacity(opacity)
  .fontColor(Color.White)
}

const PREF_KEY = 'userAgreePrivacyPolicy'

@Entry
@Component
struct WelcomePage {
  appContext = getContext(this).getApplicationContext()
  dialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm: this.onAgree.bind(this),
      cancel: this.onNotAgree.bind(this),
    })
  })

  onAgree() {
    preferenceUtil.putPreferenceValue(PREF_KEY, true)
    router.pushUrl({ url: 'pages/Index' })
  }

  onNotAgree() {
    this.appContext.killAllProcesses()
  }

  async aboutToAppear() {
    const isAgree = await preferenceUtil.getPreferenceValue(PREF_KEY, false)

    if (isAgree) {
      setTimeout(() => {
        router.pushUrl({ url: 'pages/Index' })
      }, 1000)
    } else {
      this.dialogController.open()
    }
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.home_slogan'))
          .width(260)
      }
      .layoutWeight(1)

      Column({ space: 5 }) {
        Image($r('app.media.home_logo'))
          .width(150)

        Row() {
          Text('黑马健康支持')
            .welcomeText(0.8)

          Text('IPv6')
            .welcomeText(0.8)
            .padding({ left: 5, right: 5 })
            .border({ width: 1, color: Color.White, radius: 8 })

          Text('网络')
            .welcomeText(0.8)
        }

        Text(`'减更多'指黑马健康App希望通过软件工具的形式，帮助更多用户实现身材管理`)
          .welcomeText(0.6, 10)

        Text('浙ICP备0000000号-36D')
          .welcomeText(0.6, 10)
      }
      .margin({ bottom: 15 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.primary_color'))
  }
}