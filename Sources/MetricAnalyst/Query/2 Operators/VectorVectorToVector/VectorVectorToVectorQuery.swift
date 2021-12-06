
public protocol VectorVectorToVectorOperator: BinaryMetricQueryOperator {}

public struct VectorVectorToVectorQuery<Left: VectorMetricQuery, Operator: VectorVectorToVectorOperator, Right: VectorMetricQuery>: VectorMetricQuery, BinaryOperatorMetricQuery {

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
