
public struct LessOrEqualScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func lessOrEqual<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> ScalarVectorToVectorQuery<Left, LessOrEqualScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, LessOrEqualScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func lessOrEqual<Right: VectorMetricQuery>(
        to right: Right
    ) -> ScalarVectorToVectorQuery<Self, LessOrEqualScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func <= <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, LessOrEqualScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
