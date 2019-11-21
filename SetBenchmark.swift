class SetBenchmark : MapBenchmark {
  let sets: Int

  init(operations: Int, sets: Int = 1000) {
    self.sets = sets
    super.init(operations: operations)
  }

  override func runTest(map: Map<String, String>) -> Int {
    timer.startTimer()
    // Run this 3 times a get the average? array.reduce(0, +)
    for _ in 0..<sets {
      let str = generateRandomString(5)
      map[str] = str
    }
    
    return timer.getTime()
  }
}