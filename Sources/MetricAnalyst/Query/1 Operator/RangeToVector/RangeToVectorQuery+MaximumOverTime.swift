
public struct MaximumOverTimeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func maximumOverTime<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, MaximumOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, MaximumOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
