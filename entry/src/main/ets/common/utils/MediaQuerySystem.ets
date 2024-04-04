import mediaQuery from '@ohos.mediaquery'
import { ScreenRangeEnum, ScreenSizeEnum, ScreenStorageKeyEnum } from '../constants/MediaQueryConstants'

export default class MediaQuerySystem {
  private smListener = mediaQuery.matchMediaSync(ScreenRangeEnum.RANGE_SM)
  private mdListener = mediaQuery.matchMediaSync(ScreenRangeEnum.RANGE_MD)
  private lgListener = mediaQuery.matchMediaSync(ScreenRangeEnum.RANGE_LG)

  updateMediaQueryResult(result: mediaQuery.MediaQueryResult, screenSize: ScreenSizeEnum) {
    if (result.matches) {
      AppStorage.SetOrCreate(ScreenStorageKeyEnum.CURRENT_BREAKPOINT, screenSize)
    }
  }

  onSMChange(result: mediaQuery.MediaQueryResult) {
    this.updateMediaQueryResult(result, ScreenSizeEnum.BREAKPOINT_SM)
  }

  onMDChange(result: mediaQuery.MediaQueryResult) {
    this.updateMediaQueryResult(result, ScreenSizeEnum.BREAKPOINT_MD)
  }

  onLGChange(result: mediaQuery.MediaQueryResult) {
    this.updateMediaQueryResult(result, ScreenSizeEnum.BREAKPOINT_LG)
  }

  startToListen() {
    this.smListener.on('change', this.onSMChange.bind(this))
    this.mdListener.on('change', this.onMDChange.bind(this))
    this.lgListener.on('change', this.onLGChange.bind(this))
  }

  cancelListen() {
    this.smListener.off('change', this.onSMChange.bind(this))
    this.mdListener.off('change', this.onMDChange.bind(this))
    this.lgListener.off('change', this.onLGChange.bind(this))
  }
}