
public struct ExponentiationVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func power<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> VectorScalarToVectorQuery<Left, ExponentiationVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, ExponentiationVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func power<Right: ScalarMetricQuery>(
        _ right: Right
    ) -> VectorScalarToVectorQuery<Self, ExponentiationVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func ^ <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, ExponentiationVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
