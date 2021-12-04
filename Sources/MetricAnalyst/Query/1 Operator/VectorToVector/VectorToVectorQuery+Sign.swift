
public struct SignVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func sign<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, SignVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, SignVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
