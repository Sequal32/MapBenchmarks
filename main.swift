var cacheSize = 0

// Arrays to store data in
var linearPoints: [Int] = []
var binaryPoints: [Int] = []
var hashPoints: [Int] = []

let gbm = GetBenchmark(operations: 100000, gets: 10000)
let sbm = SetBenchmark(operations: 100000, sets: 1000)

func testGets() {
  
}

func testMaps(_ operations: Int) {
  print("[INFO] Size of maps: \(operations)")

  gbm.appendToMaps(size: operations-cacheSize)
  sbm.appendToMaps(size: operations-cacheSize)

  binaryPoints.append(gbm.testBinary())
  hashPoints.append(sbm.testHash())

  cacheSize = operations
}

let hashBinaryTest: [Int] = [
  100000,
  200000,
  300000,
  400000,
  500000,
  600000,
  700000,
  800000,
  900000,
  1000000,
  2000000,
  3000000,
  4000000,
  5000000,
  6000000,
  7000000,
  8000000,
  9000000,
  10000000
]

for test in 1...100 {
  testMaps(test * 1000)
}
print("Final Results:\nBinary Map: \(binaryPoints)\nHash map: \(hashPoints)\nLinear map: \(linearPoints)")
// for test in 1...14 {
//   testLinearOperations(test * 100)
// }

// print("Linear map: \(linearPoints)")