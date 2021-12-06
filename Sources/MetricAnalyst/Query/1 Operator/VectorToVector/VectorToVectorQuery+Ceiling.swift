
public struct CeilingVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func ceil<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, CeilingVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, CeilingVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
