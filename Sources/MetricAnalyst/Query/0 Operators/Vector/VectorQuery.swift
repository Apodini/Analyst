
public protocol VectorOperator: NullaryMetricQueryOperator {}

public struct VectorQuery<Operator: VectorOperator>: VectorMetricQuery, NullaryOperatorMetricQuery {

    // MARK: Stored Properties

    public let `operator`: Operator

    // MARK: Initialization

    public init(operator: Operator) {
        self.`operator` = `operator`
    }

}
