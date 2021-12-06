
public struct NotEqualScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func notEqual<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> ScalarVectorToVectorQuery<Left, NotEqualScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, NotEqualScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func notEqual<Right: VectorMetricQuery>(
        to right: Right
    ) -> ScalarVectorToVectorQuery<Self, NotEqualScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func != <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, NotEqualScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
