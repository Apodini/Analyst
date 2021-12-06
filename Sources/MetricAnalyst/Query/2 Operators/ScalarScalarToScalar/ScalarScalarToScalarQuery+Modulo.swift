
public struct ModuloScalarScalarToScalarOperator: ScalarScalarToScalarOperator {
    public init() {}
}

extension MetricQuery {

    public static func modulo<Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
        _ left: Left,
        with right: Right
    ) -> ScalarScalarToScalarQuery<Left, ModuloScalarScalarToScalarOperator, Right>
        where Self == ScalarScalarToScalarQuery<Left, ModuloScalarScalarToScalarOperator, Right> {
        .init(left: left, operator: .init(), right: right)
    }

}

extension ScalarMetricQuery {

    public func modulo<Right: ScalarMetricQuery>(
        _ right: Right
    ) -> ScalarScalarToScalarQuery<Self, ModuloScalarScalarToScalarOperator, Right> {
        .init(left: self, operator: .init(), right: right)
    }

}

public func % <Left: ScalarMetricQuery, Right: ScalarMetricQuery>(
    _ left: Left,
    _ right: Right
) -> ScalarScalarToScalarQuery<Left, ModuloScalarScalarToScalarOperator, Right> {
    .init(left: left, operator: .init(), right: right)
}
