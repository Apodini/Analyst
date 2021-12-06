
public struct BuilderDimensionFilter<Prefix: DimensionFilter, Suffix: DimensionFilter>: DimensionFilter {

    public let prefix: Prefix
    public let suffix: Suffix

    public init(prefix: Prefix, suffix: Suffix) {
        self.prefix = prefix
        self.suffix = suffix
    }

}

public func && <Prefix: DimensionFilter, Suffix: DimensionFilter>(prefix: Prefix, suffix: Suffix) -> BuilderDimensionFilter<Prefix, Suffix> {
    .init(prefix: prefix, suffix: suffix)
}
