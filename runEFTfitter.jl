using BAT
using JLD2
using FileIO
using EFTfitter
using IntervalSets
using Plots#, Measures

#---------------------------------------------------------------------------
parameters = BAT.NamedTupleDist(
    CuB  = -1.0..1.0,
    CuG  = 0,#-1.0..1.0,
    CuW  = 0,#-1.0..1.0,
    Cφq1 = 0,#-1.0..1.0,
    Cφq3 = 0,#-1.0..1.0,
    Cφu  = 0,#-1.0..1.0,
    Clu  = 0,#-1.0..1.0,
    Ceu  = 0,#-1.0..1.0,
    Cqe  = 0,#-1.0..1.0,
    Clq1 = 0,#-1.0..1.0,
    Clq3 = 0,#-1.0..1.0,
)


use_B      = true
use_LHCb   = false
use_HL     = false
use_top    = false
use_Belle2 = false
use_CLIC   = false

include("inputs/measurements.jl")
#--------------------------------------------------------------------------

n_params = BAT.vardof(parameters)

m = EFTfitter.My_EFTfitterModel(parameters, measurements, correlations)

likelihood = EFTfitterDensity(m)
posterior = PosteriorDensity(likelihood, parameters)

n_chains = 4
n_samples = 10^5
algorithm = MetropolisHastings()
@time samples = bat_sample(posterior, (n_samples, n_chains), algorithm).result

#save("samples/CLIC-Only/dof.jld2", "dof", samples)


pyplot()
p = plot!(size=(7000, 5000), dpi=400)
p = plot(samples, vsel=collect(1:n_params))

savefig(p, "plot.png")


#samples_loaded =  load("../../../Dropbox/Top-future/new/test.jld", "name_of_samples")
