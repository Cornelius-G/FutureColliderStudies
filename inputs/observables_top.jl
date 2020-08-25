#------------ tt  ----------------------------------------------
function CS_tt(params)
    cug = params.CuG[1] * 1000^2 / 246^2
    return compute_tt_LHC(cug)
end

function compute_tt_LHC(C)
    p = params_tt_xsc()
    cross_section = #=@.=#( p[1] + p[2] * C +   p[3] *  C^2)
    return cross_section
end

function params_tt_xsc()
    # SM @ NNLO, Cug, CuG^2
    return [ 832, 138.5, 20.46 ]
end

#------------ ttZ ----------------------------------------------
function CS_ttZ(params)
    cub = params.CuB[1] * 1000^2 / 246^2
    cug = params.CuG[1] * 1000^2 / 246^2
    cuw = params.CuW[1] * 1000^2 / 246^2
    cφu = params.Cφu[1] * 1000^2 / 246^2
    cφq1 = params.Cφq1[1] * 1000^2 / 246^2
    cφq3 = params.Cφq3[1] * 1000^2 / 246^2

    θw = 28.13
    sw = sind(θw)
    cw = cosd(θw)
    cuz = cw*cuw - sw*cub
    cφqm = cφq1 - cφq3

    return compute_ttZ([ cφqm, cφq3, cφu, cuw, cuz, cug ])
end

function compute_ttZ(C)
    p = params_ttZ_xsec()
    cross_section = #=@.=#( p[1] + p[2] * C[1] +   p[3] * C[2] +  p[4] * C[3]
    +  p[5] * C[4] +  p[6] * C[5] +  p[7] * C[6] + p[8] * C[1] * C[1]
    + p[9] * C[1] * C[2] + p[10] * C[1] * C[3] + p[11] * C[1] * C[4]
    + p[12] * C[1] * C[5] + p[13] * C[1] * C[6] + p[14] * C[2] * C[2]
    + p[15] * C[2] * C[3] + p[16] * C[2] * C[4] + p[17] * C[2] * C[5]
    + p[18] * C[2] * C[6] + p[19] * C[3] * C[3] + p[20] * C[3] * C[4]
    + p[21] * C[3] * C[5] + p[22] * C[3] * C[6] + p[23] * C[4] * C[4]
    + p[24] * C[4] * C[5] + p[25] * C[4] * C[6] + p[26] * C[5] * C[5]
    + p[27] * C[5] * C[6] + p[28] * C[6] * C[6] )

    return cross_section
end

function params_ttZ_xsec()
    # SM, CφM, CφQ3, Cφu, CuW, CuZ, CuG + quadratic terms
    return [ 0.843,
     -0.05999706937, 0 , 0.038984827637, 0.002423246514,
     -0.001174903712, 0.1787,
     0.00236712023, 0.0023778238, 0.00338169591, 0.0060562865,
     0.05192415, 0.11855122976, 0 , 0.00236794139, 0.003891, 0.0495679 ,
     0.1258851, 0.00237170225, 0.00622616526, 0.05168958, 0.1362,
     0.049177625, 0.049218786, 0.13006669, 0.04935692, 0.18137609, 0.126 ]
end

#------------ ttgamma ----------------------------------------------
function tta_13_1l(params)
    cub = params.CuB[1]
    cug = params.CuG[1]
    cuw = params.CuW[1]

    θw = 28.13
    sw = sind(θw)
    cw = cosd(θw)
    cuz = cw*cuw - sw*cub
    fiducial_xsec_1l_uz([cug, cuw, cuz])
end

function tta_13_2l(params)
    cub = params.CuB[1]
    cug = params.CuG[1]
    cuw = params.CuW[1]

    θw = 28.13
    sw = sind(θw)
    cw = cosd(θw)
    cuz = cw*cuw - sw*cub
    fiducial_xsec_2l_uz([cug, cuw, cuz])
end

# multiply interpolation of total xsec with fid. acceptance (eff)
# and add "k-factor" for SM correction
function fiducial_xsec_1l_uz(C)
    k_1l = 83.4665999459313
    fit_eff_param_1l =  params_fidacc_1l()
    interpol_noacc_param = params_total_xsec()

    return eff(C, fit_eff_param_1l) .* quadratic_model(C, interpol_noacc_param) .+ k_1l
end

function fiducial_xsec_2l_uz(C)
    k_2l = 16.593634484408483
    fit_eff_param_2l = params_fidacc_2l()
    interpol_noacc_param = params_total_xsec()

    return eff(C, fit_eff_param_2l) .* quadratic_model(C, interpol_noacc_param) .+ k_2l
end

# fiducial acceptance
function eff(C, e)
    s = params_total_xsec()
    denominator = quadratic_model(C, s)

    numerator = (e[1]*s[1]*C[1]^0*C[2]^0*C[3]^0
    + e[2]*s[2]*C[1]^0*C[2]^0*C[3]^1
    + e[3]*s[3]*C[1]^0*C[2]^0*C[3]^2
    + e[4]*s[4]*C[1]^0*C[2]^1*C[3]^0
    + e[5]*s[5]*C[1]^0*C[2]^1*C[3]^1
    + e[6]*s[6]*C[1]^0*C[2]^2*C[3]^0
    + e[7]*s[7]*C[1]^1*C[2]^0*C[3]^0
    + e[8]*s[8]*C[1]^1*C[2]^0*C[3]^1
    + e[9]*s[9]*C[1]^1*C[2]^1*C[3]^0
    + e[10]*s[10]*C[1]^2*C[2]^0*C[3]^0
    )

    return numerator ./ denominator
end

function quadratic_model(C, p)
# C[1]=CuB, C[1]=CuG, C[3]=CuW, p=model parameter
(p[1]*C[1]^0*C[2]^0*C[3]^0
+ p[2]*C[1]^0*C[2]^0*C[3]^1
+ p[3]*C[1]^0*C[2]^0*C[3]^2
+ p[4]*C[1]^0*C[2]^1*C[3]^0
+ p[5]*C[1]^0*C[2]^1*C[3]^1
+ p[6]*C[1]^0*C[2]^2*C[3]^0
+ p[7]*C[1]^1*C[2]^0*C[3]^0
+ p[8]*C[1]^1*C[2]^0*C[3]^1
+ p[9]*C[1]^1*C[2]^1*C[3]^0
+ p[10]*C[1]^2*C[2]^0*C[3]^0
)
end

# return interpolated params of the total ttgamma xsec
function params_total_xsec()
    return [4787.8319388679765,
    -633.3295852678285, 44776.40427336053, 26525.758407582485,
    -102898.33073686132, 105571.83244747801, 20441.62967975978,
    -8672.01708116833, 64965.31092132101, 51975.059043423]
end

# return interpolated params of the fiducial acceptance for 1l channel
function params_fidacc_1l()
    return [0.08595401954550866,
    0.24342261870353674, 0.23993945397597446, 0.08809735354860272,
    0.24064846695181866, 0.17129137428997598, 0.08453761417847493,
    0.2571572039502875, 0.11016589914607273, 0.10102226849696228]
end

# return interpolated params of the fiducial acceptance for 2l channel
function params_fidacc_2l()
    return [0.009692563587886447,
    0.033888295517009774, 0.03449018812722143, 0.009783980567815086,
    0.034513685692849204, 0.02325508722794946, 0.009675837700450662,
    0.03244596927889461, 0.012879539083145979, 0.011071966195759704]
end


#------------ W Helicities ----------------------------------------------
function F0(params)
    sm = 0.687
    C = params.CuW[1]
    return BSM_F0(sm, C)
end

function FL(params)
    sm = 0.311
    C = params.CuW[1]
    return BSM_FL(sm, C)
end

function BSM_F0(sm, C)
    return sm + 1.00297 * C - 0.913038 * C^2
end

function BSM_FL(sm, C)
    return sm - 1.00297 * C + 0.913038 * C^2
end
