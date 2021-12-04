
public struct StandardDeviationOverTimeRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func standardDeviationOverTime<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, StandardDeviationOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, StandardDeviationOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
