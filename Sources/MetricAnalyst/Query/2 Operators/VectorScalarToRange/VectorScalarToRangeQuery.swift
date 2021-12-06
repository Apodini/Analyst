
public protocol VectorScalarToRangeOperator: BinaryMetricQueryOperator {}

public struct VectorScalarToRangeQuery<Left: VectorMetricQuery, Operator: VectorScalarToRangeOperator, Right: ScalarMetricQuery>: RangeMetricQuery, BinaryOperatorMetricQuery {

    // MARK: Stored Properties

    public let left: Left
    public let `operator`: Operator
    public let right: Right

    // MARK: Initialization

    public init(left: Left, operator: Operator, right: Right) {
        self.left = left
        self.`operator` = `operator`
        self.right = right
    }

}
