
public struct GreaterScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func greater<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        than right: Right
    ) -> ScalarVectorToVectorQuery<Left, GreaterScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, GreaterScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func greater<Right: VectorMetricQuery>(
        than right: Right
    ) -> ScalarVectorToVectorQuery<Self, GreaterScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func > <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, GreaterScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}

