
public struct ExponentiationScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func power<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> ScalarVectorToVectorQuery<Left, ExponentiationScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, ExponentiationScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func power<Right: VectorMetricQuery>(
        _ right: Right
    ) -> ScalarVectorToVectorQuery<Self, ExponentiationScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func ^ <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, ExponentiationScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
