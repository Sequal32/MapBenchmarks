class BinaryMap<K : Comparable & Hashable, V> : Map<K, V> {
  private enum SearchResult {
    case found(Int)
    case nearest(Int)
  }

  // Courtesy of @raywenderlich on github, modified by me
  private func binarySearch(_ key: K) -> SearchResult {
      var lowerBound = 0
      var upperBound = keys.count
      while lowerBound < upperBound {
          let midIndex = lowerBound + (upperBound - lowerBound) / 2
          if keys[midIndex]! == key {
              return .found(midIndex)
          } else if keys[midIndex]! < key {
              lowerBound = midIndex + 1
          } else {
              upperBound = midIndex
          }
      }
      return .nearest(lowerBound)
  }

  override func set(_ k: K, v: V) {
    switch binarySearch(k) {
      case .found(let index):
        values[index] = v
      case .nearest(let index):
        keys.insert(k, at: index)
        values.insert(v, at: index)
    }
  }

  override func remove(_ k: K) {
   if case .found(let index) = binarySearch(k) {
      keys.remove(at: index)
      values.remove(at: index)
   }
  }

  override func get(_ k: K) -> V? {
    if case .found(let index) = binarySearch(k) {
      return values[index]
    }
    return nil
  }

  override var count: Int {return keys.count}

  override var description: String {
    get {
      var valueString: String = "["

      for (index, value) in keys.enumerated() {
        valueString += "\(value): \(values[index])"
        // Append whitespace & comma for next element if this is not the last element
        valueString += index + 1 >= self.count ? "]" : ", "
      }

      return valueString
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
}