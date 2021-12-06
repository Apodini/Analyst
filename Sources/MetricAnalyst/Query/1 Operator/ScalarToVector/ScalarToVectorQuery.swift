
public protocol ScalarToVectorOperator: UnaryMetricQueryOperator {}

public struct ScalarToVectorQuery<Query: ScalarMetricQuery, Operator: ScalarToVectorOperator>: VectorMetricQuery, UnaryOperatorMetricQuery {

    // MARK: Stored Properties

    public let query: Query
    public let `operator`: Operator

    // MARK: Initialization

    public init(query: Query, operator: Operator) {
        self.query = query
        self.`operator` = `operator`
    }

}
