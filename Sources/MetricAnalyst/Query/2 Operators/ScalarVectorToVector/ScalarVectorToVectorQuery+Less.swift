
public struct LessScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func less<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        than right: Right
    ) -> ScalarVectorToVectorQuery<Left, LessScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, LessScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func less<Right: VectorMetricQuery>(
        than right: Right
    ) -> ScalarVectorToVectorQuery<Self, LessScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func < <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, LessScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
