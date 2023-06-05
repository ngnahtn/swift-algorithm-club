// 1
public class Node<T> {
  // 2
  var value: T
  var next: Node<T>?
  weak var previous: Node<T>?

  // 3
  init(value: T) {
    self.value = value
  }
}

public class LinkedList<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        // create newNode instance
        let newNode = Node(value: value)
        // check if linkedList already have tail
        if let tailNode = self.tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        // set newNode as tail
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
      // 1
      if index >= 0 {
        var node = head
        var i = index
        // 2
        while let noedee = node {
          if i == 0 { return node }
          i -= 1
          node = noedee.next
        }
      }
      // 3
      return nil
    }
    
    public func nodeAtMiddle() -> Node<T>? {
        guard head != nil  else { return nil }
        var slow = head
        var fast = head
        
        while (fast != nil && fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    public func remove(node: Node<T>) {
        var previous = node.previous
        var next = node.next
        
        if let pre = previous {
            pre.next = node.next
        } else {
            head = next
        }
        next?.previous = previous
        
        if tail == nil {
            tail = previous
        }
        
        node.previous = nil
        node.next = nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
            
            while let nodee = node {
              text += "\(nodee.value)"
              node = nodee.next
              if node != nil { text += ", " }
            }
        return text + "]"
    }
}

let dogBreeds = LinkedList<String>()
dogBreeds.append(value: "Labrador")
dogBreeds.append(value: "Bulldog")
dogBreeds.append(value: "Beagle")
dogBreeds.append(value: "Husky")
dogBreeds.append(value: "TuanGa")

print(dogBreeds)

dogBreeds.remove(node: dogBreeds.nodeAt(index: 3)!)
