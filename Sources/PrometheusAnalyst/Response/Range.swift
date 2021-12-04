
struct PrometheusRange: Decodable {
    let metric: [String: String]
    let values: [PrometheusScalar]
}
