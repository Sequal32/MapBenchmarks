let chars: String = "abcdefghijklmnopqrstuvwxyz"

func getRandomInt(range: Int) -> Int {
  return Int.random(in: 0..<range)
}

class MapBenchmark {
  let operations: Int
  let timer: Timer = Timer()

  var lMap: LinearMap<String, String>
  var bMap: BinaryMap<String, String>
  var hMap: HashMap<String, String>

  var indexes: [String] = []
  var values: [String] = []

  init(operations: Int) {
    self.operations = operations
    lMap = LinearMap()
    bMap = BinaryMap()
    hMap = HashMap(initialArraySize: operations * 100)
  }

  func generateRandomString(_ length: Int) -> String {
    var s = ""
    for _ in 0..<chars.count {
      s += String(chars.randomElement()!)
    }
    return s
  }

  func appendToMaps(size: Int, includeHash: Bool = true) {
    print("[INFO] Reserving space...")
    indexes.reserveCapacity(indexes.count + size)
    // values.reserveCapacity(values.count + size)

    for _ in 0..<size {
      indexes.append(generateRandomString(10))
      // values.append(generateRandomString(10))
    }
    indexes.sort()

    lMap.setArrays(kArray: indexes, vArray: indexes)
    bMap.setArrays(kArray: indexes, vArray: indexes)
    if includeHash { hMap.setArrays(kArray: indexes, vArray: indexes) }
    print("[INFO] Done reserving!")
  }

  func fillMaps() {
    self.appendToMaps(size: max(0, operations-hMap.count))
  }

  func resetMaps() {
    lMap = LinearMap()
    bMap = BinaryMap()
    hMap = HashMap(initialArraySize: Int(Float(operations) * 0.2))
  }

  // Test superfunc

  func runTest(map: Map<String, String>) -> Int {
    return 0
  }

  // Test benchmarks

  func testLinear() -> Int {
    print("[INFO] Testing Linear")
    return runTest(map: self.lMap)
  }

  func testBinary() -> Int {
    print("[INFO] Testing Binary")
    return runTest(map: self.bMap)
  }

  func testHash() -> Int {
    print("[INFO] Testing Hash")
    return runTest(map: self.hMap)
  }

  func testAll() -> [Int] {
    return [testLinear(), testBinary(), testHash()]
  }
}