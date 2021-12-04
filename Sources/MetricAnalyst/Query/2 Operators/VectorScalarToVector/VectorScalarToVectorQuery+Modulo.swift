
public struct ModuloVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func mod<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> VectorScalarToVectorQuery<Left, ModuloVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, ModuloVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func mod<Right: ScalarMetricQuery>(
        _ right: Right
    ) -> VectorScalarToVectorQuery<Self, ModuloVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func % <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, ModuloVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
