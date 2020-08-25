using BAT
using JLD2
using Plots
using FileIO
using Measures
using EFTfitter
using IntervalSets

include("../helper/overlay.jl")
include("../helper/overview.jl")

parameters = BAT.NamedTupleDist(
    CuB  = -1..1,
    CuG  = -1..1,
    CuW  = -1..1,
    Cφq1 = -1..1,
    Cφq3 = -1..1,
    Cφu  = -1..1,
    Clu  = -1..1,
    Ceu  = -1..1,
    Cqe  = -1..1,
    Clq1 = -1..1,
    Clq3 = -1..1,
)

param_labels = BAT.all_active_names(BAT.varshape(parameters))
nparams = BAT.vardof(parameters)

color_B = :grey84
color_T = :steelblue2
color_c = :royalblue4


samples = Dict()
for c in ["onlyB", "onlyTop", "combined"]
    samples[c] = load("/samples/"*c*".jld2")[c]
end

samples_arr = [samples["onlyB"], samples["onlyTop"], samples["combined"]]


xw = 2000/11*nparams
yw = 1500/11*nparams

pyplot()

#--------- BAT default plot for each set (top, B, combined) -----------
p = plot(samples["onlyB"], vsel=collect(1:11), size = (xw, yw), left_margin=5mm, bottom_margin=5mm, lower=Dict("seriestype"=>:smallest_intervals_contourf, "bins"=>50), upper=Dict("seriestype"=>:smallest_intervals_contourf, "bins"=>50))
savefig(p, "/plots/onlyB.pdf")

p = plot(samples["onlyTop"], vsel=collect(1:11), size = (xw, yw), left_margin=5mm, bottom_margin=5mm, lower=Dict("seriestype"=>:smallest_intervals_contourf, "bins"=>50), upper=Dict("seriestype"=>:smallest_intervals_contourf, "bins"=>50))
savefig(p, "/plots/onlyTop.pdf")

p = plot(samples["combined"], vsel=collect(1:11), size = (xw, yw), left_margin=5mm, bottom_margin=5mm, lower=Dict("seriestype"=>:smallest_intervals_contourf, "bins"=>50), upper=Dict("seriestype"=>:smallest_intervals_contourf, "bins"=>50))
savefig(p, "/plots/combined.pdf")


#---------- 2D overlay plot ---------------
plot_overlay(samples_arr, 1,  2;
     order=1:length(samples),
     p=0.9,
     xlims = (-1, 1),
     ylims = (-1, 1),
     param_labels = param_labels,
     labels=["only B", "only Top", "combined"],
     seriestypes=[:smallest_intervals, :smallest_intervals, :smallest_intervals],
     bins=[200, 200, 200],
     alphas=[1, 1, 1],
     colors=[color_B, color_T, color_c],
 )



 #---------- matrix plot with lower triangle as overlay & upper triangle combined ------------
 xw = 4000/11*nparams
 yw = 3000/11*nparams
 tfs= 10
 margin = 2mm
 linewidth = 6

 p = plot(layout=nparams^2, legend=false, size=(xw, yw), margin=margin, xtickfontsize=tfs,ytickfontsize=tfs, xguidefontsize=20, yguidefontsize=20)
 for i in 1:nparams
     # diagonal
     p = plot!(samples["combined"], i, subplot = i + (i-1)*nparams)


     # lower left
     for j in i+1:nparams
         p = plot!(samples_arr, i,  j;
             subplot = i + (j-1)*nparams,
             order=1:length(samples_arr),
             p=0.9,
             xlims = (-1, 1),
             ylims = (-1, 1),
             param_labels = param_labels,
             labels=["only B", "only Top", "combined"],
             seriestypess = [:smallest_intervals_contourf, :smallest_intervals_contourf, :smallest_intervals_contourf],
             bins=[20, 20, 20],
             alphas=[0.8, 0.6, 0.6],
             colors=[color_B, color_T, color_c],
             linewidth=0.2
         )
     end

     # upper right
     for j in i+1:nparams
         p = plot!(samples["combined"], (j,  i);
             st = :smallest_intervals_contourf,
             intervals = [0.9],
             colors=[color_c],
             alpha = 0.8,
             linewidth=0.6,
             nbins = 20,
             subplot = j + (i-1)*nparams,
             globalmode=false,
             localmode=false
         )

         p = plot!([0], [0],
            label="SM",
            linewidth = 0,
            seriestype = :scatter,
            markershape=:star,
            markerstrokecolor="#595959",#:black,
            markerstrokewidth=0.7,
            markersize=12,
            subplot = j + (i-1)*nparams,
            markercolor=:white)
     end
 end
 
 savefig(p, "/plots/overlays_2d.pdf")



 #-------- 1D marginals for top, B & combined -------------------------------------

 pyplot(size=(500, 400))

 linewidth = 8
 xlims = (-1, 1)
 ylims = (-nparams-0.8, 1)

 p = plot(samples_arr, 0.9, 
    atol=0.1, Δy = 0.15, colors=[:grey75, color_T, color_c], 
    xlims=xlims, legendfontsize = 8, ylims=ylims, 
    sample_labels = ["only B", "only Top", "combined"], 
    linewidth=linewidth
)
 savefig(p, "/plots/1d.pdf")


