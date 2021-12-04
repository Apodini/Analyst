
public struct LessOrEqualVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func lessOrEqual<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> VectorScalarToVectorQuery<Left, LessOrEqualVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, LessOrEqualVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func lessOrEqual<Right: ScalarMetricQuery>(
        to right: Right
    ) -> VectorScalarToVectorQuery<Self, LessOrEqualVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func <= <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, LessOrEqualVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
