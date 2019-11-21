var cacheSize = 0

// Arrays to store data in
var linearPoints: [Int] = []
var binaryPoints: [Int] = []
var hashPoints: [Int] = []

func testOperations(_ operations: Int) {
  let bm = SetBenchmark(operations: 10000000, sets: 10000)
  print("[INFO] Size of array: \(operations) 10000 Gets")

  // bm.appendToMaps(size: operations-cacheSize)

  binaryPoints.append(bm.testBinary())
  hashPoints.append(bm.testHash())

  cacheSize = operations
}

func testLinearOperations(_ operations: Int) {
  let bm = GetBenchmark(operations: 1000, gets: 500)
  cacheSize = 0

  print("[INFO] Size of array: \(operations) 500 Gets")

  bm.appendToMaps(size: operations-cacheSize)
  linearPoints.append(bm.testLinear())

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

for test in hashBinaryTest {
  testOperations(test)
}
print("Final Results:\nBinary Map: \(binaryPoints)\nHash map: \(hashPoints)\nLinear map: \(linearPoints)")
// for test in 1...14 {
//   testLinearOperations(test * 100)
// }

// print("Linear map: \(linearPoints)")