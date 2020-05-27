# csv

A CSV parser for the Gleam programming language

## Usage

```rust
import csv

csv.parse("id,value\n1,one\n2,two\n")
// csv.Csv(
//  headers: ["id", "value"],
//  records: [
//               ["1", "one"],
//               ["2", "two"]
//           ]
// )
```

## TODO

- [x] Support `\r`/`\n` combinations
- [x] Strip whitespace
- [x] Support quoting
- [ ] Improve documentation

## Quick start

```sh
# Build the project
rebar3 compile

# Run the eunit tests
rebar3 eunit

# Run the Erlang REPL
rebar3 shell
```

## Installation

If [available in Hex](https://www.rebar3.org/docs/dependencies#section-declaring-dependencies)
this package can be installed by adding `csv` to your `rebar.config` dependencies:

```erlang
{deps, [
    csv
]}.
```
