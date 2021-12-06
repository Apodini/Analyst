
public struct SubqueryVectorToRangeOperator<Duration: TimeInterval, Step: TimeInterval>: VectorToRangeOperator {

    // MARK: Stored Properties

    public let duration: Duration
    public let step: Step

    // MARK: Initialization

    public init(duration: Duration, step: Step) {
        self.duration = duration
        self.step = step
    }

}

extension VectorMetricQuery {

    public subscript<Duration: TimeInterval, Step: TimeInterval>(
        _ duration: Duration,
        _ step: Step
    ) -> VectorToRangeQuery<Self, SubqueryVectorToRangeOperator<Duration, Step>> {
        .init(query: self, operator: .init(duration: duration, step: step))
    }

    public subscript<Duration: TimeInterval, Step: TimeInterval, Offset: TimeInterval>(
        _ duration: Duration,
        _ step: Step,
        offset offset: Offset
    ) -> RangeToRangeQuery<
        VectorToRangeQuery<Self, SubqueryVectorToRangeOperator<Duration, Step>>,
        OffsetRangeToRangeOperator<Offset>
    > {
        .init(
            query: .init(query: self, operator: .init(duration: duration, step: step)),
            operator: .init(interval: offset)
        )
    }

}
