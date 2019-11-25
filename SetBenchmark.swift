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
    return generateRandomString(5)
  }

  override func runTest() -> Int {
    timer.startTimer()

    for i in 0..<sets {
      let str = gambleString()
      map.set(str, v: str)
    }
    
    return timer.getTime()
  }
}