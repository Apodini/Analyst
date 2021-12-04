
public struct NotEqualScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func notEqual<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        to right: Right
    ) -> ScalarScalarToScalarQuery<Left, NotEqualScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, NotEqualScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func notEqual<Right: ScalarMetricQuery>(
        to right: Right
    ) -> ScalarScalarToScalarQuery<Self, NotEqualScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func != <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, NotEqualScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}

