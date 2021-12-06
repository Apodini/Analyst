
public protocol RangeToScalarOperator: UnaryMetricQueryOperator {}

public struct RangeToScalarQuery<Query: RangeMetricQuery, Operator: RangeToScalarOperator>: ScalarMetricQuery, UnaryOperatorMetricQuery {

    // MARK: Stored Properties

    public let query: Query
    public let `operator`: Operator

    // MARK: Initialization

    public init(query: Query, operator: Operator) {
        self.query = query
        self.`operator` = `operator`
    }

}
