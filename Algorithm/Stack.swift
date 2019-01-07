//
//  Stack.swift
//  Algorithm
//
//  Created by great Lock on 2018/12/9.
//  Copyright © 2018 great Lock. All rights reserved.
//

import Foundation

protocol Stack {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var size: Int { get }
    var peek: Element? { get }
    mutating func push(_ newEelement: Element)
    mutating func pop() -> Element?
}

struct IntegerStack: Stack {
    typealias Element = Int
    
    var isEmpty: Bool { return stack.isEmpty }
    var size: Int { return stack.count }
    var peek: Int? { return stack.last }
    
    private var stack = [Element]()
    mutating func push(_ newEelement: Int) {
        self.stack.append(newEelement)
    }
    
    mutating func pop() -> Int? {
        return self.stack.popLast()
    }
}

protocol Queue {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var size: Int { get }
    var peek: Element? { get }
    
    mutating func enqueue(_ newElement: Element)
    mutating func dequeue() -> Element?
}

struct IntegerQueue: Queue {
    typealias Element = Int
    
    var isEmpty: Bool { return left.isEmpty && right.isEmpty }
    var size: Int { return left.count + right.count }
    var peek: Int? { return left.isEmpty ? right.last : left.last }
    
    private var left = [Element]()
    private var right = [Element]()
    
    mutating func enqueue(_ newElement: Element) {
        self.right.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        if left.isEmpty {
            self.left = right.reversed()
            self.right.removeAll()
        }
        return left.popLast()
    }
}


struct MyQueue {
    var peek: Int? {
        mutating get {
            self.shift();
            return stackB.peek
        }
    }
    
    typealias Element = Int
    
    var stackA: IntegerStack
    var stackB: IntegerStack
    var isEmpty: Bool {
        return stackA.isEmpty && stackB.isEmpty
    }

    
    var size: Int {
        get {
            return stackA.size + stackB.size
        }
    }
    
    init() {
        stackA = IntegerStack()
        stackB = IntegerStack()
    }
    
    fileprivate mutating func shift() {
        if stackB.isEmpty {
            while !stackA.isEmpty {
                self.stackB.push(stackA.pop()!)
            }
        }
    }
    
    mutating func enqueue(_ newElement: Int) {
        stackA.push(newElement)
    }
    
    mutating func dequeue() -> Int? {
        shift()
        return stackB.pop()
    }
    
}


struct PathExample {
    func simplifyPath(path: String) -> String {
        var pathStack = [String]()
        let paths = path.components(separatedBy: "/")
        
        for path in paths {
            guard path != "." else {
                continue
            }
            
            if path == ".." {
                if (pathStack.count > 0) {
                    pathStack.removeLast()
                }
            }else if path != "" {
                pathStack.append(path)
            }
        }
        let res = pathStack.reduce("") { total, dir in "\(total)/\(dir)" }
        return res;
    }
}
