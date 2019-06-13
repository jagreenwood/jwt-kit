#if !canImport(ObjectiveC)
import XCTest

extension JWTKitTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__JWTKitTests = [
        ("testExpirationDecoding", testExpirationDecoding),
        ("testExpirationEncoding", testExpirationEncoding),
        ("testExpired", testExpired),
        ("testParse", testParse),
        ("testRSA", testRSA),
        ("testSigners", testSigners),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(JWTKitTests.__allTests__JWTKitTests),
    ]
}
#endif
