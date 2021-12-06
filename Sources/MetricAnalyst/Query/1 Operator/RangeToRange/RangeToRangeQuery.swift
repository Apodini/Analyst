
public protocol RangeToRangeOperator: UnaryMetricQueryOperator {}

public struct RangeToRangeQuery<Query: RangeMetricQuery, Operator: RangeToRangeOperator>: RangeMetricQuery, UnaryOperatorMetricQuery {

    // MARK: Stored Properties

    public let query: Query
    public let `operator`: Operator

    // MARK: Initialization

    public init(query: Query, operator: Operator) {
        self.query = query
        self.`operator` = `operator`
    }

}
