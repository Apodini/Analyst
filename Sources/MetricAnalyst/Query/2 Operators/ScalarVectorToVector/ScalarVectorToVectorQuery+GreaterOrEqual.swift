
public struct GreaterOrEqualScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func greaterOrEqual<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> ScalarVectorToVectorQuery<Left, GreaterOrEqualScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, GreaterOrEqualScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func greaterOrEqual<Right: VectorMetricQuery>(
        to right: Right
    ) -> ScalarVectorToVectorQuery<Self, GreaterOrEqualScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func >= <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, GreaterOrEqualScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
