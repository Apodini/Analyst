public struct VectorQuery<Model: Metric> {

    // MARK: Nested Types

    public indirect enum Kind {
        case metric(Model)
        case offset(VectorQuery.Kind, Interval)
        case aggregation(Aggregation, VectorQuery<Model>.Kind, step: Interval, total: Interval)
    }

    public enum Aggregation {
        case average
        case min
        case max
        case sum
        case count
        case quantile(Double)
        case deviation
        case variance
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

extension VectorQuery.Kind {

    func offset(_ interval: Interval?) -> Self {
        interval.map { .offset(self, $0) } ?? self
    }

}
