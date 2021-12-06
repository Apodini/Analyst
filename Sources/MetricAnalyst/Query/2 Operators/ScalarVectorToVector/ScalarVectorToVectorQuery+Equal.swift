
public struct EqualScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func equal<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> ScalarVectorToVectorQuery<Left, EqualScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, EqualScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func equal<Right: VectorMetricQuery>(
        to right: Right
    ) -> ScalarVectorToVectorQuery<Self, EqualScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func == <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, EqualScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
