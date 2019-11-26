var cacheSize = 0
var currentBm: MapBenchmark

// Arrays to store data in
var getLinearPoints: [Int] = []
var getBinaryPoints: [Int] = []
var getHashPoints: [Int] = []
var getHashArrayPoints: [Int] = []

var setLinearPoints: [Int] = []
var setBinaryPoints: [Int] = []
var setHashPoints: [Int] = []
var setHashArrayPoints: [Int] = []

let linGetBm = GetBenchmark(      gets: 1000,   map: LinearMap<String, String>())
let binGetBm = GetBenchmark(      gets: 100000, map: BinaryMap<String, String>())
let hashGetBm = GetBenchmark(     gets: 10000,  map: HashMap<String, String>(     initialArraySize: 100000))
let hashArrayGetBm = GetBenchmark(gets: 10000,  map: HashMapArray<String, String>(initialArraySize: 100000))

let linSetBm = SetBenchmark(      sets: 100,  map: LinearMap<String, String>())
let binSetBm = SetBenchmark(      sets: 1000, map: BinaryMap<String, String>())
let hashSetBm = SetBenchmark(     sets: 1000, map: HashMap<String, String>(       initialArraySize: 100000))
let hashArraySetBm = SetBenchmark(sets: 1000, map: HashMapArray<String, String>(  initialArraySize: 100000))  

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
  let bigTest = test * 100
  // getLinearPoints.append(testMap(test, linGetBm))
  // getBinaryPoints.append(testMap(test * 100, binGetBm))
  // getHashPoints.append(testMap(test * 100, hashGetBm, binGetBm.indexes))
  
  // setLinearPoints.append(testMap(test, linSetBm))
  // setBinaryPoints.append(testMap(test * 100, binSetBm))
  // setHashPoints.append(testMap(test * 100, hashSetBm, binSetBm.indexes))
  

  // EXTRA CREDIT TESTING //
  getHashPoints.append(testMap(test, hashGetBm))
  getHashArrayPoints.append(testMap(test, hashArrayGetBm, hashGetBm.indexes))
  
  setHashPoints.append(testMap(test, hashSetBm, hashGetBm.indexes))
  setHashArrayPoints.append(testMap(test, hashArraySetBm, hashGetBm.indexes))
}
// print("COLLISIONS \(hashGetBm.map.getNumberCollisions())")
print("****GETS****\nLinear map: \(getLinearPoints)\nBinary Map: \(getBinaryPoints)\nHash map: \(getHashPoints)\nHash Map Array: \(getHashArrayPoints)\n\n****SETS****\nLinear map: \(setLinearPoints)\nBinary Map: \(setBinaryPoints)\nHash map: \(setHashPoints)\nHash Map Array: \(setHashArrayPoints)")