using WAV
using Plots

if length(ARGS) < 1
    println("usage: julia plot_wav.jl <Inpu file path>")
    exit()
end

y, fs = wavread(ARGS[1])
plot(y)

# スクリプト内でplot()を実行すると、プロットのウィンドウが表示されずにJuliaが終了してしまう。
# plot()の後に以下を書いた上で、juliaコマンドにオプション-iを付けて実行すればプロットが表示される。
# RやPythonみたいに、何もしなくてもそうなってくれるとありがたいのだけれど…
gui()
