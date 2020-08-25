using StatsBase
function get_coeff_names(samples::DensitySampleVector)
    coeff_names = collect(string.(keys(BAT.varshape(samples))))
    coeff_names = [coeff_names[i] for i in 1:length(coeff_names) if BAT.varshape(samples)._accessors[i].len != 0]
    return coeff_names
end


@recipe function f(
    samples::DensitySampleVector,
    p::Float64;
    Δy = 0,
    atol = 0,
    bins = 200,
    closed = :left,
    coeff_names = get_coeff_names(samples),
    yys = collect(1:length(coeff_names))*-1
)
    ussamples = BAT.unshaped.(samples)
    for i in 1:length(yys)
        h = StatsBase.fit(Histogram, BAT.flatview(ussamples.v)[i, :], BAT.FrequencyWeights(ussamples.weight), nbins = bins, closed = :left)
        hp, real_int = BAT.get_smallest_intervals(h, [p])

        lower, upper =  BAT.get_interval_edges(hp[1], atol=atol)
        w = 0.5*(upper-lower)
        middle = lower .+ w

        @series begin
            seriestype --> :path
            markerstrokealpha := 0
            linewidth := 0
            markerstrokewidth --> 1
            markersize --> 5
            seriescolor --> :steelblue
            xerror := w
            yticks --> (yys, coeff_names)
            label --> ""
            xguide --> "Ci"

            (middle, [yys[i]].-Δy)
        end
    end
end





@recipe function f(
    samples::Vector{T} where T<:DensitySampleVector,
    p::Float64;
    Δy = 0.22,
    atol = zeros(length(samples)),
    bins = 200,
    closed = :left,
    coeff_names = get_coeff_names(samples[1]),
    sample_labels = ["samples $i" for i in 1:length(samples)],
    colors = collect(1:length(samples))
)

    isa(atol, Real) ? atol=ones(length(samples))*atol : nothing
    dy1 = [Δy * i for i in 1:(length(samples)/2)]
    dy = length(samples)%2 ==0 ? vcat(-dy1/2, dy1/2) : vcat(-dy1, [0], dy1)

    seriestype = get(plotattributes, :seriestype, :all)

    for i in 1:length(samples)

        @series begin
            label --> sample_labels[i]
            legend --> true
            seriescolor --> colors[i]
            linewidth := 0.01
            markerstrokewidth:=0.01

            [0, 0], [-1, -1]
        end


        @series begin
            Δy --> dy[i]
            atol --> atol[i]
            seriescolor --> colors[i]
            label --> ""
            coeff_names --> coeff_names

            samples[i], p
        end
    end

end



@recipe function f(
    samples::Array{BAT.StructArrays.StructArray{T,1,C,CartesianIndex{1}} where C<:Union{Tuple, NamedTuple} where T,1},
    p::Float64;
    Δy = 0,
    atol = zeros(length(samples)),
    bins = 200,
    closed = :left,
    coeff_names = get_coeff_names.(samples),
    sample_label = "samples"
)
    coeff_names = [c[1] for c in coeff_names]

    isa(atol, Real) ? atol=ones(length(samples))*atol : nothing
    dy1 = [Δy * i for i in 1:(length(samples)/2)]
    dy = length(samples)%2 ==0 ? vcat(-dy1/2, dy1/2) : vcat(-dy1, [0], dy1)

    seriestype = get(plotattributes, :seriestype, :all)


    for i in 1:length(samples)
        println("i: $i")
        @series begin
            Δy --> dy[i]
            atol --> atol[i]
            label := ""
            coeff_names --> coeff_names[i]
            yys --> [i]

            samples[i], p
        end
    end

    @series begin
        label --> sample_label
        legend --> true
        yticks --> (1:length(samples), coeff_names)

        [0, 0], [-1, -1]
    end

end
