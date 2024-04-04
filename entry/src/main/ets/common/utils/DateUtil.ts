export default class DateUtil {
  // from '3/30/2024' to '2024/3/30/'
  static formatDateString(str: string) {
    const dataStringArr = str.split('/')

    if (dataStringArr[0].length !== 4) {
      str = `${dataStringArr[2]}/${dataStringArr[0]}/${dataStringArr[1]}`
    }

    return str
  }

  // deprecated since 2024/3/26
  static formatDate(num: number): string {
    let date = new Date(num)
    let year = date.getFullYear()
    let month = date.getMonth() + 1
    let day = date.getDate()
    let m = month < 10 ? '0' + month : month
    let d = day < 10 ? '0' + day : day

    return `${year}/${m}/${d}`
  }

  static beginTimeOfDay(date: Date) {
    let d = new Date(date.getFullYear(), date.getMonth(), date.getDate())
    return d.getTime()
  }
}