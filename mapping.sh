#!/bin/bash
jq -r '.[1].datapoints | [.[] | { value : .[0], timestamp: .[1], datasetid: .[2]} ] | (map(keys) | add | unique) as $cols | map(. as $row | $cols | map($row[.])) as $rows | $cols, $rows[] | @csv ' $1  > $2
