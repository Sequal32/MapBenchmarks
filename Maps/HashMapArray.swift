class HashMapArray<K : Hashable, V> : Map<K, V> {
  var keyArray: [[K]]
  var valueArray: [[V]]

  var mapCount: Int = 0
  var numberCollisions: Int = 0

  override var count: Int {
    get {
      return mapCount
    }
  }

  func getHashValue(_ k: K) -> Int {
    return abs(k.hashValue % keyArray.count)
  }


  override func set(_ k: K, v: V) {
    let index = getHashValue(k)
    // If the key does not exist in the key array then append a new value

    guard let valueIndex = keyArray[index].firstIndex(of: k) else {
      keyArray[index].append(k)
      valueArray[index].append(v)

      return
    }

    // Otherwise overwrite it
    keyArray[index][valueIndex] = k
    valueArray[index][valueIndex] = v
  }

  override func get(_ k: K) -> V? {
    let index = getHashValue(k)

    guard let valueIndex = keyArray[index].firstIndex(of: k) else {return nil}

    return valueArray[index][valueIndex]
  }

  override func getNumberCollisions() -> Int {
    return numberCollisions
  }

  override var description: String {
    get {
      var valueString: String = "["

      for (index, array) in keyArray.enumerated() {
        for (keyIndex, key) in array.enumerated() {
          valueString += "\(key): \(valueArray[index][keyIndex]), "
        }
      }
      // Cleanly add a bracket to the end by substringing the hanging comma O(n)
      return "\(valueString.prefix(valueString.count - 2))]"
    }
  }

  override subscript(index: K) -> V? {
    get {
      return self.get(index)
    }
    set {
      newValue == nil ? self.remove(index) : self.set(index, v: newValue!)
    }
  }

  init(initialArraySize: Int = 100) {
    keyArray = Array(repeating: Array<K>(), count: initialArraySize)
    valueArray = Array(repeating: Array<V>(), count: initialArraySize)
    super.init()
  }
}