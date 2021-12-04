
public struct AdditionScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func add<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> ScalarVectorToVectorQuery<Left, AdditionScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, AdditionScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func add<Right: VectorMetricQuery>(
        _ right: Right
    ) -> ScalarVectorToVectorQuery<Self, AdditionScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func + <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, AdditionScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
