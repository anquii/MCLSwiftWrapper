import XCTest
import MCLSwiftWrapper

final class MCLSwiftWrapperTests: XCTestCase {
    func testGivenImportWrapper_WhenTestIntegration_ThenSuccess() {
        XCTAssertEqual(mclBn_getVersion(), 353)
    }
}
