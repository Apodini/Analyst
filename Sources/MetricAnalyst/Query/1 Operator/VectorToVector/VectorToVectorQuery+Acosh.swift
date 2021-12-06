
public struct AcoshVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func acosh<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, AcoshVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, AcoshVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
