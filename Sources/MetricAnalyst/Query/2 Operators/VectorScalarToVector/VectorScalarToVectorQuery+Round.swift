
public struct RoundingVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension VectorMetricQuery {

    public func round<Query: ScalarMetricQuery>(
        toNearest nearest: Query
    ) -> VectorScalarToVectorQuery<Self, RoundingVectorScalarToVectorOperator, Query> {
        .init(left: self, operator: .init(), right: nearest)
    }

    public func round() -> VectorScalarToVectorQuery<Self, RoundingVectorScalarToVectorOperator, ScalarQuery<IntScalarOperator>> {
        .init(left: self, operator: .init(), right: .init(operator: .init(value: 1)))
    }


}
