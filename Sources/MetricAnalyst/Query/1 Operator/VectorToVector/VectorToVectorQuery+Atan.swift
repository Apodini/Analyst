
public struct AtanVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func atan<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, AtanVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, AtanVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
