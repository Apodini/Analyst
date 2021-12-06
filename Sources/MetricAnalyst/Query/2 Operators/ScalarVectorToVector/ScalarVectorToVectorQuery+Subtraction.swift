
public struct SubtractionScalarVectorToVectorOperator: ScalarVectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func subtract<Left: ScalarMetricQuery, Right: VectorMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> ScalarVectorToVectorQuery<Left, SubtractionScalarVectorToVectorOperator, Right>
        where Self == ScalarVectorToVectorQuery<Left, SubtractionScalarVectorToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func subtract<Right: VectorMetricQuery>(
        _ right: Right
    ) -> ScalarVectorToVectorQuery<Self, SubtractionScalarVectorToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func - <Left: ScalarMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarVectorToVectorQuery<Left, SubtractionScalarVectorToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
