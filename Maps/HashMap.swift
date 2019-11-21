class HashMap<K : Hashable, V> : Map<K, V> {
  var mapCount: Int = 0
  var numberCollisions: Int = 0
  var collisions = LinearMap<K, V>()

  override var count: Int {
    get {
      return mapCount + collisions.count
    }
  }

  override func set(_ k: K, v: V) {
    let index = abs(k.hashValue % values.count)

    switch keys[index] {
      case nil: // If nothing is set, then create a new key & value pair
        keys[index] = k
        values[index] = v
        mapCount += 1
      case let storedKey where storedKey != k: // If the key in the hashmap is not equal to the key being set, put it in collisions
        numberCollisions += 1
        collisions[k] = v
      default: //If the storedkey is equal to the key, replace the value
        values[index] = v
    }
  }

  override func remove(_ k: K) {
    let index = abs(k.hashValue % values.count)

    guard let key = keys[index] else {return}

    if key == k {
      keys[index] = nil
      values[index] = nil
      mapCount -= 1
    } else {
      numberCollisions += 1
      collisions[k] = nil
    }
  }

  override func get(_ k: K) -> V? {
    let index = abs(k.hashValue % values.count)

    guard let key = keys[index] else {return nil}

    if key == k {
      return values[index]
    }
    else {
      numberCollisions += 1
      return collisions[k]
    }
  }

  override func getNumberCollisions() -> Int {
    return numberCollisions
  }

  override var description: String {
    get {
      var valueString: String = "["

      for (index, value) in keys.enumerated() {
        guard let newValue = value else {continue}
        valueString += "\(newValue): \(values[index]!), "
      }

      for (index, value) in collisions.keys.enumerated() {
        valueString += "\(value): \(collisions.values[index]), "
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
    super.init()
    values = Array(repeating: nil, count: initialArraySize)
    keys = Array(repeating: nil, count: initialArraySize)
  }
}