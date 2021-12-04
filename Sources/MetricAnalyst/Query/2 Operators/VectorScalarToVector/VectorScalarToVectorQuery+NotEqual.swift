
public struct NotEqualVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func notEqual<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> VectorScalarToVectorQuery<Left, NotEqualVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, NotEqualVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func notEqual<Right: ScalarMetricQuery>(
        to right: Right
    ) -> VectorScalarToVectorQuery<Self, NotEqualVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func != <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, NotEqualVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
