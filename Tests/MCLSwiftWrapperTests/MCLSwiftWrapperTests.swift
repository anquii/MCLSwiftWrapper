import XCTest
import MCLSwiftWrapper

final class MCLSwiftWrapperTests: XCTestCase {
    private static let curveType = Int32(MCL_BLS12_381)
    private static let compilationTime = Int32(MCLBN_FR_UNIT_SIZE * 10 + MCLBN_FP_UNIT_SIZE)

    func testWhenGetVersion_ThenEqual161() {
        XCTAssertEqual(mclBn_getVersion(), 0x161)
    }

    func testGivenInit_WhenGetOpUnitSize_ThenEqual6() {
        mclBn_init(Self.curveType, Self.compilationTime)
        XCTAssertEqual(mclBn_getOpUnitSize(), 6)
    }

    func testGivenInit_WhenGetG1ByteSize_ThenEqual48() {
        mclBn_init(Self.curveType, Self.compilationTime)
        XCTAssertEqual(mclBn_getG1ByteSize(), 48)
    }

    func testGivenInit_WhenGetFpByteSize_ThenEqual48() {
        mclBn_init(Self.curveType, Self.compilationTime)
        XCTAssertEqual(mclBn_getFpByteSize(), 48)
    }

    func testGivenInit_WhenGetFrByteSize_ThenEqual32() {
        mclBn_init(Self.curveType, Self.compilationTime)
        XCTAssertEqual(mclBn_getFrByteSize(), 32)
    }

    func testGivenCurveType_AndCompilationTime_WhenInit_ThenSuccess() {
        let result = mclBn_init(Self.curveType, Self.compilationTime)
        XCTAssertEqual(result, 0)
    }

    func testGivenInvalidCurveType_WhenInit_ThenFailure() {
        let curveType = Int32(-1)
        let result = mclBn_init(curveType, Self.compilationTime)
        XCTAssertNotEqual(result, 0)
    }

    func testGivenInvalidCompilationTime_WhenInit_ThenFailure() {
        let compilationTime = Int32(0)
        let result = mclBn_init(Self.curveType, compilationTime)
        XCTAssertNotEqual(result, 0)
    }

    func testGivenInit_WithBLS12381CurveType_AndGetCurveType_ThenBLS12381() {
        mclBn_init(Self.curveType, Self.compilationTime)
        XCTAssertEqual(mclBn_getCurveType(), Self.curveType)
    }

    func testGivenInit_WithBLS12381CurveType_WhenGetETHSerializationMode_ThenDisabled() {
        mclBn_init(Self.curveType, Self.compilationTime)
        XCTAssertEqual(mclBn_getETHserialization(), 0)
    }

    func testGivenInit_WithBLS12381CurveType_WhenEnableETHSerializationMode_AndGetETHSerializationMode_ThenEnabled() {
        let mode = Int32(1)
        mclBn_init(Self.curveType, Self.compilationTime)
        mclBn_setETHserialization(mode)
        XCTAssertEqual(mclBn_getETHserialization(), 1)
    }

    func testGivenSupportedMode_WhenSetMapToMode_ThenSuccess() {
        let mode = Int32(MCL_MAP_TO_MODE_HASH_TO_CURVE_07)
        let result = mclBn_setMapToMode(mode)
        XCTAssertEqual(result, 0)
    }

    func testGivenUnsupportedMode_WhenSetMapToMode_ThenFailure() {
        let mode = Int32(MCL_MAP_TO_MODE_HASH_TO_CURVE_06)
        let result = mclBn_setMapToMode(mode)
        XCTAssertEqual(result, -1)
    }
}
