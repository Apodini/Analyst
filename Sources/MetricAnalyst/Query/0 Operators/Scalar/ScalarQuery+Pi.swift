
public struct PiScalarOperator: ScalarOperator {
    public init() {}
}

extension MetricQuery where Self == ScalarQuery<PiScalarOperator> {

    public static func pi() -> ScalarQuery<PiScalarOperator> {
        .init(operator: .init())
    }

}
