
public protocol RangeVectorToRangeOperator: BinaryMetricQueryOperator {}

public struct RangeVectorToRangeQuery<Left: RangeMetricQuery, Operator: RangeVectorToRangeOperator, Right: VectorMetricQuery>: RangeMetricQuery, BinaryOperatorMetricQuery {

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