
public struct MultiplicationVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func multiply<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        with right: Right
    ) -> VectorScalarToVectorQuery<Left, MultiplicationVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, MultiplicationVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func multiply<Right: ScalarMetricQuery>(
        with right: Right
    ) -> VectorScalarToVectorQuery<Self, MultiplicationVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func * <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, MultiplicationVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
