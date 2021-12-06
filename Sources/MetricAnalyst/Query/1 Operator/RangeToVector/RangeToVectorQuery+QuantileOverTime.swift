
public struct QuantileOverTimeRangeToVectorOperator: RangeToVectorOperator {

    public let value: Double

    public init(value: Double) {
        self.value = value
    }
}

extension MetricQuery  {

    public static func quantileOverTime<Query: RangeMetricQuery>(
        _ value: Double,
        _ query: Query
    ) -> RangeToVectorQuery<Query, QuantileOverTimeRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, QuantileOverTimeRangeToVectorOperator> {
        .init(query: query, operator: .init(value: value))
    }

}
