
public struct StandardVarianceOverTimeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func standardVarianceOverTime<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, StandardVarianceOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, StandardVarianceOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
