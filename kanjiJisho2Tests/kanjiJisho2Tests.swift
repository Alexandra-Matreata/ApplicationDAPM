//
//  kanjiJisho2Tests.swift
//  kanjiJisho2Tests
//
//  Created by ALABALA on 12/30/14.
//  Copyright (c) 2014 tt. All rights reserved.
//

import UIKit
import XCTest
import kanjiJisho2

class kanjiJisho2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testExample() {
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        self.measureBlock() {
        }
    }
    
    func testCustomVC()
    {
        let obj = CustomVC()
        obj.buttonMake()
    }
    
    func testTVC()
    {
        let obj = TVC()
        obj.traitementSense("sens, alt sens")
        XCTAssert(obj.matches[obj.matches.count - 1] == " alt sens", "Pass")
        
        var elements = NSMutableDictionary()
        
        
        obj.search = "ai"
        obj.searchedNrStrokes = "13"
        
        elements.setObject("愛", forKey: "semn")
        elements.setObject("love, affection, favorite, admire, appreciate", forKey: "translation")
        elements.setObject("-", forKey: "on")
        elements.setObject("ai", forKey: "kun")
        elements.setObject("心", forKey: "radical")
        elements.setObject("13", forKey: "strokes")
        
        obj.dataArray.addObject(elements)
        obj.recherche()
    
        XCTAssert(obj.resultats[0].objectForKey("semn") as NSString == "愛", "Pass")
    }

}
