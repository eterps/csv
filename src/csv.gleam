// TODO support \r, whitespace, quotes, doc-comments
import gleam/bool
import gleam/list
import gleam/result
import gleam/string

pub type Csv {
  Csv(headers: List(String), records: List(List(String)))
}

// TODO move to a separate file
pub fn split_line_with(str: String, separator: String) -> List(String) {
  string.split(str, separator)
}

pub fn split_with(separator: String, str: String) -> List(List(String)) {
  str
  |> string.split("\n")
  |> list.filter(fn(line) { bool.negate(string.is_empty(line)) })
  |> list.map(fn(line) { split_line_with(line, separator) })
}

pub fn split(str: String) -> List(List(String)) {
  split_with(",", str)
}

pub fn parse_with(separator: String, str: String) -> Csv {
  let csv_data = split_with(separator, str)
  let headers = result.unwrap(list.head(csv_data), [])
  let records = result.unwrap(list.tail(csv_data), [])
  Csv(headers: headers, records: records)
}

pub fn parse(str: String) -> Csv {
  parse_with(",", str)
}
