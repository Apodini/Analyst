
public struct OffsetVectorToVectorOperator<Interval: TimeInterval>: VectorToVectorOperator {

    // MARK: Stored Properties

    public let interval: Interval

    // MARK: Initialization

    public init(interval: Interval) {
        self.interval = interval
    }

}

extension VectorMetricQuery {

    public func offset<Interval: TimeInterval>(
        by interval: Interval
    ) -> VectorToVectorQuery<Self, OffsetVectorToVectorOperator<Interval>> {
        .init(query: self, operator: .init(interval: interval))
    }

}
