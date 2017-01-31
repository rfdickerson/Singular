import XCTest
@testable import Singular

class SingularTests: XCTestCase {
    
    func testCreate() {
       
        let m = Matrix(3, 3)
        
        XCTAssertEqual(m.get(1,1), 0.0, "Must be zeroed")
        
    }
    
    func testIdentity() {
        
        let m = Matrix.createIdentity(3)
        
        XCTAssertEqual(m.get(1,2), 0.0, "Must be zeroed")
        XCTAssertEqual(m.get(1,1), 1.0, "Must be one")
        
        
    }


    static var allTests : [(String, (SingularTests) -> () throws -> Void)] {
        return [
            ("testCreate", testCreate),
        ]
    }
}
