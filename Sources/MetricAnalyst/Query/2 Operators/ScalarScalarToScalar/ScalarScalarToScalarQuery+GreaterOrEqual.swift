
public struct GreaterOrEqualScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func greaterOrEqual<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> ScalarScalarToScalarQuery<Left, GreaterOrEqualScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, GreaterOrEqualScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func greaterOrEqual<Right: ScalarMetricQuery>(
        to right: Right
    ) -> ScalarScalarToScalarQuery<Self, GreaterOrEqualScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func >= <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, GreaterOrEqualScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
