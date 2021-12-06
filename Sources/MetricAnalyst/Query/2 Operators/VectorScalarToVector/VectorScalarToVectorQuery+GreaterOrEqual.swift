
public struct GreaterOrEqualVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func greaterOrEqual<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> VectorScalarToVectorQuery<Left, GreaterOrEqualVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, GreaterOrEqualVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func greaterOrEqual<Right: ScalarMetricQuery>(
        to right: Right
    ) -> VectorScalarToVectorQuery<Self, GreaterOrEqualVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func >= <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, GreaterOrEqualVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
