
public struct RateRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func rate<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, RateRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, RateRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
