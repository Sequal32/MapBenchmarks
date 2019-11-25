class GetBenchmark : MapBenchmark {
  let gets: Int

  init(gets: Int = 1000, map: Map<String, String>) {
    self.gets = gets

    super.init(map: map)
  }

  override func runTest() -> Int {
    timer.startTimer()
    // Run this 3 times a get the average? array.reduce(0, +)
    for _ in 0..<gets {
      map.get(indexes[getRandomInt(range: indexes.count-1)])
    }
    
    return timer.getTime()
  }
}