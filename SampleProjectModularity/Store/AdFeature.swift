import ComposableArchitecture

struct AdFeature: ReducerProtocol {
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.EffectTask<Action> {
        switch action {
        case let .searchParameterUpdated(newSearchParameters):
            state.searchParameters = newSearchParameters
            return .none
        }
    }
    
    struct State: Equatable {
        var searchParameters: SearchParametersModel
    }
    
    enum Action: Equatable {
        case searchParameterUpdated(SearchParametersModel)
    }
}
