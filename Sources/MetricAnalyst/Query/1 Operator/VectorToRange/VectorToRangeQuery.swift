
public protocol VectorToRangeOperator: UnaryMetricQueryOperator {}

public struct VectorToRangeQuery<Query: VectorMetricQuery, Operator: VectorToRangeOperator>: RangeMetricQuery, UnaryOperatorMetricQuery {

    // MARK: Stored Properties

    public let query: Query
    public let `operator`: Operator

    // MARK: Initialization

    public init(query: Query, operator: Operator) {
        self.query = query
        self.`operator` = `operator`
    }

}
