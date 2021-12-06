
public struct DoubleScalarOperator: ScalarOperator {

    public let value: Double

    public init(value: Double) {
        self.value = value
    }

}

extension MetricQuery where Self == ScalarQuery<DoubleScalarOperator> {

    public static func double(_ value: Double) -> ScalarQuery<DoubleScalarOperator> {
        .init(operator: .init(value: value))
    }

}

extension Double: ScalarMetricQuery {}
