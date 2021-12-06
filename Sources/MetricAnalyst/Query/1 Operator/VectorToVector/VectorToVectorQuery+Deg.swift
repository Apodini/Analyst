
public struct DegreeVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func deg<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, DegreeVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, DegreeVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
