//
//  BinarySearchTreeTest.swift
//  DStructs-Swift
//
//  Created by Daniel Santos on 2/22/17.
//  Copyright © 2017 Daniel Santos. All rights reserved.
//

import XCTest
import GameKit

class BinarySearchTreeTest: XCTestCase {
    
    /// Test initializer of BST
    func testInit() {
        let bst = BinarySearchTree<Int>(with: 4)
        bst.insert(9)
        bst.insert(2)
        
        XCTAssertEqual(try bst.search(for: 9), 9)
        XCTAssertEqual(try bst.search(for: 2), 2)
    }
    
    /// Test insert method of the BST
    func testInsert() {
        let bst = BinarySearchTree<Int>(with: 6)
        
        bst.insert(10)
        bst.insert(28)
        bst.insert(3)
        bst.insert(-43)
        
        XCTAssertEqual(try bst.search(for: -43), -43)
        XCTAssertEqual(try bst.search(for: 10), 10)
        XCTAssertEqual(try bst.search(for: 28), 28)
        XCTAssertEqual(try bst.search(for: 3), 3)
    }
    
    /// Test search method of the BST
    func testSearch() {
        let bst = BinarySearchTree<Int>(with: 6)
        
        bst.insert(10)
        bst.insert(28)
        bst.insert(3)
        bst.insert(-43)
    
        XCTAssertEqual(try bst.search(for: -43), -43)
        XCTAssertEqual(try bst.search(for: 10), 10)
        XCTAssertEqual(try bst.search(for: 28), 28)
        XCTAssertEqual(try bst.search(for: 3), 3)
    
        XCTAssertThrowsError(try bst.search(for: 23))
    }

    /// Measure the time for inserting 100 random generated number
    func testInsertionPerformance() {
        let bst = BinarySearchTree<Int>(with: 4)
        let randomGenerator = GKRandomSource.sharedRandom()
        self.measure {
            for _ in 1...100 {
                bst.insert(randomGenerator.nextInt(upperBound: 100))
            }
        }
    }

}
