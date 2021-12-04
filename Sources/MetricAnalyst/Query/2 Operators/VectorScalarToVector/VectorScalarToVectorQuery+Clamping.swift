
// MARK: - Maximum

public struct MaximumClampingVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension VectorMetricQuery {

    public func clamp<Query: ScalarMetricQuery>(
        maximum: Query
    ) -> VectorScalarToVectorQuery<Self, MaximumClampingVectorScalarToVectorOperator, Query> {
        .init(left: self, operator: .init(), right: maximum)
    }

}

// MARK: - Minimum

public struct MinimumClampingVectorScalarToVectorOperator: VectorScalarToVectorOperator {
    public init() {}
}

extension VectorMetricQuery {

    public func clamp<Query: ScalarMetricQuery>(
        minimum: Query
    ) -> VectorScalarToVectorQuery<Self, MinimumClampingVectorScalarToVectorOperator, Query> {
        .init(left: self, operator: .init(), right: minimum)
    }

}

// MARK: - Minimum & Maximum

extension VectorMetricQuery {

    public func clamp<Minimum: ScalarMetricQuery, Maximum: ScalarMetricQuery>(
        minimum: Minimum,
        maximum: Maximum
    ) -> VectorScalarToVectorQuery<
        VectorScalarToVectorQuery<
            Self,
            MinimumClampingVectorScalarToVectorOperator,
            Minimum
        >,
        MaximumClampingVectorScalarToVectorOperator,
        Maximum
    > {
        .init(
            left: .init(
                left: self,
                operator: .init(),
                right: minimum
            ),
            operator: .init(),
            right: maximum
        )
    }

}
