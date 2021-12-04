
public struct AcosVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func acos<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, AcosVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, AcosVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
