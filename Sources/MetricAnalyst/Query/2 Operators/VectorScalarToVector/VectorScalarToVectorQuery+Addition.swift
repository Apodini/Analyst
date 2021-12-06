
public struct AdditionVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func add<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> VectorScalarToVectorQuery<Left, AdditionVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, AdditionVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func add<Right: ScalarMetricQuery>(
        _ right: Right
    ) -> VectorScalarToVectorQuery<Self, AdditionVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func + <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, AdditionVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
