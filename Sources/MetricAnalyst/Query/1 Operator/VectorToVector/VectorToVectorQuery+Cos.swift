
public struct CosVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func cos<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, CosVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, CosVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
