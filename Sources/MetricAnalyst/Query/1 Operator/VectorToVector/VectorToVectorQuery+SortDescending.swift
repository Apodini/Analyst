
public struct SortDescendingVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func sortDescending<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, SortDescendingVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, SortDescendingVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
