
public struct AverageOverTimeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func averageOverTime<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, AverageOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, AverageOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
