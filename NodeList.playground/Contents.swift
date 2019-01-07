import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class List {
    var head: ListNode?
    var tail: ListNode?
    
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        }else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    
    func appendToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        }else {
            let tmp = ListNode(val)
            tmp.next = head
            head = tmp
        }
    }
}


class ListTest {
    init() {
        let dummy = List()
        dummy.appendToTail(1)
        dummy.appendToTail(5)
        dummy.appendToTail(3)
        dummy.appendToTail(2)
        dummy.appendToTail(4)
        dummy.appendToTail(2)
        
        print(getLeftList(dummy.head, 3)!)
    }
    
    func getLeftList(_ headNode: ListNode?, _ x: Int) -> ListNode? {
        var dummy = ListNode(0)
        var pre = dummy, node = headNode
        
        while node != nil {
            if (node!.val < x) {
                pre.next = node
                pre = node!
            }
            node = node!.next
        }
        
        pre.next = nil
        return dummy.next
    }
}

ListTest()
