
public struct CountOverTimeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func countOverTime<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, CountOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, CountOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
