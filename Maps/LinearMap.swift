class LinearMap<K: Hashable, V>: Map<K, V> {
  override var count: Int { return keys.count }
  private func linearSearch(_ k: K) -> Int? {
    var index = 0
    for _ in keys {
      if keys[index] == k { return index }
      else { index += 1 }
    }
    return nil
  }

  override func set(_ k: K, v: V) {
    if keys.contains(k) { values[linearSearch(k)!] = v }
    else {
      keys.append(k)
      values.append(v)
    }
  }
  override func remove(_ k: K) {
    if keys.contains(k) {
      keys.remove(at: linearSearch(k)!)
      values.remove(at: linearSearch(k)!)
    } else { fatalError("Key does not exist in map") }
  }
  override func get(_ k: K) -> V? {
    if keys.contains(k) { return values[linearSearch(k)!] }
    return nil
  }
  override var description: String {
    var string = "["
    var index = 0
    while index < count {
      string += "\(keys[index]): \(values[index])"
      index += 1
      if index != count { string += ", " }
    }
    string += "]"
    return string
  }
  override subscript(index: K) -> V? {
    get { return get(index) }
    set(newValue) { set(index, v:newValue!) }
  }
}

