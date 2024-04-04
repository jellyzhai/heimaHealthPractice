// import BreakpointType from '../bean/BreanpointType';

export enum ScreenSizeEnum {
  /**
   * 小屏幕设备的 Breakpoints 标记.
   */
  BREAKPOINT_SM = 'sm',
  /**
   * 大屏幕设备的 Breakpoints 标记.
   */
  BREAKPOINT_MD = 'md',

  /**
   * 大屏幕设备的 Breakpoints 标记.
   */
  BREAKPOINT_LG = 'lg',
}

export enum ScreenRangeEnum {
  /**
   * 小屏幕设备宽度范围.
   */
  RANGE_SM = '(320vp<=width<600vp)',

  /**
   * 中屏幕设备宽度范围.
   */
  RANGE_MD = '(600vp<=width<840vp)',

  /**
   * 大屏幕设备宽度范围.
   */
  RANGE_LG = '(840vp<=width)',
}

export enum ScreenStorageKeyEnum {

  /**
   * 当前设备的 breakpoints 存储key
   */
  CURRENT_BREAKPOINT = 'currentBreakpoint',
}

export class TabBarPosition {
  static readonly [ScreenSizeEnum.BREAKPOINT_SM]: number = BarPosition.End
  static readonly [ScreenSizeEnum.BREAKPOINT_MD]: number = BarPosition.Start
  static readonly [ScreenSizeEnum.BREAKPOINT_LG]: number = BarPosition.Start
}

export class TabOrientation {
  static readonly [ScreenSizeEnum.BREAKPOINT_SM]: boolean = false
  static readonly [ScreenSizeEnum.BREAKPOINT_MD]: boolean = true
  static readonly [ScreenSizeEnum.BREAKPOINT_LG]: boolean = true
}
