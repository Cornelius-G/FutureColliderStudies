function plot_overlay(
    samples,
    i,
    j;
    order=1:length(samples),
    p=0.9,
    param_labels = [],
    labels=[],
    seriestypes=[],
    bins=[],
    alphas=[],
    colors=[],
    xlims = (-1, 1),
    ylims = (-1, 1),
)
    Plots.plot()

    # individual samples
    for k in order
        p = Plots.plot!(
            samples[k], (i,j),
            seriestype=seriestypes[k],
            intervals=[0.9],
            colors=[colors[k]],
            bins=bins[k],
            localmode=false,
            fillalpha = alphas[k],
            legendfontsize=12,
            guidefontsize=22,
            tickfontsize = 18,
            xlims=xlims,
            ylims=ylims,
            xlabel=param_labels[i],
            ylabel=param_labels[j],
            label=""
        )
    end


    # SM point
     p = Plots.plot!([0], [0],
        label="SM",
        linewidth = 0,
        seriestype = :scatter,
        markershape=:star,
        markerstrokecolor="#595959",#:black,
        markerstrokewidth=0.7,
        markersize=12,
        markercolor=:white)

    # fake legend
    for k in order
        p = Plots.plot!([0], [0],
            label=labels[k],
            seriestype = :shape,
            markershape=:square,
            markersize=10,
            fillcolor=colors[k],
            linewidth=0,
            fillalpha=alphas[k]
        )
    end
    return p
end


# 1D
function plot_overlay(
    samples,
    i;
    order=1:length(samples),
    p=0.9,
    param_labels = [],
    labels=[],
    seriestypes=[],
    bins=[],
    alphas=[],
    colors=[],
    xlims = (-1, 1)
)
    Plots.plot()

    # individual samples
    for k in order
        println(labels[k])
        p = Plots.plot!(
            samples[k], i,
            seriestype=seriestypes[k],
            intervals=[0.9],
            colors=[colors[k]],
            bins=bins[k],
            localmode=false,
            fillalpha = alphas[k],
            legendfontsize=12,
            guidefontsize=22,
            tickfontsize = 18,
            xlims=xlims,
            xlabel=param_labels[i],
            interval_labels=[labels[k]]
        )
    end


    return p
end
