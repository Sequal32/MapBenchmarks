let chars: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

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

  func appendToMapNative(size: Int) {
    for i in 0..<size {
      let str = generateRandomString(10)
      map.set(str, v:str)
      indexes.append(str)
    }
  }

  func appendToMap(size: Int) {
    indexes.reserveCapacity(indexes.count + size)

    for _ in 0..<size {
      indexes.append(generateRandomString(10))
    }
    if map is BinaryMap {indexes.sort()}

    map.setArrays(kArray: indexes, vArray: &indexes)
  }

  func setMapSize(size: Int, overrideNative: Bool = false) {
    // Need to use set function as HashMap has collisions
    if (map is HashMap || map is HashMapArray) && !overrideNative {
      appendToMapNative(size: size)
      return
    }

    appendToMap(size: max(0, size-indexes.count))
  }

  // Test func

  func runTest() -> Int {
    return 0
  }
}