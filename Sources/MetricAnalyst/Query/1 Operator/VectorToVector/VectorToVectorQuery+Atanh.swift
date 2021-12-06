
public struct AtanhVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func atanh<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, AtanhVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, AtanhVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
