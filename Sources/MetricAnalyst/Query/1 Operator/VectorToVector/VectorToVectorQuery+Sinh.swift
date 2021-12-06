
public struct SinhVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func sinh<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, SinhVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, SinhVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
