
public struct OpenSubqueryVectorToRangeOperator<Duration: TimeInterval>: VectorToRangeOperator {

    // MARK: Stored Properties

    public let duration: Duration

    // MARK: Initialization

    public init(duration: Duration) {
        self.duration = duration
    }

}

extension VectorMetricQuery {

    public subscript<Duration: TimeInterval>(
        _ duration: Duration,
        _ step: Never?
    ) -> VectorToRangeQuery<Self, OpenSubqueryVectorToRangeOperator<Duration>> {
        .init(query: self, operator: .init(duration: duration))
    }

    public subscript<Duration: TimeInterval, Offset: TimeInterval>(
        _ duration: Duration,
        _ step: Never?,
        offset offset: Offset
    ) -> RangeToRangeQuery<
        VectorToRangeQuery<Self, OpenSubqueryVectorToRangeOperator<Duration>>,
        OffsetRangeToRangeOperator<Offset>
    > {
        .init(
            query: .init(query: self, operator: .init(duration: duration)),
            operator: .init(interval: offset)
        )
    }

}
