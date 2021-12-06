
public struct SumOverTimeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func sumOverTime<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, SumOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, SumOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
