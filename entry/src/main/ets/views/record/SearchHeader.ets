@Component
export default struct SearchHeader {
  build() {
    Row({ space: 5 }) {
      Search({ placeholder: '搜索饮食或运动信息' })
        .layoutWeight(1)
      Badge({ count: 1, position: BadgePosition.RightTop, style: {} }) {
        Image($r('app.media.ic_public_email'))
          .width(24)
      }
    }
  }
}