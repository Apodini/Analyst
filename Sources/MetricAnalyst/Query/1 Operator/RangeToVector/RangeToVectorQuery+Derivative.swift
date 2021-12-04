
public struct DerivativeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func derivative<Query: RangeMetricQuery>(
        of query: Query
    ) -> RangeToVectorQuery<Query, DerivativeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, DerivativeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
