
public struct LessScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func less<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        than right: Right
    ) -> ScalarScalarToScalarQuery<Left, LessScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, LessScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func less<Right: ScalarMetricQuery>(
        than right: Right
    ) -> ScalarScalarToScalarQuery<Self, LessScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func < <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, LessScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
