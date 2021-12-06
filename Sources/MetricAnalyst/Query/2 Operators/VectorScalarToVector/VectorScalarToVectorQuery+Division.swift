
public struct DivisionVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func divide<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        by right: Right
    ) -> VectorScalarToVectorQuery<Left, DivisionVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, DivisionVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func divide<Right: ScalarMetricQuery>(
        by right: Right
    ) -> VectorScalarToVectorQuery<Self, DivisionVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func / <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, DivisionVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
