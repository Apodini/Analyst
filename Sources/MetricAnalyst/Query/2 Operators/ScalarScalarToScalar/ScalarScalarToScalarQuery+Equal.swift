
public struct EqualScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func equal<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> ScalarScalarToScalarQuery<Left, EqualScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, EqualScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func equal<Right: ScalarMetricQuery>(
        to right: Right
    ) -> ScalarScalarToScalarQuery<Self, EqualScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func == <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, EqualScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
