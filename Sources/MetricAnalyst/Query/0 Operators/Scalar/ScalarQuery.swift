
public protocol ScalarOperator: NullaryMetricQueryOperator {}

public struct ScalarQuery<Operator: ScalarOperator>: ScalarMetricQuery, NullaryOperatorMetricQuery {

    // MARK: Stored Properties

    public let `operator`: Operator

    // MARK: Initialization

    public init(operator: Operator) {
        self.`operator` = `operator`
    }

}
