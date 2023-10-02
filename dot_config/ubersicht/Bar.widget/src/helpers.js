import { run } from 'uebersicht'

export function renderBattery ({ batteryPercentage, charging }) {
  if (charging) return ''
  if (batteryPercentage <= 10) return ''
  if (batteryPercentage <= 20) return ''
  if (batteryPercentage <= 30) return ''
  if (batteryPercentage <= 40) return ''
  if (batteryPercentage <= 50) return ''
  if (batteryPercentage <= 60) return ''
  if (batteryPercentage <= 70) return ''
  if (batteryPercentage <= 80) return ''
  if (batteryPercentage <= 90) return ''
  if (batteryPercentage <= 100) return ''
}


export function getCurrentMusicFromMusicApp() {
  return run('')
}
