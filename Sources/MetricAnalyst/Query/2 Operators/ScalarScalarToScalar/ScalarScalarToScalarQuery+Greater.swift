
public struct GreaterScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func greater<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        than right: Right
    ) -> ScalarScalarToScalarQuery<Left, GreaterScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, GreaterScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func greater<Right: ScalarMetricQuery>(
        than right: Right
    ) -> ScalarScalarToScalarQuery<Self, GreaterScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func > <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, GreaterOrEqualScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
