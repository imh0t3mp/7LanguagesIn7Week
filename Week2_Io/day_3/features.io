#!/usr/bin/env io

// Увы, оказалось, что реализация IO не умеет работать с HTTPS ссылками
futureResult := URL with("http://center.dsi.srv") @fetch
writeln("Do something immediately while fetch goes on in background...")
writeln("This will block until the result is available.")
// this line will execute immediately

writeln("fetched ", futureResult size, " bytes")
// this will block until the computation is complete
// and Io prints the value
