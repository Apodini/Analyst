
public struct LastOverTimeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func lastOverTime<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, LastOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, LastOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
