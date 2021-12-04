
public struct IntScalarOperator: ScalarOperator {

    public let value: Int

    public init(value: Int) {
        self.value = value
    }

}

extension MetricQuery where Self == ScalarQuery<IntScalarOperator> {

    public static func int(_ value: Int) -> ScalarQuery<IntScalarOperator> {
        .init(operator: .init(value: value))
    }

}

extension Int: ScalarMetricQuery {}
