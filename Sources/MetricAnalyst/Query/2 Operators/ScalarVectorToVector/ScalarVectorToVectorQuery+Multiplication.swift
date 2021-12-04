
public struct MultiplicationScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func multiply<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        with right: Right
    ) -> ScalarVectorToVectorQuery<Left, MultiplicationScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, MultiplicationScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func multiply<Right: VectorMetricQuery>(
        with right: Right
    ) -> ScalarVectorToVectorQuery<Self, MultiplicationScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func * <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, MultiplicationScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
