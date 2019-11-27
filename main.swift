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
let hashGetBm = GetBenchmark(     gets: 100000,  map: HashMap<String, String>(     initialArraySize: 100000000))

let linSetBm = SetBenchmark(      sets: 100,  map: LinearMap<String, String>())
let binSetBm = SetBenchmark(      sets: 1000,  map: BinaryMap<String, String>())
let hashSetBm = SetBenchmark(     sets: 1000, map: HashMap<String, String>(     initialArraySize: 100000000))

// Extra credit collisions
let hashGetBm = GetBenchmark(     gets: 100000,  map: HashMap<String, String>(     initialArraySize: 10000))
let hashSetBm = SetBenchmark(     sets: 1000, map: HashMap<String, String>(     initialArraySize: 10000)
let hashArraySetBm = SetBenchmark(sets: 1000, map: HashMapArray<String, String>(  initialArraySize: 10000))  
let hashArrayGetBm = GetBenchmark(gets: 100000,  map: HashMapArray<String, String>(initialArraySize: 10000))

func testMap(_ operations: Int, _ bm: MapBenchmark, overrideNative: Bool = false) -> Int {
  print("[INFO] Testing size \(operations)")
  
  bm.setMapSize(size: operations, overrideNative: overrideNative)
  
  return bm.runTest()
}

for test in stride(from: 100, to: 5000, by: 100) {
  let bigTest = test * 10
  print("test linear")
  getLinearPoints.append(testMap(test, linGetBm, overrideNative: true))
  print("test hash")
  getHashPoints.append(testMap(bigTest, hashGetBm, overrideNative: true))
  print("test binary")
  getBinaryPoints.append(testMap(bigTest, binGetBm))
  print("test linear")
  setLinearPoints.append(testMap(test, linSetBm, overrideNative: true))
  print("test hash")
  setHashPoints.append(testMap(bigTest, hashSetBm))
  print("test binary")
  setBinaryPoints.append(testMap(bigTest, binSetBm))

  print("COLLISIONS \(hashSetBm.map.getNumberCollisions())")
  

  // EXTRA CREDIT TESTING //
  print("test ehash")
  getHashPoints.append(testMap(test, hashGetBm))
  print("test ehasharray")
  getHashArrayPoints.append(testMap(test, hashArrayGetBm))
  print("test ehash")
  setHashPoints.append(testMap(test, hashSetBm))
  print("test ehasharray")
  setHashArrayPoints.append(testMap(test, hashArraySetBm))
  print("COLLISIONS \(hashArraySetBm.map.getNumberCollisions())")
}
// print("COLLISIONS \(hashGetBm.map.getNumberCollisions())")
print("****GETS****\nLinear map: \(getLinearPoints)\nBinary Map: \(getBinaryPoints)\nHash map: \(getHashPoints)\nHash Map Array: \(getHashArrayPoints)\n\n****SETS****\nLinear map: \(setLinearPoints)\nBinary Map: \(setBinaryPoints)\nHash map: \(setHashPoints)\nHash Map Array: \(setHashArrayPoints)")