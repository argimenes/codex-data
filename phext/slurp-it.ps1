param(
  [string] $output = "codex.phext"
)

function bg() {Start-Process -NoNewWindow @args}

if (Test-Path ".sq") {
  Remove-Item -Recurse -Force ".sq"
}
"" |Out-File -Encoding utf8 $output

bg sq $output
$summary = "Codex Summary for $output`n"

$book = 2
& sq slurp "1.1.1/1.1.$book/1.1.1" ../data
$summary += "1.1.1/1.1.$book/1.1.1  data`n"
foreach($dir in Get-ChildItem -Directory ../data) {
  & sq slurp "1.1.1/1.1.$book/1.1.1" ../data/$dir
  $summary += "1.1.1/1.1.$book/1.1.1 data/$dir`n"
  ++$book
}

$collection = 2
$volume = 1
& sq slurp "1.1.1/$collection.$volume.1/1.1.1" ../graph/edges
$summary += "1.1.1/$collection.$volume.1/1.1.1 graph/edges`n"
++$volume
& sq slurp "1.1.1/$collection.$volume.1/1.1.1" ../graph/nodes
$summary += "1.1.1/$collection.$volume.1/1.1.1 graph/nodes`n"

++$volume
& sq slurp 1.1.1/$collection.$volume.1/1.1.1 ../templates
$summary += "1.1.1/$collection.$volume.1/1.1.1 templates`n"

++$volume
& sq slurp 1.1.1/$collection.$volume.1/1.1.1 ../workspaces
$summary += "1.1.1/$collection.$volume.1/1.1.1 workspaces`n"

& sq update 1.1.1/1.1.1/1.1.1 $summary
& sq save codex.phext

& sq shutdown
