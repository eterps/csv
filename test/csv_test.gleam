import csv
import gleam/should

pub fn split_with_test() {
  csv.split_with(";", "id;value\n1;one\n2;two\n")
  |> should.equal([["id", "value"], ["1", "one"], ["2", "two"]])

  csv.split_with(";", "id;value\r\n1;one\r\n2;two")
  |> should.equal([["id", "value"], ["1", "one"], ["2", "two"]])

  csv.split_with(";", "id ;value\n1 ; one \n2;   two \n ")
  |> should.equal([["id", "value"], ["1", "one"], ["2", "two"]])

  csv.split_with(",", "\"foo\", \"bar\"")
  |> should.equal([["foo", "bar"]])

  csv.split_with(",", " \" foo \" , \" bar \" ")
  |> should.equal([["foo", "bar"]])
}

pub fn split_test() {
  csv.split("id,value\n1,one\n2,two\n")
  |> should.equal([["id", "value"], ["1", "one"], ["2", "two"]])
}

pub fn parse_with_test() {
  csv.parse_with(";", "id;value\n1;one\n2;two\n")
  |> should.equal(
    csv.Csv(headers: ["id", "value"], records: [["1", "one"], ["2", "two"]]),
  )
}

pub fn parse_test() {
  csv.parse("id,value\n1,one\n2,two\n")
  |> should.equal(
    csv.Csv(headers: ["id", "value"], records: [["1", "one"], ["2", "two"]]),
  )
}
