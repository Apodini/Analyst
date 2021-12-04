
public struct CoshVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func cosh<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, CoshVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, CoshVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
