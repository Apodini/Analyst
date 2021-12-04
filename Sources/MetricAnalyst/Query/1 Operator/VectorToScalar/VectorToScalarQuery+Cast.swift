
public struct CastVectorToScalarOperator: VectorToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func scalar<Query: VectorMetricQuery>(
        of query: Query
    ) -> VectorToScalarQuery<Query, CastVectorToScalarOperator>
        where Self == VectorToScalarQuery<Query, CastVectorToScalarOperator> {
        .init(query: query, operator: .init())
    }

}
