
public struct TanVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func tan<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, TanVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, TanVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
