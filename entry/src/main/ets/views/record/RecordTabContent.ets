import RecordVO from '../../viewmodel/RecordVO'
import RecordList from './RecordList'
import RecordStatsCard from './RecordStatsCard'
import SearchHeader from './SearchHeader'

@Component
export default struct RecordTabContent {
  @Provide records: RecordVO[] = []

  build() {
    Column() {
      SearchHeader()
      RecordStatsCard()
      RecordList()
    }
    .height('100%')
    .padding(10)
  }
}