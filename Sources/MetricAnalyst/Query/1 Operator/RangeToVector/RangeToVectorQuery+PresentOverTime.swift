
public struct PresentOverTimeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func presentOverTime<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, PresentOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, PresentOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
