public struct RangeQuery<Model: Metric> {

    // MARK: Nested Types

    public indirect enum Kind {
        case range(VectorQuery<Model>.Kind, Interval)
        case matrix(ScalarQuery<Model>.Kind, TimeRange)
        case offset(RangeQuery.Kind, Interval)
    }

    // MARK: Stored Properties

    public let label: String
    public let kind: Kind

    // MARK: Initialization

    public init(label: String, kind: Kind) {
        self.label = label
        self.kind = kind
    }

}

extension RangeQuery.Kind {

    public static func range(_ metric: Model, in interval: Interval) -> RangeQuery.Kind {
        .range(.metric(metric), interval)
    }

}

extension RangeQuery.Kind {

    public func offset(_ interval: Interval?) -> Self {
        interval.map { .offset(self, $0) } ?? self
    }

}
