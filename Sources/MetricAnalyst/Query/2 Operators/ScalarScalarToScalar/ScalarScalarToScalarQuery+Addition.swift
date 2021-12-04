
public struct AdditionScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func add<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        _ right: Right
    ) -> ScalarScalarToScalarQuery<Left, AdditionScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, AdditionScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func add<Right: ScalarMetricQuery>(
        _ right: Right
    ) -> ScalarScalarToScalarQuery<Self, AdditionScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func + <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, AdditionScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
