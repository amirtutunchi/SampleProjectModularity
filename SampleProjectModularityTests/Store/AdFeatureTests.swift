@testable import SampleProjectModularity
import XCTest
import ComposableArchitecture

final class AdFeatureTests: XCTestCase {
    func test_store_searchParameterUpdated() {
        let store = TestStore(
            initialState: AdFeature.State(
                searchParameters: SearchParametersModel()
            ),
            reducer: AdFeature()
        )
        
        let newSearchParameter = SearchParametersModel()
        newSearchParameter.filteredText = "test"
        store.send(.searchParameterUpdated(newSearchParameter)) {
            $0.searchParameters = newSearchParameter
        }
    }
}
