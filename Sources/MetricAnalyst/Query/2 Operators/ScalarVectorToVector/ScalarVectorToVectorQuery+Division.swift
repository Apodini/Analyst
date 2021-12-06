
public struct DivisionScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func divide<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        by right: Right
    ) -> ScalarVectorToVectorQuery<Left, DivisionScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, DivisionScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func divide<Right: VectorMetricQuery>(
        by right: Right
    ) -> ScalarVectorToVectorQuery<Self, DivisionScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func / <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, DivisionScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
