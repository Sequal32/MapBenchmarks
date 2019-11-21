class GetBenchmark : MapBenchmark {
  let gets: Int

  init(operations: Int, gets: Int = 1000) {
    self.gets = gets

    super.init(operations: operations)
  }

  override func runTest(map: Map<String, String>) -> Int {
    timer.startTimer()
    // Run this 3 times a get the average? array.reduce(0, +)
    for _ in 0..<gets {
      map.get(indexes[getRandomInt(range: indexes.count-1)])
    }
    
    return timer.getTime()
  }
}