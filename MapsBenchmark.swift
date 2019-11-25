let chars: String = "abcdefghijklmnopqrstuvwxyz"

func getRandomInt(range: Int) -> Int {
  return Int.random(in: 0..<range)
}

class MapBenchmark {
  let timer: Timer = Timer()

  let map: Map<String, String>

  var indexes: [String] = []
  var values: [String] = []

  init(map: Map<String, String>) {
    self.map = map
  }

  func generateRandomString(_ length: Int) -> String {
    var s = ""
    for _ in 0..<chars.count {
      s += String(chars.randomElement()!)
    }
    return s
  }

  func appendToMap(size: Int) {
    print("[INFO] Reserving space...")
    indexes.reserveCapacity(indexes.count + size)
    // values.reserveCapacity(values.count + size)

    for _ in 0..<size {
      indexes.append(generateRandomString(10))
    }
    if map is BinaryMap {indexes.sort()}

    map.setArrays(kArray: indexes, vArray: &indexes)
    print("[INFO] Done reserving!")
  }

  func setMapSize(size: Int) {
    appendToMap(size: max(0, size-indexes.count))
  }

  // Test func

  func runTest() -> Int {
    return 0
  }
}