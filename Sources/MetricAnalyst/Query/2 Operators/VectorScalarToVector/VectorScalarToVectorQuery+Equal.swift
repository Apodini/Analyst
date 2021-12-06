
public struct EqualVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func equal<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> VectorScalarToVectorQuery<Left, EqualVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, EqualVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func equal<Right: ScalarMetricQuery>(
        to right: Right
    ) -> VectorScalarToVectorQuery<Self, EqualVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func == <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, EqualVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
