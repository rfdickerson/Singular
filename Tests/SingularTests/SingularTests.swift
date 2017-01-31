import XCTest
@testable import Singular

class SingularTests: XCTestCase {
    
    func testCreate() {
       
        let m = Matrix(3, 3)
        
        XCTAssertEqual(m.get(1,1), 0.0, "Must be zeroed")
        
    }
    
    func testCreateWithArrays() {
        
        let m = Matrix([[1,2,3],[4,5,6],[7,8,9]])
        
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.rows, 3)
    }
    
    func testIdentity() {
        
        let m = Matrix.createIdentity(3)
        
        XCTAssertEqual(m.get(1,2), 0.0, "Must be zeroed")
        XCTAssertEqual(m.get(1,1), 1.0, "Must be one")
        
    }
    
    func testMultiply() {
        
        let m1 = Matrix.createIdentity(3)
        let m2 = Matrix.createIdentity(3)
        
        let m3 = m1 * m2
        
        XCTAssert(m3.get(0,0) == 1)
    }
    
    func testMultiply2() {
        
        let m1 = Matrix([[1,2,3],[4,5,6],[7,8,9]])
        
        let m3 = m1 * m1
        
        XCTAssertEqual(m3.values, [30,66,102,36,81,126,42,96,150])
    }


    static var allTests : [(String, (SingularTests) -> () throws -> Void)] {
        return [
            ("testCreate", testCreate),
        ]
    }
}
