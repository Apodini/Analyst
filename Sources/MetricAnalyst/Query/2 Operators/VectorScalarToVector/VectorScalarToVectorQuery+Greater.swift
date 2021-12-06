
public struct GreaterVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func greater<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        than right: Right
    ) -> VectorScalarToVectorQuery<Left, GreaterVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, GreaterVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func greater<Right: ScalarMetricQuery>(
        than right: Right
    ) -> VectorScalarToVectorQuery<Self, GreaterVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func > <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, GreaterVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}

