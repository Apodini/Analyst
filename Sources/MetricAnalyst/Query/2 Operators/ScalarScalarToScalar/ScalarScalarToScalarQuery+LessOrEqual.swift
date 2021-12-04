
public struct LessOrEqualScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func lessOrEqual<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> ScalarScalarToScalarQuery<Left, LessOrEqualScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, LessOrEqualScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func lessOrEqual<Right: ScalarMetricQuery>(
        to right: Right
    ) -> ScalarScalarToScalarQuery<Self, LessOrEqualScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func <= <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, LessOrEqualScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
