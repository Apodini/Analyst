
public struct MultiplicationScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func multiply<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        with right: Right
    ) -> ScalarScalarToScalarQuery<Left, MultiplicationScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, MultiplicationScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func multiply<Right: ScalarMetricQuery>(
        with right: Right
    ) -> ScalarScalarToScalarQuery<Self, MultiplicationScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func * <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, MultiplicationScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
