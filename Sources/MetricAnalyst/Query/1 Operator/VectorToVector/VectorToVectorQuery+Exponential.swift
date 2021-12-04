
public struct ExponentialVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func exp<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, ExponentialVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, ExponentialVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
