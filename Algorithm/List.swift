//
//  List.swift
//  Algorithm
//
//  Created by great Lock on 2018/11/14.
//  Copyright © 2018 great Lock. All rights reserved.
//

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
        
        print(removeIndexFromEnd(dummy.head, 2) as Any)
    }
    
    func getLeftList(_ headNode: ListNode?, _ x: Int) -> ListNode? {
        let dummy = ListNode(0)
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
    
    func getRightList(_ headNode: ListNode?, _ x: Int) -> ListNode? {
        let dummy = ListNode(0)
        var pre = dummy, node = headNode
        
        while node != nil {
            if (node!.val > x) {
                pre.next = node
                pre = node!
            }
            
            node = node!.next
        }
        
        pre.next = nil
        return dummy.next
    }
    
    private func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        
        let prevDummy = ListNode(0), postDummy = ListNode(0)
        var prev = prevDummy, post = postDummy
        var node = head
        
        while node != nil {
            if (node!.val < x) {
                prev.next = node
                prev = node!
            }else {
                post.next = node
                post = node!
            }
            node = node!.next
        }
        
        post.next = nil
        
        prev.next = postDummy.next
        
        return prevDummy.next
    }
    
    private func removeIndexFromEnd(_ head: ListNode?, _ index: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        let dummy = ListNode(0)
        var pre: ListNode? = dummy, fastNode: ListNode? = head, slowNode: ListNode? = head, startInde = index + 1
        while fastNode != nil {
            startInde -= 1
            if (startInde <= 0) {
                pre?.next = slowNode
                pre = slowNode
                slowNode = slowNode?.next
            }
            fastNode = fastNode!.next
        }
        pre?.next = pre?.next?.next
        
        return dummy.next
    }
}
