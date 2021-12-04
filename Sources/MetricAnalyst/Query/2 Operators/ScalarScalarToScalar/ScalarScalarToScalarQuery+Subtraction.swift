
public struct SubtractionScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func subtract<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> ScalarScalarToScalarQuery<Left, SubtractionScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, SubtractionScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func subtract<Right: ScalarMetricQuery>(
        _ right: Right
    ) -> ScalarScalarToScalarQuery<Self, SubtractionScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func - <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, SubtractionScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
