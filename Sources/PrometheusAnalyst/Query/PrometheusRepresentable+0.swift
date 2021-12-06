
extension NullaryOperatorMetricQuery where Self: PrometheusRepresentable, Operator: PrometheusRepresentable {
    public var prometheusRepresentation: String { `operator`.prometheusRepresentation }
}

// MARK: - Queries

extension RangeQuery: PrometheusRepresentable where Operator: PrometheusRepresentable {}
extension ScalarQuery: PrometheusRepresentable where Operator: PrometheusRepresentable {}
extension VectorQuery: PrometheusRepresentable where Operator: PrometheusRepresentable {}

// MARK: - RangeQuery

// MARK: - ScalarQuery

extension Double: PrometheusRepresentable {
    public var prometheusRepresentation: String { description }
}

extension DoubleScalarOperator: PrometheusRepresentable {
    public var prometheusRepresentation: String { value.prometheusRepresentation }
}

extension Int: PrometheusRepresentable {
    public var prometheusRepresentation: String { description }
}

extension IntScalarOperator: PrometheusRepresentable {
    public var prometheusRepresentation: String { value.prometheusRepresentation }
}

extension PiScalarOperator: PrometheusRepresentable {
    public var prometheusRepresentation: String { "pi()" }
}

// MARK: - VectorQuery

extension DimensionFilterVectorOperator: PrometheusRepresentable where Filter: PrometheusRepresentableDimensionFilter {
    public var prometheusRepresentation: String {
        let labelRepresentation = label ?? String()
        let filterRepresentation = filter.prometheusDimensionFilterRepresentation
        if filterRepresentation.isEmpty {
            return labelRepresentation
        } else {
            return labelRepresentation + "{" + filterRepresentation.joined(separator: ",") + "}"
        }
    }
}

extension MetricVectorOperator: PrometheusRepresentable where MetricType: PrometheusRepresentableDimensionFilter, Filter: PrometheusRepresentableDimensionFilter {
    public var prometheusRepresentation: String {
        let labelRepresentation = metric.label
        let filterRepresentation = metric.prometheusDimensionFilterRepresentation + filter.prometheusDimensionFilterRepresentation
        if filterRepresentation.isEmpty {
            return labelRepresentation
        } else {
            return labelRepresentation + "{" + filterRepresentation.joined(separator: ",") + "}"
        }
    }
}

extension String: PrometheusRepresentable {
    public var prometheusRepresentation: String { self }
}

extension Metric where Self: PrometheusRepresentable & PrometheusRepresentableDimensionFilter {
    public var prometheusRepresentation: String {
        let filterRepresentation = prometheusDimensionFilterRepresentation
        if filterRepresentation.isEmpty {
            return label
        } else {
            return label + "{" + filterRepresentation.joined(separator: ",") + "}"
        }
    }
}

extension Counter: PrometheusRepresentable {}
extension FloatingPointCounter: PrometheusRepresentable {}
extension Recorder: PrometheusRepresentable {}
extension Timer: PrometheusRepresentable {}
