
public struct AsinhVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func asinh<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, AsinhVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, AsinhVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
