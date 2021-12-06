
public struct CastScalarToVectorOperator: ScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func vector<Query: ScalarMetricQuery>(
        of query: Query
    ) -> ScalarToVectorQuery<Query, CastScalarToVectorOperator>
        where Self == ScalarToVectorQuery<Query, CastScalarToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
