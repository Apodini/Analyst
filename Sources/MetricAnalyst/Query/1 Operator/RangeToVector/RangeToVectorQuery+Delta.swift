
public struct DeltaRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {
    public static func delta<Query>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, DeltaRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, DeltaRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }
}
