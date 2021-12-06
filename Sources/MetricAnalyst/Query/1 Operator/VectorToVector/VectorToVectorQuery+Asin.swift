
public struct AsinVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func asin<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, AsinVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, AsinVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
