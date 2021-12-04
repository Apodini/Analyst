
public struct AbsoluteValueVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func abs<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, AbsoluteValueVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, AbsoluteValueVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
