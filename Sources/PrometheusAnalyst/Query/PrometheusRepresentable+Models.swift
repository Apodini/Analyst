
// MARK: - AggregationRule

extension DefaultAggregationRule: PrometheusRepresentable {
    public var prometheusRepresentation: String { String() }
}

extension ExclusiveAggregationRule: PrometheusRepresentable {
    public var prometheusRepresentation: String { " without (" + labels.joined(separator: ",") + ")" }
}

extension InclusiveAggregationRule: PrometheusRepresentable {
    public var prometheusRepresentation: String { " by (" + labels.joined(separator: ",") + ")" }
}

// MARK: - DimensionFilter

public protocol PrometheusRepresentableDimensionFilter {
    var prometheusDimensionFilterRepresentation: [String] { get }
}

extension AllDimensionFilter: PrometheusRepresentableDimensionFilter {
    public var prometheusDimensionFilterRepresentation: [String] { [] }
}

extension EqualityDimensionFilter: PrometheusRepresentableDimensionFilter {
    public var prometheusDimensionFilterRepresentation: [String] { [ label + "=\"" + value + "\"" ] }
}

extension InequalityDimensionFilter: PrometheusRepresentableDimensionFilter {
    public var prometheusDimensionFilterRepresentation: [String] { [ label + "!=\"" + value + "\"" ] }
}

extension RegexEqualityDimensionFilter: PrometheusRepresentableDimensionFilter {
    public var prometheusDimensionFilterRepresentation: [String] { [ label + "=~\"" + value + "\"" ] }
}

extension RegexInequalityDimensionFilter: PrometheusRepresentableDimensionFilter {
    public var prometheusDimensionFilterRepresentation: [String] { [ label + "!~\"" + value + "\"" ] }
}

extension BuilderDimensionFilter: PrometheusRepresentableDimensionFilter where Prefix: PrometheusRepresentableDimensionFilter, Suffix: PrometheusRepresentableDimensionFilter {
    public var prometheusDimensionFilterRepresentation: [String] {
        prefix.prometheusDimensionFilterRepresentation + suffix.prometheusDimensionFilterRepresentation
    }
}

extension Metric where Self: PrometheusRepresentableDimensionFilter {
    public var prometheusDimensionFilterRepresentation: [String] {
        dimensions.flatMap { EqualityDimensionFilter(label: $0, value: $1).prometheusDimensionFilterRepresentation }
    }
}

extension Counter: PrometheusRepresentableDimensionFilter {}
extension FloatingPointCounter: PrometheusRepresentableDimensionFilter {}
extension Recorder: PrometheusRepresentableDimensionFilter {}
extension Timer: PrometheusRepresentableDimensionFilter {}

// MARK: - MatchingGroupingRule

extension DefaultMatchingGroupingRule: PrometheusRepresentable {
    public var prometheusRepresentation: String { String() }
}

extension LeftMatchingGroupingRule: PrometheusRepresentable {
    public var prometheusRepresentation: String { " group_left(" + labels.joined(separator: ",") + ")" }
}

extension RightMatchingGroupingRule: PrometheusRepresentable {
    public var prometheusRepresentation: String { " group_right(" + labels.joined(separator: ",") + ")" }
}

// MARK: - MatchingRule

extension DefaultMatchingRule: PrometheusRepresentable {
    public var prometheusRepresentation: String { String() }
}

extension ExclusiveMatchingRule: PrometheusRepresentable {
    public var prometheusRepresentation: String { " ignoring(" + labels.joined(separator: ",") + ")" }
}

extension InclusiveMatchingRule: PrometheusRepresentable {
    public var prometheusRepresentation: String { " on(" + labels.joined(separator: ",") + ")" }
}

// MARK: - TimeInterval

extension MillisecondsTimeInterval: PrometheusRepresentable {
    public var prometheusRepresentation: String { count.description + "ms" }
}

extension SecondsTimeInterval: PrometheusRepresentable {
    public var prometheusRepresentation: String { count.description + "s" }
}

extension MinutesTimeInterval: PrometheusRepresentable {
    public var prometheusRepresentation: String { count.description + "m" }
}

extension HoursTimeInterval: PrometheusRepresentable {
    public var prometheusRepresentation: String { count.description + "h" }
}

extension DaysTimeInterval: PrometheusRepresentable {
    public var prometheusRepresentation: String { count.description + "d" }
}

extension WeeksTimeInterval: PrometheusRepresentable {
    public var prometheusRepresentation: String { count.description + "w" }
}

extension YearsTimeInterval: PrometheusRepresentable {
    public var prometheusRepresentation: String { count.description + "y" }
}
