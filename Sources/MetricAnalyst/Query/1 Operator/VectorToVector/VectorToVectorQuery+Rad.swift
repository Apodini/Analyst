
public struct RadianVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func rad<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, RadianVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, RadianVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
