
public struct SquareRootVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func sqrt<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, SquareRootVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, SquareRootVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
