internal class Node<Key: Comparable> {
  let key: Key
  var next: Node<Key>? = nil
  weak var previous: Node<Key>? = nil

  init(with key: Key) {
    self.key = key
  }
}

public class LinkedList<Element: Comparable> {
  private var head: Node<Element>?
  private var count: Int = 0

  init() {}

  convenience init(with list: [Element]) {
    for item in list {
        self.insert(item)
    }
  }

  public func insert(_ value: Element) {
    let newNode = Node(with: value)
    guard var currentNode = self.head else {
      self.head = newNode
      self.head?.previous = self.head
      count += 1
      return
    }

    while currentNode.next != nil {
      currentNode = currentNode.next!
    }
    newNode.previous = currentNode
    currentNode.next = newNode
    count += 1
  }

  public var size: Int {
    return self.count
  }

  public var isEmpty: Bool {
    return self.count == 0
  }

  public subscript(index: Int) -> Element {
    get {
      assert(index <= self.size - 1, "Index out of range")

      var currentNode = self.head
      var counter = 0
      while counter < index {
        currentNode = currentNode?.next
        counter += 1
      }
      return currentNode!.key
    }
  }
}

var list = LinkedList(with: [8, 4, 1, 6])
print(list[5])
