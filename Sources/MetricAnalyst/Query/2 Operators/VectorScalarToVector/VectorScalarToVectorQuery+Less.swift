
public struct LessVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func less<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        than right: Right
    ) -> VectorScalarToVectorQuery<Left, LessVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, LessVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func less<Right: ScalarMetricQuery>(
        than right: Right
    ) -> VectorScalarToVectorQuery<Self, LessVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func < <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, LessVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
