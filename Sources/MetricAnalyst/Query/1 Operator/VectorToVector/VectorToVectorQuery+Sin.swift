
public struct SinVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func sin<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, SinVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, SinVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
