
public struct SubtractionVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func subtract<Left: VectorMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> VectorScalarToVectorQuery<Left, SubtractionVectorScalarToVectorOperator, Right>
        where Self == VectorScalarToVectorQuery<Left, SubtractionVectorScalarToVectorOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension VectorMetricQuery {

    public func subtract<Right: ScalarMetricQuery>(
        _ right: Right
    ) -> VectorScalarToVectorQuery<Self, SubtractionVectorScalarToVectorOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func - <Left: VectorMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorScalarToVectorQuery<Left, SubtractionVectorScalarToVectorOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
