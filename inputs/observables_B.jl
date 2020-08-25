# WET Coefficients
function B_coeff_ll(params)
    #C = collect(values(params))
    #println("C: ", typeof(C))
    cub = params.CuB[1]
    cug = params.CuG[1]
    cuw = params.CuW[1]
    cφu = params.Cφu[1]
    cφq1 = params.Cφq1[1]
    cφq3 = params.Cφq3[1]
    ceu = params.Ceu[1]
    clu = params.Clu[1]
    cqu = params.Cqe[1]
    clq1 = params.Clq1[1]
    clq3 = params.Clq3[1]

    C = [ cub, cug, cuw, cφu, cφq1, cφq3, ceu, clu, cqu, clq1, clq3 ]

    C7  = match_C7(C)
    C8  = match_C8(C)
    C9  = match_C9_ll(C)
    C10 = match_C10_ll(C)

    return [C7, C8, C9, C10]
end

function B_coeff(params)
    #C = collect(values(params))
    #println("C: ", typeof(C))

    cub = params.CuB[1]
    cug = params.CuG[1]
    cuw = params.CuW[1]
    cφu = params.Cφu[1]
    cφq1 = params.Cφq1[1]
    cφq3 = params.Cφq3[1]
    ceu = params.Ceu[1]
    clu = params.Clu[1]
    cqu = params.Cqe[1]
    clq1 = params.Clq1[1]
    clq3 = params.Clq3[1]

    C = [ cub, cug, cuw, cφu, cφq1, cφq3, ceu, clu, cqu, clq1, clq3 ]

    C7  = match_C7(C)
    C8  = match_C8(C)
    C9  = match_C9(C)
    C10 = match_C10(C)

    return [C7, C8, C9, C10]
end


#Observables B -> Xs l l
function BR_Xsee_low(params)
    C = B_coeff_ll(params)
    p = params_BR_BXsll_low()
    return compute_BR(C, p)
end

function BR_Xsee_high(params)
    C = B_coeff_ll(params)
    p = params_BR_BXsll_high()
    return compute_BR(C, p)
end

function AFB_Xsee_low(params)
    C = B_coeff_ll(params)
    p1 = params_BR_BXsll_FB()
    p2 = params_BR_BXsll_low()
    return compute_AFB_B(C, p1, p2)
end

#Observables B -> Xs gamma
function BR_Xsgamma(params)
    C = B_coeff_ll(params)
    p = params_BR_BXsgamma()
    return compute_BR(C, p)
end

#Observables B -> K* gamma
function BR_BKgamma(params)
    C = B_coeff(params)
    p = params_BR_BKgamma()
    return compute_BR(C, p)
end

#Observables B+ -> K* gamma
function BR_BpKgamma(params)
    C = B_coeff(params)
    p = params_BR_BpKgamma()
    return compute_BR(C, p)
end

#Observables B -> K* mu mu
function FL_BKstarmumu_1(params)
    C = B_coeff(params)
    p1 = params_BRFL_BKstarmumu_1()
    p2 = params_BR_BKstarmumu_1()
    return compute_AFB_B(C, p1, p2)
end

function P1_BKstarmumu_1(params)
    C = B_coeff(params)
    p1 = params_BRS3_BKstarmumu_1()
    return compute_P_B(C, p1, 2.)
end

function P2_BKstarmumu_1(params)
    C = B_coeff(params)
    p1 = params_BRS6s_BKstarmumu_1()
    return compute_P_B(C, p1, 8.)
end

function P3_BKstarmumu_1(params)
    C = B_coeff(params)
    p1 = params_BRS9_BKstarmumu_1()
    return compute_P_B(C, p1, -4.)
end

function P4p_BKstarmumu_1(params)
    C = B_coeff(params)
    p1 = params_BRS4_BKstarmumu_1()
    return compute_Pprime_B(C, p1)
end

function P5p_BKstarmumu_1(params)
    C = B_coeff(params)
    p1 = params_BRS5_BKstarmumu_1()
    return compute_Pprime_B(C, p1)
end

function P6p_BKstarmumu_1(params)
    C = B_coeff(params)
    p1 = params_BRS7_BKstarmumu_1()
    return compute_Pprime_B(C, p1)
end

function P8p_BKstarmumu_1(params)
    C = B_coeff(params)
    p1 = params_BRS8_BKstarmumu_1()
    return compute_Pprime_B(C, p1)
end

#Observables B+ -> K+ mu mu
function BR_BpKmumu_1(params)
    C = B_coeff(params)
    p = params_BR_BpKmumu_1()
    return compute_BR(C, p)
end

#Observables B+ -> K*+ mu mu
function BR_BpKstarmumu_1(params)
    C = B_coeff(params)
    p = params_BR_BpKstarmumu_1()
    return compute_BR(C, p)
end

#Observables B -> K mu mu
function BR_BKmumu_1(params)
    C = B_coeff(params)
    p = params_BR_BKmumu_1()
    return compute_BR(C, p)
end

#Observables Bs -> Phi mu mu
function BR_Bsphimumu_1(params)
    C = B_coeff(params)
    p = params_BR_Bsphimumu_1()
    return compute_BR(C, p)
end

function FL_Bsphimumu_1(params)
    C = B_coeff(params)
    p1 = params_FL_Bsphimumu_1()
    p2 = params_BR_Bsphimumu_1()
    return compute_AFB_B(C, p1, p2)
end

function S3_Bsphimumu_1(params)
    C = B_coeff(params)
    p1 = params_S3_Bsphimumu_1()
    p2 = params_BR_Bsphimumu_1()
    return compute_AFB_B(C, p1, p2)
end

function S4_Bsphimumu_1(params)
    C = B_coeff(params)
    p1 = params_S4_Bsphimumu_1()
    p2 = params_BR_Bsphimumu_1()
    return compute_AFB_B(C, p1, p2)
end

function S7_Bsphimumu_1(params)
    C = B_coeff(params)
    p1 = params_S7_Bsphimumu_1()
    p2 = params_BR_Bsphimumu_1()
    return compute_AFB_B(C, p1, p2)
end

#Observables Lambdab -> Lambda mu mu
function BR_Lambdabmumu_1(params)
    C = B_coeff(params)
    p = params_BR_Lambdabmumu_1()
    return compute_BR(C, p)
end

#--------------------------------------------------------------------------

function compute_BR(C, p)
    BR = #=@.=#( p[1] + p[2]*C[1] + p[3]*C[2] + p[4]*C[3]
    + p[5]*C[4] + p[6]*C[1]*C[1] + p[7]*C[1]*C[2]
    + p[8]*C[1]*C[3] + p[9]*C[1]*C[4] + p[10]*C[2]*C[2]
    + p[11]*C[2]*C[3] + p[12]*C[2]*C[4] + p[13]*C[3]*C[3]
    + p[14]*C[3]*C[4] + p[15]*C[4]*C[4] )

    return BR
end

function compute_AFB_B(C, p1, p2)
    n_sm = (p1[1])
    n_lin = (p1[2]*C[1] + p1[3]*C[2] + p1[4]*C[3] + p1[5]*C[4])
    n_quad = (p1[6]*C[1]*C[1] + p1[7]*C[1]*C[2] + p1[8]*C[1]*C[3]
    + p1[9]*C[1]*C[4] + p1[10]*C[2]*C[2] + p1[11]*C[2]*C[3] + p1[12]*C[2]*C[4]
    + p1[13]*C[3]*C[3] + p1[14]*C[3]*C[4] + p1[15]*C[4]*C[4])

    d_sm = p2[1]
    d_lin = (p2[2]*C[1] + p2[3]*C[2] + p2[4]*C[3] + p2[5]*C[4])
    d_quad = (p2[6]*C[1]*C[1] + p2[7]*C[1]*C[2] + p2[8]*C[1]*C[3]
    + p2[9]*C[1]*C[4] + p2[10]*C[2]*C[2] + p2[11]*C[2]*C[3] + p2[12]*C[2]*C[4]
    + p2[13]*C[3]*C[3] + p2[14]*C[3]*C[4] + p2[15]*C[4]*C[4])

    AFB = ( n_sm / d_sm + (n_lin * d_sm - n_sm * d_lin) / d_sm^2
    + ( -n_sm * d_sm * d_quad + n_sm * d_lin^2 - n_lin * d_sm * d_lin
    + d_sm^2 * n_quad ) / d_sm^3 )
    return AFB
end

function compute_Pprime_B(C, p1)
    S2s = compute_BR(C, params_BRS2s_BKstarmumu_1())
    S2c = compute_BR(C, params_BRFL_BKstarmumu_1())

    return compute_BR(C, p1)/(2. * sqrt(S2s * S2c))
end

function compute_P_B(C, p1, x)
    S2s = compute_BR(C, params_BRS2s_BKstarmumu_1())

    return compute_BR(C, p1)/(x*S2s)
end


#------------------ matching ----------------------------------------------
function match_C7( C )
    return  #=@.=#(  - 2.3105 * C[1] + 0.02046 * C[2] + 0.090819 * C[3] ) -0.388072 * C[6]
end

function match_C8( C )
    return  ( - 0.7015 * C[2] + 0.26594 * C[3]  -0.193757 * C[6] )
end

# include factor two for four-fermion coeff, as we induce both muons and electrons
function match_C9_ll( C )
    return (  2.4664 * C[1] - 0.04498 * C[2] + 2.13032 * C[3]
    - 0.221656 * C[4] - 47.4449 * C[5] -44.6948 * C[6]
    - 2.0019 * 2* ( C[7]  + C[8] ) + 432.513 * 2 * ( C[9] + C[10] )
    + 427.337 * 2* C[11]
    )
end

function match_C10_ll( C )
    return  ( 0.076892 * C[2] - 7.39802 * C[3] + 4.49802 *  C[4]
    + 426.013 * C[5] + 414.808 * C[6]  - 2.0019 * 2 * ( C[7] - C[8])
    + 432.513 * 2 * ( C[9] - C[10] ) - 433.686 * 2 * C[11]
    )
end


# here its now either muon or electrons
function match_C9( C )
    return ( 2.4664 * C[1] - 0.04498 * C[2] + 2.13032 * C[3]
    - 0.221656 * C[4] - 47.4449 * C[5] -44.6948 * C[6]
    - 2.0019 * ( C[7]  + C[8] ) + 432.513 * ( C[9] + C[10] )
    + 427.337 * C[11]
    )
end

function match_C10( C )
    return ( 0.076892 * C[2] - 7.39802 * C[3] + 4.49802 *  C[4]
    + 426.013 * C[5] + 414.808 * C[6]  - 2.0019 * ( C[7] - C[8])
    + 432.513 * ( C[9] - C[10] ) - 433.686 * C[11]
    )
end

#------------------ B -> Xs gamma ----------------------------------------------
function params_BR_BXsgamma()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 0.000336098480234567,
     -0.0009933924103794787, -0.00020718442307888992, 0.0, 0.0,
     0.0008165776679190035, 0.00031795137986217944, 1.6263032587282567e-19,
     1.6263032587282567e-19, 4.987993887589637e-05, -5.421010862427522e-20,
     -5.421010862427522e-20, 0.0, 0.0, 0.0
     ]
end

#------------------ B -> Xs l l ----------------------------------------------
function params_BR_BXsll_FB()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -2.674838034935834e-08,
     6.407876036460635e-07, 1.1876286279073394e-07, 4.0013336596133513e-08,
     2.487493279927638e-09,
     3.311355942706311e-11, -3.311355942695723e-11, 9.367022142756267e-13,
     -7.626914941854724e-08, 3.311355942693076e-11, 9.367022143815058e-13,
     -1.4151623343437637e-08, -6.617444900424222e-24, -9.556169165269191e-09,
     0.0 ]
end

function params_BR_BXsll_low()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 1.71 * 10^(-6),
     1.4546923111550206e-07, 3.653278444483228e-08, 1.680550755312396e-07,
     -2.4762835837842227e-07,
     1.072520013181908e-06, 4.0456389748646343e-07, 1.612523389008231e-07,
     5.359174918508457e-12, 4.15385783662667e-08, 3.147291989375248e-08,
     5.359174918296699e-12, 2.9488417377609097e-08, 4.235164736271502e-22,
     2.9569871998762146e-08 ]
end

function params_BR_BXsll_high()
    # SM, C7, C8, C9, C10 + quadratic terms
    [3.016648569044876e-07, 6.294111793169888e-08, 1.702891544802259e-08,
    2.562252485915392e-08, -4.311697582193006e-08, 1.042549642025422e-08,
    5.749574588230234e-09, 7.3490191452241806e-09, -4.2603797186054526e-10,
    3.1758792953244817e-10, 1.8691399514494016e-09, -1.1648858302886715e-10,
    1.804854871260533e-09, 2.1298331430586333e-09, 3.4425946573397825e-09]
end

# B0 -> K* gamma transitions
# differntial BR
function params_BR_BKgamma()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 4.177221633502929e-05,
     -0.0001454053643340452, -2.5890571002428694e-05, 0. , 0.,
     0.00012701388551683598, 4.447637965993121e-05, 0. , 0.,
     4.2179218481604055e-06,  0. , 0.,
     0. , 0.,
     0. ]
end

# B+ -> K* gamma transitions
# differntial BR
function params_BR_BpKgamma()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 4.245043498192585e-05,
     -0.00015220015541542411, -2.7110645002678712e-05, 0. , 0.,
     0.00013695381294912397, 4.795703836485689e-05, 0. , 0.,
     4.548010459458072e-06,  0. , 0.,
     0. , 0.,
     0. ]
end

# B0 -> K* mu mu transitions
# differntial BR
function params_BR_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 4.752937867906299e-08,
     3.318452445291403e-09, 8.724972428899823e-10, 8.81118813262554e-09, -1.399308407451434e-08,
     3.6138396680631667e-08, 1.2870233978876425e-08, 1.0197305970144226e-08, -2.6932740520323317e-14,
     1.2270966343214071e-09, 1.903866506316054e-09, -2.6932740533558207e-14,
     1.6797104577976235e-09, -6.617444900424222e-24,
     1.6703410065571208e-09 ]
end

# FL numerator
function params_BRFL_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 3.564282252653666e-08,
     9.440744767136233e-09, 2.0468347741212727e-09, 8.441793584003795e-09, -9.564315327446822e-09,
     1.427822277466825e-09, 6.166098323475624e-10, 2.5535148180248496e-09, 6.617444900424222e-24,
     7.030934482054422e-11, 5.514254885752372e-10, 0.0,
     1.1416831347546695e-09, 6.617444900424222e-24,
     1.1416831347546695e-09 ]
end

# S3 numerator
function params_BRS3_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -6.24931091613257e-10,
     -1.2613585644456029e-09, -2.2353205492492494e-10, -1.7698088273228927e-10, 2.9155572616562544e-10,
     -2.459720570093869e-10, -9.713782321322594e-11, -2.828208168594659e-10, -3.0942596843472475e-17,
     -1.045271893678042e-11, -5.083207655316618e-11, -3.094259632648459e-17,
     -3.508990062614956e-11, 6.533651019458645e-13,
     -3.509419952279002e-11 ]
end

# S4 numerator
function params_BRS4_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -7.015354154248561e-09,
     -1.124047498582545e-08, -1.9912331571793004e-09, -1.4833345353079797e-09, 3.3030185350927826e-09,
     -3.3833329798787727e-09, -1.3618602120413825e-09, -3.4766266128659933e-09, -2.3496666565127155e-11,
     -1.3949023962085653e-10, -6.321492357900346e-10, -3.308722450212111e-24,
     -3.9427815020651e-10, -3.308722450212111e-24,
     -3.9427815020650837e-10 ]
end

# S5 numerator
function params_BRS5_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -8.837105709939118e-09,
     -2.848039210630847e-08, -5.147039106048143e-09, -5.801731838220067e-09, 2.10975364229757e-09,
     2.4641853530512113e-11, 3.404733797230243e-11, -4.321328497830011e-11, 6.793471155673408e-09,
     1.2319116529687014e-12, 0.0, 1.2285001251853353e-09,
     0.0, 1.385094314708933e-09,
     0.0 ]
end

# S7 numerator
function params_BRS7_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -9.092647491135863e-10,
    1.0339757656912846e-25, 1.110065267356169e-09, 1.550963648536927e-25, 2.1707611962790358e-10,
    2.0679515313825692e-25, -3.101927297073854e-25, -2.0679515313825692e-25, -2.0679515313825692e-25,
    0.0, -2.0679515313825692e-25, -2.650148496423085e-10,
    0.0, -2.0679515313825692e-25,
    1.0339757656912846e-25]
end

# S8 numerator
function params_BRS8_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -2.875021520920421e-10,
    3.148914557678624e-10, 5.106269828269604e-10, -1.0777003027506379e-10, 0.0,
    1.830730804595664e-12, -1.7873669611783844e-12, -1.6583047349766773e-12, 5.169878828456423e-26,
    8.88994013908194e-12, 1.2993299965996746e-10, 5.169878828456423e-26,
    1.7228358480774016e-12, 0.0,
    0.0]
end

# S9 numerator
function params_BRS9_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -3.502438576342841e-11,
    -2.2318846925780273e-11, 5.7857284290271245e-11, -8.935985975869151e-12, 3.2311742677852644e-27,
    1.942945609618756e-14, -1.5349425393941537e-14, -5.961364827863641e-16, -2.5849394142282115e-26,
    5.325030725211935e-13, 1.0612709652906294e-11, -1.2924697071141057e-26,
    -1.2924697071141057e-26, -2.5849394142282115e-26,
    1.2924697071141057e-26]
end

# S2s numerator
function params_BRS2s_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 2.743600579817158e-09,
    -1.4965719183933594e-09, -2.859491719440511e-10, 4.685009556982922e-11, -1.050664421857157e-09,
    8.426216216390537e-09, 2.978222072185412e-09, 1.8526675129046185e-09, -1.821022659158499e-12,
    2.852813310492083e-10, 3.274132624254179e-10, -1.8212091626625535e-12,
    1.255255009387593e-10, 2.0455344958537566e-14,
    1.2643610552009162e-10]
end

#S6s numerator
function params_BRS6s_BKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 5.701360240902285e-10,
    3.125625614434625e-08, 5.5176960232628955e-09, 4.188626148547457e-09, -1.3611317923656532e-10,
    -8.171887465209989e-12, 8.171887465216606e-12, 8.171887465213297e-12, -7.460107612114348e-09,
    -3.516668126769119e-12, 8.171887465213297e-12, -1.316444587247179e-09,
    -4.635976750857691e-12, -9.988777767314866e-10,
    8.271806125530277e-25]
end

# B+ -> K* mu mu transitions
# differntial BR
function params_BR_BpKstarmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 5.155362973541373e-08,
     4.130281644479045e-09, 1.039115678895786e-09, 9.623007818256672e-09, -1.4971282169269763e-08,
     3.8961369187558786e-08, 1.3870300532493318e-08, 1.1027834822713577e-08, -2.0280222407538128e-14,
     1.324518374560754e-09, 2.102325554996093e-09, -2.0280222420773018e-14,
     1.7732041388972147e-09, 5.392134299388172e-11,
     1.7633710515803325e-09 ]
end

# B0 -> K mu mu transitions
# differntial BR
function params_BR_BKmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 3.239520292833268e-08,
     6.5989289989370834e-09, 1.5230686022088685e-09, 7.704008875114717e-09, -8.320842687995988e-09,
     7.275402600358629e-10, 3.346567704989401e-10, 1.6987480394038138e-09, 0.0,
     4.041347920134105e-11, 3.9068962535163686e-10, 0.0,
     9.91610304116388e-10, -6.617444900424222e-24,
     9.932510000553996e-10 ]
end

# B+ -> K mu mu transitions
# differntial BR
function params_BR_BpKmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 3.491200391085207e-08,
     7.1167176475441656e-09, 1.6387783850310562e-09, 8.302556355423358e-09, -8.967033084221635e-09,
     7.851633364071412e-10, 3.6032398821746925e-10, 1.8319801318565598e-09, 0.0,
     4.3415694693799444e-11, 4.203536316209443e-10, 0.0,
     1.0686158886001172e-09, 6.617444900424222e-24,
     1.0703861270303711e-09 ]
end

# Bs -> phi mu mu transitions
# differntial BR
function params_BR_Bsphimumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 5.390032165100539e-08,
     2.962959187453667e-09, 8.868200095793657e-10, 1.0322406284933276e-08, -1.5433068333114975e-08,
     3.5708939450017795e-08, 1.271411909438617e-08, 1.0068528391778636e-08, -4.680112008364234e-14,
     1.209639965950407e-09, 1.901947980215219e-09, -4.6801120090259786e-14,
     1.8509530814009674e-09, 1.9852334701272664e-23,
     1.842230544498075e-09 ]
end

function params_FL_Bsphimumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 4.2227730191777086e-08,
     1.0526236839374221e-08, 2.3162538280948625e-09, 1.0010759920795973e-08, -1.1249164759660691e-08,
     1.4845854716034801e-09, 6.502641921052003e-10, 2.8237935821981664e-09, -1.3234889800848443e-23,
     7.510587959326042e-11, 6.185491237169165e-10, 0.0,
     1.342801993293283e-09, 1.3234889800848443e-23,
     1.3428019932932963e-09 ]
end

function params_S3_Bsphimumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -4.134218486863766e-10,
     -1.7533644258125275e-09, -3.1337365541538665e-10, -2.0371593950133435e-10, 2.3273428142269934e-10,
     7.94405367662984e-10, 2.6558931773817923e-10, -1.2433679899925132e-10, -5.707984808116424e-17,
     2.419815388528968e-11, -2.3356188690511305e-11, -1.1669225756959165e-17,
     -2.7979155786000615e-11, 4.4974506204070166e-13,
     -2.7980341811666064e-11 ]
end

function params_S4_Bsphimumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -7.130285569581526e-09,
     -1.1780468524105007e-08, -2.087736958013803e-09, -1.5149099902690982e-09, 3.4065344060335062e-09,
     -3.3088924444373002e-09, -1.350350825405657e-09, -3.5900539341158195e-09, -2.8162529080910868e-11,
     -1.3881327598378004e-10, -6.53394136350055e-10, -4.1359030627651384e-24,
     -4.0663474030066143e-10, -8.271806125530277e-25,
     -4.0663474030066143e-10 ]
end

function params_S7_Bsphimumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -1.0900101658619493e-09,
     -2.0679515313825692e-25, 1.170690657080444e-09, 1.0339757656912846e-25, 2.602269332347352e-10,
     2.0679515313825692e-25, -2.0679515313825692e-25, -4.1359030627651384e-25, 0.0,
     5.498166364143693e-14, -8.271806125530277e-25, -2.795015649486155e-10,
     4.1359030627651384e-25, 0.0,
     0.0 ]
end

# Lambdab -> Lambda mu mu transitions
function params_BR_Lambdabmumu_1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 7.105329332677136e-08,
     2.1631923265933935e-08, 4.1338931437019434e-09, 0.0, 0.0,
     3.95025269718728e-09, 1.4495736312853334e-09, 0.0, 0.0,
     1.4308834544453859e-10, 0.0, 0.0,
     0.0, 0.0,
     0.0 ]
end
