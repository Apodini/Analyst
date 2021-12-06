
public struct ModuloScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func mod<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> ScalarVectorToVectorQuery<Left, ModuloScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, ModuloScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func mod<Right: VectorMetricQuery>(
        _ right: Right
    ) -> ScalarVectorToVectorQuery<Self, ModuloScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func % <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, ModuloScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
