enum StackError: Error {
    case emptyStack
}

class Stack<T: Comparable> {
    private var buffer:[T] = []

    init() {}

    init(with value: T) {
        self.buffer.append(value)
    }

    convenience init(with array: [T]) {
        self.init()
        self.buffer = array
    }

    func push(_ value: T) {
        self.buffer.append(value)
    }

    func pop() -> T? {
        if !isEmpty {
           return self.buffer.remove(at: self.buffer.count - 1)
        }
        return nil
    }

    func transform(with function: (T) -> T) {
      for i in 0...self.size-1 {
        self.buffer[i] = function(self.buffer[i])
      }
    }

    var isEmpty: Bool {
        return self.size == 0
    }

    var size: Int {
        return self.buffer.count
    }

}

extension Stack: CustomStringConvertible {
    var description: String {
        return "<Stack: Size=\(self.size)>"
    }
}

let stack = Stack<Int>(with: [1, 2, 3, 4])
