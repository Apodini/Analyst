public struct ScalarQuery<Model: Metric> {

    // MARK: Nested Types

    public indirect enum Kind {
        case rate(RangeQuery<Model>.Kind)
        case operation(Operator, ScalarQuery<Model>.Kind, ScalarQuery<Model>.Kind)
        case delta(RangeQuery<Model>.Kind)
        case metric(Model)
        case aggregation(Aggregation, ScalarQuery.Kind, AggregationRule?)
        case aggregationOverTime(AggregationOverTime, RangeQuery<Model>.Kind)
    }

    public enum Operator {
        case add
        case subtract
        case multiply
        case divide
        case exponentiate
    }

    public enum AggregationOverTime {
        case average
        case min
        case max
        case sum
        case count
        case deviation
        case variance
        case quantile(Double)
    }

    public enum Aggregation {
        case average
        case min
        case max
        case sum
        case count
        case deviation
        case variance
        case bottom(Int)
        case top(Int)
        case quantile(Double)
    }

    public enum AggregationRule {
        case including(keys: [String])
        case excluding(keys: [String])
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

extension ScalarQuery {

    public func `in`(_ range: TimeRange) -> RangeQuery<Model> {
        .init(label: label, kind: .matrix(kind, range))
    }

}

extension ScalarQuery.Kind {

    public static func +(lhs: ScalarQuery.Kind, rhs: ScalarQuery.Kind) -> ScalarQuery.Kind {
        .operation(.add, lhs, rhs)
    }

    public static func -(lhs: ScalarQuery.Kind, rhs: ScalarQuery.Kind) -> ScalarQuery.Kind {
        .operation(.subtract, lhs, rhs)
    }

    public static func *(lhs: ScalarQuery.Kind, rhs: ScalarQuery.Kind) -> ScalarQuery.Kind {
        .operation(.multiply, lhs, rhs)
    }

    public static func /(lhs: ScalarQuery.Kind, rhs: ScalarQuery.Kind) -> ScalarQuery.Kind {
        .operation(.divide, lhs, rhs)
    }

    public static func pow(_ lhs: ScalarQuery.Kind, _ rhs: ScalarQuery.Kind) -> ScalarQuery.Kind {
        .operation(.exponentiate, lhs, rhs)
    }
}

extension ScalarQuery.Kind {

    public static func average(_ scalar: ScalarQuery<Model>.Kind, rule: ScalarQuery.AggregationRule? = nil) -> Self {
        .aggregation(.average, scalar, rule)
    }

    public static func min(_ scalar: ScalarQuery<Model>.Kind, rule: ScalarQuery.AggregationRule? = nil) -> Self {
        .aggregation(.min, scalar, rule)
    }

    public static func max(_ scalar: ScalarQuery<Model>.Kind, rule: ScalarQuery.AggregationRule? = nil) -> Self {
        .aggregation(.max, scalar, rule)
    }

    public static func sum(_ scalar: ScalarQuery<Model>.Kind, rule: ScalarQuery.AggregationRule? = nil) -> Self {
        .aggregation(.sum, scalar, rule)
    }

    public static func count(_ scalar: ScalarQuery<Model>.Kind, rule: ScalarQuery.AggregationRule? = nil) -> Self {
        .aggregation(.count, scalar, rule)
    }

    public static func deviation(_ scalar: ScalarQuery<Model>.Kind, rule: ScalarQuery.AggregationRule? = nil) -> Self {
        .aggregation(.deviation, scalar, rule)
    }

    public static func variance(_ scalar: ScalarQuery<Model>.Kind, rule: ScalarQuery.AggregationRule? = nil) -> Self {
        .aggregation(.variance, scalar, rule)
    }

    public static func averageOverTime(_ range: RangeQuery<Model>.Kind) -> Self {
        .aggregationOverTime(.average, range)
    }

    public static func minOverTime(_ range: RangeQuery<Model>.Kind) -> Self {
        .aggregationOverTime(.min, range)
    }

    public static func maxOverTime(_ range: RangeQuery<Model>.Kind) -> Self {
        .aggregationOverTime(.max, range)
    }

    public static func sumOverTime(_ range: RangeQuery<Model>.Kind) -> Self {
        .aggregationOverTime(.sum, range)
    }

    public static func countOverTime(_ range: RangeQuery<Model>.Kind) -> Self {
        .aggregationOverTime(.count, range)
    }

    public static func deviationOverTime(_ range: RangeQuery<Model>.Kind) -> Self {
        .aggregationOverTime(.deviation, range)
    }

    public static func varianceOverTime(_ range: RangeQuery<Model>.Kind) -> Self {
        .aggregationOverTime(.variance, range)
    }

}
