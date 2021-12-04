
public struct IntervalVectorToRangeOperator<Interval: TimeInterval>: VectorToRangeOperator {

    public let interval: Interval

    public init(interval: Interval) {
        self.interval = interval
    }

}

extension MetricQuery {

    public static func interval<Query: VectorMetricQuery, Interval: TimeInterval>(
        _ interval: Interval,
        query: Query
    ) -> VectorToRangeQuery<Query, IntervalVectorToRangeOperator<Interval>>
        where Self == VectorToRangeQuery<Query, IntervalVectorToRangeOperator<Interval>>
    {
        .init(query: query, operator: .init(interval: interval))
    }

}

extension VectorQuery {

    public subscript<Interval: TimeInterval>(_ interval: Interval) -> VectorToRangeQuery<Self, IntervalVectorToRangeOperator<Interval>> {
        .init(query: self, operator: .init(interval: interval))
    }

}

extension String {

    public subscript<Interval: TimeInterval>(_ interval: Interval) -> VectorToRangeQuery<Self, IntervalVectorToRangeOperator<Interval>> {
        .init(query: self, operator: .init(interval: interval))
    }

}

extension Metric {

    public subscript<Interval: TimeInterval>(_ interval: Interval) -> VectorToRangeQuery<Self, IntervalVectorToRangeOperator<Interval>> {
        .init(query: self, operator: .init(interval: interval))
    }

}
