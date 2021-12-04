
public protocol VectorRangeToRangeOperator: BinaryMetricQueryOperator {}

public struct VectorRangeToRangeQuery<Left: VectorMetricQuery, Operator: VectorRangeToRangeOperator, Right: RangeMetricQuery>: RangeMetricQuery, BinaryOperatorMetricQuery {

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
