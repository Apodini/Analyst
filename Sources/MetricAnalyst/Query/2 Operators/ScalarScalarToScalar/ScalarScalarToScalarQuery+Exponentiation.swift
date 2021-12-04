
public struct ExponentiationScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func power<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        with right: Right
    ) -> ScalarScalarToScalarQuery<Left, ExponentiationScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, ExponentiationScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func power<Right: ScalarMetricQuery>(
        _ right: Right
    ) -> ScalarScalarToScalarQuery<Self, ExponentiationScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func ^ <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, ExponentiationScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
