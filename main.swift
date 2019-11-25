var cacheSize = 0
var currentBm: MapBenchmark

// Arrays to store data in
var getLinearPoints: [Int] = []
var getBinaryPoints: [Int] = []
var getHashPoints: [Int] = []

var setLinearPoints: [Int] = []
var setBinaryPoints: [Int] = []
var setHashPoints: [Int] = []

let linGetBm = GetBenchmark(gets: 1000, map: LinearMap<String, String>())
let binGetBm = GetBenchmark(gets: 100000, map: BinaryMap<String, String>())
let hashGetBm = GetBenchmark(gets: 100000, map: HashMap<String, String>(initialArraySize: 10000000))

let linSetBm = SetBenchmark(sets: 100, map: LinearMap<String, String>())
let binSetBm = SetBenchmark(sets: 1000, map: BinaryMap<String, String>())
let hashSetBm = SetBenchmark(sets: 1000, map: HashMap<String, String>(initialArraySize: 10000000))

func testMap(_ operations: Int, _ bm: MapBenchmark, _ indexes: Array<String>? = nil) -> Int {
  print("[INFO] Testing size \(operations)")
  
  if let a = indexes {
    bm.indexes = a
  }
  else { 
    bm.setMapSize(size: operations)
  }
  
  return bm.runTest()
}

for test in stride(from: 100, to: 5000, by: 100) {
  // getLinearPoints.append(testMap(test, linGetBm))
  // getBinaryPoints.append(testMap(test * 100, binGetBm))
  // getHashPoints.append(testMap(test * 100, hashGetBm, binGetBm.indexes))
  setLinearPoints.append(testMap(test, linSetBm))
  setBinaryPoints.append(testMap(test * 100, binSetBm))
  setHashPoints.append(testMap(test * 100, hashSetBm, binSetBm.indexes))
}
print("COLLISIONS \(hashGetBm.map.getNumberCollisions())")
print("****GETS****\nBinary Map: \(getBinaryPoints)\nHash map: \(getHashPoints)\nLinear map: \(getLinearPoints)\n\n****SETS****\nBinary Map: \(setBinaryPoints)\nHash map: \(setHashPoints)\nLinear map: \(setLinearPoints)")