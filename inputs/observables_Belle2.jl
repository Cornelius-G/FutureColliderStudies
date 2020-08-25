#Observables B -> Xs l l
function BR_Xsee_low1(params)
    C = B_coeff(params)
    p = params_BR_BXsll_low1()
    return compute_BR(C, p)
end

function BR_Xsee_low2(params)
    C = B_coeff(params)
    p = params_BR_BXsll_low2()
    return compute_BR(C, p)
end

function BR_Xsee_high(params)
    C = B_coeff_ll(params)
    p = params_BR_BXsll_high()
    return compute_BR(C, p)
end

function AFB_Xsee_low1(params)
    C = B_coeff(params)
    p1 = params_BR_BXsll_FB_low1()
    p2 = params_BR_BXsll_low1()
    return compute_AFB_B(C, p1, p2)
end

function AFB_Xsee_low2(params)
    C = B_coeff(params)
    p1 = params_BR_BXsll_FB_low2()
    p2 = params_BR_BXsll_low2()
    return compute_AFB_B(C, p1, p2)
end

function AFB_Xsee_high(params)
    C = B_coeff(params)
    p1 = params_BR_BXsll_FB_high()
    p2 = params_BR_BXsll_high()
    return compute_AFB_B(C, p1, p2)
end

#Observables B -> K* mu mu
function P1_BKstarmumu_Belle(params)
    C = B_coeff(params)
    p1 = params_BRS3_BKstarmumu_Belle()
    return compute_P_Belle(C, p1, 2.)
end

function P2_BKstarmumu_Belle(params)
    C = B_coeff(params)
    p1 = params_BRS6s_BKstarmumu_Belle()
    return compute_P_Belle(C, p1, 8.)
end

function P3_BKstarmumu_Belle(params)
    C = B_coeff(params)
    p1 = params_BRS9_BKstarmumu_Belle()
    return compute_P_Belle(C, p1, -4.)
end

function P4p_BKstarmumu_Belle(params)
    C = B_coeff(params)
    p1 = params_BRS4_BKstarmumu_Belle()
    return compute_Pprime_Belle(C, p1)
end

function P5p_BKstarmumu_Belle(params)
    C = B_coeff(params)
    p1 = params_BRS5_BKstarmumu_Belle()
    return compute_Pprime_Belle(C, p1)
end

function P6p_BKstarmumu_Belle(params)
    C = B_coeff(params)
    p1 = params_BRS7_BKstarmumu_Belle()
    return compute_Pprime_Belle(C, p1)
end

function P8p_BKstarmumu_Belle(params)
    C = B_coeff(params)
    p1 = params_BRS8_BKstarmumu_Belle()
    return compute_Pprime_Belle(C, p1)
end

#------------------------------------------------------------------------------

function compute_P_Belle(C, p1, x)
    S2s = compute_BR(C, params_BRS2s_BKstarmumu_Belle())

    return compute_BR(C, p1)/(x*S2s)
end

function compute_Pprime_Belle(C, p1)
    S2s = compute_BR(C, params_BRS2s_BKstarmumu_Belle())
    S2c = compute_BR(C, params_BRFL_BKstarmumu_Belle())

    return compute_BR(C, p1)/(2. * sqrt(S2s * S2c))
end

#------------------------------------------------------------------------------
function params_BR_BXsll_low1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 9.429824363282286e-07,
     -1.3126421582620103e-07, -1.8622621185704055e-08, 8.504962186783876e-08,
     -1.319798242058443e-07,
     8.049881779871588e-07, 3.019139928046787e-07, 9.411617591435554e-08, 0.0,
     3.157334340214839e-08, 1.835007987625852e-08, 0.0, 1.574271190519017e-08,
     0.0, 1.576001445772234e-08
     ]
end

function params_BR_BXsll_low2()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 7.639652769280364e-07,
    2.7726069130851973e-07, 5.5413756459559324e-08, 8.300327153723615e-08,
    -1.1564862362915504e-07,
    2.684299491623336e-07, 1.0311581359434332e-07, 6.715453849277117e-08, 0.0,
    1.0914939581609726e-08, 1.3131072011629534e-08, 0.0, 1.3745716154633274e-08,
    0.0, 1.3809868223255849e-08
    ]
end

function params_BR_BXsll_high()
    # SM, C7, C8, C9, C10 + quadratic terms
    [3.016648569044876e-07, 6.294111793169888e-08, 1.702891544802259e-08,
    2.562252485915392e-08, -4.311697582193006e-08, 1.042549642025422e-08,
    5.749574588230234e-09, 7.3490191452241806e-09, -4.2603797186054526e-10,
    3.1758792953244817e-10, 1.8691399514494016e-09, -1.1648858302886715e-10,
    1.804854871260533e-09, 2.1298331430586333e-09, 3.4425946573397825e-09]
end

function params_BR_BXsll_FB_low1()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -7.602441856882815e-08,
     3.6702153672207317e-07, 6.745681121245215e-08, 1.6066478411618308e-08,
     8.702191194874811e-09,
     2.6469779601696886e-23, -1.3234889800848443e-22, -5.293955920339377e-23,
     -4.3968263043404895e-08, 1.3234889800848443e-23, -2.6469779601696886e-23,
     -8.074484378888642e-09, 0.0, -3.837070303364955e-09,
     0.0 ]
end

function params_BR_BXsll_FB_low2()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 4.9271357594393694e-08,
     2.738151580382199e-07, 5.131597362023504e-08, 2.394682188857476e-08,
     -6.214115427348436e-09,
     -6.617444900424222e-24, -2.2904283514654888e-11, -6.617444900424222e-24,
     -3.2302904911259456e-08, -1.9600772146659557e-12, -3.3087224502121107e-23,
     -6.0737070122390714e-09,  1.9852334701272664e-23, -5.71909019354077e-09,
     1.3234889800848443e-23 ]
end

function params_BR_BXsll_FB_high()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -1.9712742662480806e-08,
     -1.5585399427803514e-08, 8.795601387907496e-10, -4.0053077419884e-09,
     2.2701089498343064e-09,
     6.486238685439117e-10, -1.486289738768697e-10, 3.30671352532617e-10,
     1.9223519453659964e-09, 6.924164655789692e-11, -9.693395487126871e-11,
     -1.7592251392310523e-10, 2.5485591776229416e-10, 6.379999902857353e-10,
     1.9575906346944582e-10 ]
end

function params_BR_BXsll_high()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 3.016648569044876e-07,
     6.294111793169888e-08, 1.702891544802259e-08, 2.562252485915392e-08,
     -4.311697582193006e-08,
     1.042549642025422e-08, 5.749574588230234e-09, 7.3490191452241806e-09,
     -4.2603797186054526e-10, 3.1758792953244817e-10, 1.8691399514494016e-09,
     -1.1648858302886715e-10, 1.804854871260533e-09, 2.1298331430586333e-09,
      3.4425946573397825e-09 ]
end

#Observables B -> K* mu mu
function params_BRFL_BKstarmumu_Belle()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 3.569869290341783e-08,
     9.49308641187975e-09, 1.978490422502483e-09, 8.464403022355612e-09, -9.51154846325952e-09,
     1.42810716723292e-09, 5.936138921111384e-10, 2.546720875418404e-09, 0.0,
     6.533934740289349e-11, 5.292993103571107e-10, 6.617444900424222e-24,
     1.1353844048556627e-09, 0.0,
     1.1353844048556429e-09 ]
end

function params_BRS3_BKstarmumu_Belle()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -1.242240939350347e-09,
     -1.292851488039826e-09, -2.3210737209928514e-10, -3.0528810489583606e-10, 4.37412591155048e-10,
     -2.927447106032579e-10, -1.1324591848766281e-10, -3.2936815812440823e-10, 4.1359030627651384e-25,
     -1.1623333958184501e-11, -6.018323581745558e-11, -4.1359030627651384e-25,
     -5.221352090075557e-11, 0.0,
     -5.221352090075392e-11 ]
end

function params_BRS4_BKstarmumu_Belle()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -1.1252479270771974e-08,
     -9.793245290059623e-09, -1.7680365131205806e-09, -2.549887725548749e-09, 4.013102395944477e-09,
     -2.688731301185193e-09, -1.0371168324595802e-09, -2.935088365106583e-09, -2.9196249978556487e-13,
     -1.0607952565072517e-10, -5.37788772149484e-10, -2.9196249978556487e-13,
     -4.790227530469118e-10, 8.417311244989197e-14,
     -4.788767717970182e-10]
end

function params_BRS5_BKstarmumu_Belle()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -1.69205795949059e-08,
     -2.3481591003900286e-08, -4.2716686386812935e-09, -6.950441180994936e-09, 4.03958667032677e-09,
     2.6153712989667867e-14, 1.2753241837216056e-13, -5.0063654608099173e-14, 5.605943687401081e-09,
     0.0, -6.082480306512115e-13, 1.019809965496974e-09,
     0.0, 1.6593349766866318e-09,
     0.0]
end

function params_BRS7_BKstarmumu_Belle()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -6.716669441298882e-10,
     5.169878828456423e-26, 7.913059104088526e-10, -1.0339757656912846e-25, 1.6035247605957084e-10,
     -1.0339757656912846e-25, 0.0, 3.101927297073854e-25, -1.0339757656912846e-25,
     1.0339757656912846e-25, -1.0339757656912846e-25, -1.8891485305862358e-10,
     1.0339757656912846e-25, 0.0,
     1.0339757656912846e-25]
end

function params_BRS8_BKstarmumu_Belle()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -2.5403764639388617e-10,
     -1.720883853400761e-10, 3.7888147794491176e-10, -8.073450643905164e-11, -2.5849394142282115e-26,
     2.0025127497249666e-15, -2.0025127497766654e-15, -3.57479197715797e-15, -5.169878828456423e-26,
     4.120456021744652e-12, 9.418275696036051e-11, -5.169878828456423e-26,
     -5.169878828456423e-26, 5.169878828456423e-26,
     5.169878828456423e-26]
end

function params_BRS9_BKstarmumu_Belle()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ -3.545409384124169e-11,
     -2.311142226840436e-11, 5.286682934758515e-11, -1.0008463112833742e-11, -3.2311742677852644e-27,
     -1.1686757380294111e-15, -1.7882840468411887e-16, 4.52364397489937e-26, -6.462348535570529e-27,
     4.770183660673184e-13, 1.097221690651477e-11, -6.462348535570529e-27,
     -8.504347311681892e-16, 6.462348535570529e-27,
     6.462348535570529e-27]
end

function params_BRS2s_BKstarmumu_Belle()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 3.4948832885554108e-09,
    2.530397720563918e-09, 4.360978955385674e-10, 5.029336623650442e-10, -1.4807820499676146e-09,
    4.933328883468176e-09, 1.748975667571398e-09, 1.8517325109591713e-09, -1.594602064264384e-15,
    1.675683926939967e-10, 3.2834735242759145e-10, -1.594602064264384e-15,
    1.767724713150675e-10, -2.0679515313825692e-24,
    1.7666406630310673e-10]
end

function params_BRS6s_BKstarmumu_Belle()
    # SM, C7, C8, C9, C10 + quadratic terms
    return [ 8.174394217344036e-09,
    3.1096377790791886e-08, 5.511696957158892e-09, 5.8848362226653e-09, -1.951539173535199e-09,
    0.0, -3.308722450212111e-24, -4.963083675318166e-24, -7.4238895018079905e-09,
    -3.308722450212111e-24, -8.271806125530277e-24, -1.3158519443224473e-09,
    0.0, -1.4049344958190311e-09,
    -1.6543612251060553e-24]
end
