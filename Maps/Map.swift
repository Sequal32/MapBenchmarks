class Map<K: Hashable, V>: CustomStringConvertible {
  var keys: [K?] = []
  var values: [V?] = []

  func getNumberCollisions() -> Int {return 0}
  func set(_ k: K, v: V) {return}
  func remove(_ k: K) {return}
  func get(_ k: K)-> V? {return nil}
  // Helper function to immedietly set arrays w/o any checks
  func setArrays(kArray: inout Array<K>, vArray: Array<V>) {
    keys = kArray
    values = vArray
  }

  var count: Int {return 0}
  subscript(index: K) -> V? {set {} get {return nil} }
  var description: String {return "[]"}
}