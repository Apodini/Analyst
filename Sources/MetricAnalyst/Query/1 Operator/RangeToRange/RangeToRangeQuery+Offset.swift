
public struct OffsetRangeToRangeOperator<Interval: TimeInterval>: RangeToRangeOperator {

    // MARK: Stored Properties

    public let interval: Interval

    // MARK: Initialization

    public init(interval: Interval) {
        self.interval = interval
    }

}

extension RangeMetricQuery {

    public func offset<Interval: TimeInterval>(
        by interval: Interval
    ) -> RangeToRangeQuery<Self, OffsetRangeToRangeOperator<Interval>> {
        .init(query: self, operator: .init(interval: interval))
    }

}
