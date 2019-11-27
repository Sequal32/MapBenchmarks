class SetBenchmark : MapBenchmark {
  let sets: Int

  init(sets: Int = 1000, map: Map<String, String>) {
    self.sets = sets
    super.init(map: map)
  }

  func gambleString() -> String {
    if getRandomInt(range: 2) == 1 {
      return indexes[getRandomInt(range: indexes.count)]
    }
    return generateRandomString(10)
  }

  override func runTest() -> Int {
    timer.startTimer()

    for i in 0..<Int(Float(sets) * 0.01) {
      var indexCopy = indexes

      for i in 0..<100 {
        let str = gambleString()
        map.set(str, v: str)
      }

      if map is HashMap || map is HashMapArray {continue}
      map.setArrays(kArray: indexCopy, vArray: &indexCopy)
    }
    
    return timer.getTime()
  }
}