enum BinarySearchTreeError: Error {
    case valueDoesNotExist
}

class BinarySearchTree<T: Comparable> {
    var value: T
    let parent: BinarySearchTree<T>?
    var left: BinarySearchTree<T>?
    var right: BinarySearchTree<T>?
    
    init(with value: T) {
        self.parent = nil
        self.left = nil
        self.right = nil
        self.value = value
    }
    
    func insert(_ value: T) {
        if value > self.value {
            guard let rightSubTree = self.right else {
                self.right = BinarySearchTree<T>(with: value)
                return
            }
            rightSubTree.insert(value)
        } else if value < self.value {
            guard let leftSubTree = self.left else {
                self.left = BinarySearchTree<T>(with: value)
                return
            }
            leftSubTree.insert(value)
        }
    }
    
    func search(for value: T) throws -> T {
        if value == self.value {
            return self.value
        } else if value > self.value, let rightSubTree = self.right {
            return try rightSubTree.search(for: value)
        } else if value < self.value, let leftSubTree = self.left {
            return try leftSubTree.search(for: value)
        }
        throw BinarySearchTreeError.valueDoesNotExist
    }
}
