
public struct DivisionScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func divide<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        by right: Right
    ) -> ScalarScalarToScalarQuery<Left, DivisionScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, DivisionScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func divide<Right: ScalarMetricQuery>(
        by right: Right
    ) -> ScalarScalarToScalarQuery<Self, DivisionScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func / <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, DivisionScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
