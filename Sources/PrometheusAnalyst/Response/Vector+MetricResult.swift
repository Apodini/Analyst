
extension VectorResponse {

    // MARK: Nested Types

    private struct ValueElement {
        var label: String
        var metric: [String: String]
        var date: Date
        var value: Double
    }

    // MARK: Counter

    func counter(label: String) -> VectorResult<CounterScalarResult> {
        results(label: label) { values in
            assert(values.count == 1)

            let groupedValues = Dictionary(grouping: values, by: { $0.date })
                .compactMapValues { $0.first }

            let results = groupedValues.map { key, value in
                CounterScalarResult(
                    label: label,
                    dimensions: dimensions(of: value.metric),
                    date: key,
                    value: value.value
                )
            }

            assert(results.count == 1)

            return results.first
        }
    }

    // MARK: Gauge

    func gauge(label: String) -> VectorResult<GaugeScalarResult> {
        results(label: label) { values in

            assert(values.count == 1)

            let groupedValues = Dictionary(grouping: values, by: { $0.date })
                .compactMapValues { $0.first }

            let results = groupedValues.map { key, value in
                GaugeScalarResult(
                    label: label,
                    dimensions: dimensions(of: value.metric),
                    date: key,
                    value: value.value
                )
            }

            assert(results.count == 1)

            return results.first
        }
    }

    // MARK: Recorder

    func recorder(label: String) -> VectorResult<RecorderScalarResult> {
        results(label: label) { values in

            assert(values.count == 1)

            guard let firstValue = values.first else { return nil }

            let groupedValues = Dictionary(grouping: values, by: { $0.date })
                .mapValues { values -> [Double: Double] in
                    let buckets = Dictionary(grouping: values, by: { Double($0.metric["le"] ?? "") ?? .nan })
                        .compactMapValues { $0.first?.value }
                    return buckets
                }

            let results = groupedValues.map { key, value in
                RecorderScalarResult(
                    label: label,
                    dimensions: dimensions(of: firstValue.metric),
                    date: key,
                    buckets: value
                )
            }

            assert(results.count == 1)

            return results.first
        }
    }

    // MARK: Timer

    func timer(label: String) -> VectorResult<TimerScalarResult> {
        results(label: label) { values in

            assert(values.count == 1)

            guard let firstValue = values.first else { return nil }

            let groupedValues = Dictionary(grouping: values, by: { $0.date })
                .mapValues { values -> [Double: Double] in
                    let quantiles = Dictionary(grouping: values, by: { Double($0.metric["quantile"] ?? "") ?? .nan })
                        .compactMapValues { $0.first?.value }
                    return quantiles
                }

            let results = groupedValues.map { key, value in
                TimerScalarResult(
                    label: label,
                    dimensions: dimensions(of: firstValue.metric),
                    date: key,
                    quantiles: value
                )
            }

            assert(results.count == 1)


            return results.first
        }
    }

    func rangeResults(label: String) -> [RangeResult] {
        data.result.map { result in
            let values = Dictionary(grouping: result.allValues, by: { $0.date })
                .compactMapValues { $0.first?.value }
            return RangeResult(label: label, dimensions: result.metric, values: values)
        }
    }

    private func dimensions(of metric: [String: String]) -> [String: String] {
        var dimensions = metric
        dimensions.removeValue(forKey: "quantile")
        dimensions.removeValue(forKey: "le")
        return dimensions
    }

    // MARK: Helpers

    private func results<T>(label: String, create: ([ValueElement]) -> T?) -> VectorResult<T> {
        let values = Dictionary(grouping: data.result) { dimensions(of: $0.metric) }
            .compactMap { elements -> T? in
                let values = elements.value.flatMap { element in
                    element.allValues.map { value in
                        ValueElement(label: label, metric: element.metric, date: value.date, value: value.value)
                    }
                }

                return create(values)
            }
        return VectorResult(values: values)
    }

}
