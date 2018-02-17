//  Copyright © 2018 nrith. All rights reserved.

@testable import SwiftGenius
import XCTest

class GeniusSearchTests: GeniusTestBase {

    func testDecodeSearchResults() {
        GeniusSearchTests.assert(geniusObject(inLocalJsonFileNamed: "get-search-200")!)
    }

    public static func assert(_ searchResponse: GeniusSearch.Response) {
        XCTAssertEqual(searchResponse.meta.status, 200)

        guard let hits = searchResponse.response?.hits else {
            XCTFail("The response is supposed to contain at least one song.")
            return
        }

        XCTAssertEqual(hits.count, 10)
    }

}



