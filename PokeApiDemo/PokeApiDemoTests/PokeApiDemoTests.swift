//
//  PokeApiDemoTests.swift
//  PokeApiDemoTests
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import XCTest
@testable import PokeApiDemo

class PokeApiDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSimple() throws {
        let util = Util()
        let number = util.getIdPoke(url: "https://pokeapi.co/api/v2/pokemon/7")
        
        XCTAssertEqual(number, 7, "Is correct")
    }

}
