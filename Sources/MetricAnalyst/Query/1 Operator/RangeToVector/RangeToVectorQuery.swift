
public protocol RangeToVectorOperator: UnaryMetricQueryOperator {}

public struct RangeToVectorQuery<Query: RangeMetricQuery, Operator: RangeToVectorOperator>: VectorMetricQuery, UnaryOperatorMetricQuery {

    // MARK: Stored Properties

    public let query: Query
    public let `operator`: Operator

    // MARK: Initialization

    public init(query: Query, operator: Operator) {
        self.query = query
        self.`operator` = `operator`
    }

}
