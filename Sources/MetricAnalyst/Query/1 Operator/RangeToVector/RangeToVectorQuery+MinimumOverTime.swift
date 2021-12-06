
public struct MinimumOverTimeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func minimumOverTime<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, MinimumOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, MinimumOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
