
public protocol RangeOperator: NullaryMetricQueryOperator {}

public struct RangeQuery<Operator: RangeOperator>: RangeMetricQuery, NullaryOperatorMetricQuery {

    // MARK: Stored Properties

    public let `operator`: Operator

    // MARK: Initialization

    public init(operator: Operator) {
        self.`operator` = `operator`
    }

}
