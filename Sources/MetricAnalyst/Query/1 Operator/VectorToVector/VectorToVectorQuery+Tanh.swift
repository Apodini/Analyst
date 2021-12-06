
public struct TanhVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func tanh<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, TanhVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, TanhVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
