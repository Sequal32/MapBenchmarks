class SetBenchmark : MapBenchmark {
  let sets: Int

  init(sets: Int = 1000, map: Map<String, String>) {
    self.sets = sets
    super.init(map: map)
  }

  override func runTest() -> Int {
    timer.startTimer()
    // Run this 3 times a get the average? array.reduce(0, +)
    for i in 0..<sets {
      let str = generateRandomString(5)
      map.set(str, v: str)
    }
    
    return timer.getTime()
  }
}