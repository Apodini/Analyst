
public struct AllDimensionFilter: DimensionFilter {
    public init() {}
}

extension DimensionFilter where Self == AllDimensionFilter {
    public static var all: AllDimensionFilter { .init() }
}
