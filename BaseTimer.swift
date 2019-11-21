import Foundation

func getCurrentMillis()-> Int64{
  return Int64(NSDate().timeIntervalSince1970 * 1000)
}

class Timer {
  var startTime: Int64 = 0
  var endTime: Int64 = 0

  func startTimer() {
    startTime = getCurrentMillis()
  }

  func stopTimer() {
    endTime = getCurrentMillis()
  }

  func getTime(_ endTimer: Bool = true) -> Int {
    if endTimer {self.stopTimer()}
    return Int(endTime - startTime)
  }
}

class PlotTimer : Timer, CustomStringConvertible {
  var points: [Int] = [0]

  func plotPoint(_ endTimer: Bool = true) {
    if endTimer {self.stopTimer()}
    let lastValue = points.count > 1 ? points[points.count - 1] : 0
    points.append(lastValue + self.getTime())
  }

  func getPoints() -> [Int] {
    return points
  }

  func reset() {
    points = [0]
  }

  var description: String {
    var s = ""
    for point in points {
      s += "\(point) "
    }

    return s
  }
}
