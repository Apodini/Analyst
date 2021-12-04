
public struct SortAscendingVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func sort<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, SortAscendingVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, SortAscendingVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
