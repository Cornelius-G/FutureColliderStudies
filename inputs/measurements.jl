#============= Observables ============================================#
include("observables_B.jl")
include("observables_top.jl")
include("observables_Belle2.jl")
include("observables_CLIC.jl")

#============= Measurements ============================================#

measurements = (
    # B measurements
    HFLAV_BR_Xsgamma   = Measurement(BR_Xsgamma  , 332e-6 , uncertainties = (exp=15e-6   , theo=23e-6),   active = use_B),
    BaBar_BR_Xsee_low  = Measurement(BR_Xsee_low , 1.60e-6, uncertainties = (exp=0.48e-6 , theo=0.17e-6), active = use_B),
    Babar_BR_Xsee_high = Measurement(BR_Xsee_high, 0.57e-6, uncertainties = (exp=0.163e-6, theo=0.03e-6), active = use_B),
    Belle_AFB_Xsee_low = Measurement(AFB_Xsee_low, 0.30   , uncertainties = (exp=0.243   , theo=0.0064),  active = use_B),

    HFLAV_BR_BKgamma   = Measurement(BR_BKgamma  , 41.7e-6 , uncertainties = (exp=1.2e-6   , theo=7.62e-6), active = use_B),
    HFLAV_BR_BpKgamma  = Measurement(BR_BpKgamma , 39.2e-6 , uncertainties = (exp=1.3e-6   , theo=8.00e-6), active = use_B),

    #LHCb 2003.04831
    LHCb_FL_1   = Measurement(FL_BKstarmumu_1  ,  0.700 , uncertainties = (exp=0.0282 , theo=0.0410),  active = use_LHCb),
    LHCb_P1_1   = Measurement(P1_BKstarmumu_1  ,  -0.079 , uncertainties = (exp=0.196 , theo=0.0293),  active = use_LHCb),
    LHCb_P2_1   = Measurement(P2_BKstarmumu_1  , -0.162 , uncertainties = (exp=0.051 , theo=0.0871),   active = use_LHCb),
    LHCb_P3_1   = Measurement(P3_BKstarmumu_1  , 0.085 , uncertainties = (exp=0.090 , theo=0.00877),   active = use_LHCb),
    LHCb_P4p_1   = Measurement(P4p_BKstarmumu_1  , -0.298 , uncertainties = (exp=0.088 , theo=0.0386), active = use_LHCb),
    LHCb_P5p_1  = Measurement(P5p_BKstarmumu_1 , -0.114 , uncertainties = (exp=0.073 , theo=0.0899),   active = use_LHCb),
    LHCb_P6p_1   = Measurement(P6p_BKstarmumu_1  , -0.197 , uncertainties = (exp=0.076 , theo=0.1045), active = use_LHCb),
    LHCb_P8p_1   = Measurement(P8p_BKstarmumu_1  , -0.020 , uncertainties = (exp=0.089 , theo=0.0307), active = use_LHCb),

    #LHCb 1403.8044
    LHCb_BR_BpKpmumu = Measurement(BR_BpKmumu_1  ,  24.2e-9 , uncertainties = (exp=1.389e-9 , theo=6.59e-9),       active = use_LHCb),
    LHCb_BR_BpKstarpmumu = Measurement(BR_BpKstarmumu_1  ,  36.6e-9 , uncertainties = (exp=8.7e-9 , theo=6.90e-9), active = use_LHCb),
    LHCb_BR_BKmumu_1 = Measurement(BR_BKmumu_1  ,  24.2e-9 , uncertainties = (exp=1.389e-9 , theo=5.01e-9),        active = use_LHCb),

    #LHCb 1506.08777
    LHCb_BR_Bsphimumu_1 = Measurement(BR_Bsphimumu_1  ,  2.58e-8 , uncertainties = (exp=0.389e-8 , theo=6.44e-9), active = use_LHCb),
    LHCb_FL_Bsphimumu_1 = Measurement(FL_Bsphimumu_1  ,  0.63 ,  uncertainties = (exp=0.09 , theo=0.01999),       active = use_LHCb),
    LHCb_S3_Bsphimumu_1 = Measurement(S3_Bsphimumu_1  ,  -0.02 , uncertainties = (exp=0.13 , theo=0.00432),       active = use_LHCb),
    LHCb_S4_Bsphimumu_1 = Measurement(S4_Bsphimumu_1  ,  -0.19 , uncertainties = (exp=0.14 , theo=0.01632),       active = use_LHCb),
    LHCb_S7_Bsphimumu_1 = Measurement(S7_Bsphimumu_1  ,  -0.03 , uncertainties = (exp=0.14 , theo=0.03593),       active = use_LHCb),

    #LHCb 1503.07138
    LHCb_BR_Lambdabmumu_1 = Measurement(BR_Lambdabmumu_1, 1.18e-7, uncertainties = (exp=0.286e-7 , theo=6.685e-9),   active = use_LHCb),

    #ATLAS 1805.04000
    ATLAS_P1_1   = Measurement(P1_BKstarmumu_1  , -0.17 , uncertainties = (exp=0.336 , theo=0.0293),   active = use_LHCb),
    ATLAS_P4p_1   = Measurement(P4p_BKstarmumu_1  , 0.05 , uncertainties = (exp=0.261 , theo=0.0386),  active = use_LHCb),
    ATLAS_P5p_1   = Measurement(P5p_BKstarmumu_1  , 0.01 , uncertainties = (exp=0.225 , theo=0.0899),  active = use_LHCb),
    ATLAS_P6p_1   = Measurement(P6p_BKstarmumu_1  , 0.03 , uncertainties = (exp=0.208 , theo=0.1045),  active = use_LHCb),
    ATLAS_P8p_1   = Measurement(P8p_BKstarmumu_1  , 0.23 , uncertainties = (exp=0.344 , theo=0.0307),  active = use_LHCb),

    # Top measurements
    ATLAS_CS_tt       = Measurement(CS_tt,     826.4, uncertainties = (exp=19.83, theo=45.76) , active = use_top),
    CMS_CS_ttZ        = Measurement(CS_ttZ,    0.950, uncertainties = (exp=0.0781, theo=0.1)  , active = use_top),
    ATLAS_F0_helicity = Measurement(F0,        0.709, uncertainties = (exp=0.0192, theo=0.005), active = use_top),
    ATLAS_FL_helicity = Measurement(FL,        0.299, uncertainties = (exp=0.015 , theo=0.005), active = use_top),
    ATLAS_13_1l       = Measurement(tta_13_1l, 521.0, uncertainties = (exp =42   , theo=99.)  , active = use_top),
    ATLAS_13_2l       = Measurement(tta_13_2l,  69.0, uncertainties = (exp =5.0  , theo=9.)   , active = use_top),

    # HL-LHC
    HL_CS_tt       = Measurement(CS_tt,     832.0, uncertainties = (exp=9.78,   theo=22.88)  , active = use_HL),
    HL_CS_ttZ      = Measurement(CS_ttZ,    0.843, uncertainties = (exp=0.0512, theo=0.05)   , active = use_HL),
    HL_F0_helicity = Measurement(F0,        0.687, uncertainties = (exp=0.01  , theo=0.0024) , active = use_HL),
    HL_FL_helicity = Measurement(FL,        0.311, uncertainties = (exp=0.0068, theo=0.0025) , active = use_HL),
    HL_13_1l       = Measurement(tta_13_1l, 495.0, uncertainties = (exp=33.66 , theo = 47.03), active = use_HL),
    HL_13_2l       = Measurement(tta_13_2l,  63.0, uncertainties = (exp=4.69  , theo =  4.5) , active = use_HL),

    # Belle2
    Belle2_BR_Xsgamma    = Measurement(BR_Xsgamma,     336e-6, uncertainties = (exp=10.75e-6 , theo = 11.4e-6) , active = use_Belle2),
    Belle2_BR_Xsee_low1  = Measurement(BR_Xsee_low1, 0.943e-6, uncertainties = (exp=0.062e-6 , theo=0.0442e-6) , active = use_Belle2),
    Belle2_BR_Xsee_low2  = Measurement(BR_Xsee_low2, 0.764e-6, uncertainties = (exp=0.0489e-6, theo=0.03744e-6), active = use_Belle2),
    Belle2_BR_Xsee_high  = Measurement(BR_Xsee_high, 0.302e-6, uncertainties = (exp=0.0142e-6, theo=0.0172e-6) , active = use_Belle2),
    Belle2_AFB_Xsee_low1 = Measurement(AFB_Xsee_low1, -0.0806, uncertainties = (exp=0.0025   , theo=0.0058)    , active = use_Belle2),
    Belle2_AFB_Xsee_low2 = Measurement(AFB_Xsee_low2,  0.0648, uncertainties = (exp=0.00168  , theo=0.003999)  , active = use_Belle2),
    Belle2_AFB_Xsee_high = Measurement(AFB_Xsee_high,  -0.065, uncertainties = (exp=0.00157  , theo=0.0377)    , active = use_Belle2),

    Belle2_P1_1   = Measurement(P1_BKstarmumu_Belle  , -0.1778 , uncertainties = (exp=0.057 , theo=0.0265),   active = use_Belle2),
    Belle2_P2_1   = Measurement(P2_BKstarmumu_Belle  , 0.2924  , uncertainties = (exp=0.009 , theo=0.0357),   active = use_Belle2),
    Belle2_P3_1   = Measurement(P3_BKstarmumu_Belle  , 0.0025  , uncertainties = (exp=0.029 , theo=0.0073),   active = use_Belle2),
    Belle2_P4p_1  = Measurement(P4p_BKstarmumu_Belle , -0.5037 , uncertainties = (exp=0.040 , theo=0.0136),   active = use_Belle2),
    Belle2_P5p_1  = Measurement(P5p_BKstarmumu_Belle , -0.7574 , uncertainties = (exp=0.040 , theo=0.0324),   active = use_Belle2),
    Belle2_P6p_1  = Measurement(P6p_BKstarmumu_Belle , -0.0300 , uncertainties = (exp=0.040 , theo=0.0564),   active = use_Belle2),
    Belle2_P8p_1  = Measurement(P8p_BKstarmumu_Belle , -0.0114 , uncertainties = (exp=0.045 , theo=0.0189),   active = use_Belle2),

    # CLIC
    CLIC_CS_380_m   = Measurement(CS_380_m  , 1.093 , uncertainties = (exp=0.034   , theo=0.0328)  , active = use_CLIC),
    CLIC_CS_380_p   = Measurement(CS_380_p  , 0.577 , uncertainties = (exp=0.0183  , theo=0.0173)  , active = use_CLIC),
    CLIC_CS_1400_m  = Measurement(CS_1400_m , 0.118 , uncertainties = (exp=0.00388 , theo=0.00354) , active = use_CLIC),
    CLIC_CS_1400_p  = Measurement(CS_1400_p , 0.0688, uncertainties = (exp=0.002918, theo=0.002064), active = use_CLIC),
    CLIC_CS_3000_m  = Measurement(CS_3000_m , 0.0259, uncertainties = (exp=0.000953, theo=0.00077) , active = use_CLIC),
    CLIC_CS_3000_p  = Measurement(CS_3000_p , 0.0151, uncertainties = (exp=0.000851, theo=0.000453), active = use_CLIC),

    CLIC_AFB_380_m  = Measurement(AFB_380_m , -0.221, uncertainties = (exp=0.0107  , theo=0.0088)  , active = use_CLIC),
    CLIC_AFB_380_p  = Measurement(AFB_380_p , -0.269, uncertainties = (exp=0.01106 , theo=0.0108)  , active = use_CLIC),
    CLIC_AFB_1400_m = Measurement(AFB_1400_m, -0.544, uncertainties = (exp=0.01799 , theo=0.0218)  , active = use_CLIC),
    CLIC_AFB_1400_p = Measurement(AFB_1400_p, -0.615, uncertainties = (exp=0.02699 , theo=0.0246)  , active = use_CLIC),
    CLIC_AFB_3000_m = Measurement(AFB_3000_m, -0.566, uncertainties = (exp=0.0210  , theo=0.0222)  , active = use_CLIC),
    CLIC_AFB_3000_p = Measurement(AFB_3000_p, -0.626, uncertainties = (exp=0.03798 , theo=0.025)   , active = use_CLIC),

)


#============= Correlations ============================================#
exp_corr = to_correlation_matrix(measurements,
    (:HL_F0_helicity, :HL_FL_helicity, -0.82),
    (:ATLAS_F0_helicity, :ATLAS_FL_helicity, -0.82),

    (:LHCb_FL_1, :LHCb_P1_1, -0.05),
    (:LHCb_FL_1, :LHCb_P2_1, -0.33),
    (:LHCb_FL_1, :LHCb_P3_1, 0.09),
    (:LHCb_FL_1, :LHCb_P4p_1, -0.11),
    (:LHCb_FL_1, :LHCb_P5p_1, -0.03),
    (:LHCb_FL_1, :LHCb_P6p_1, -0.14),
    (:LHCb_FL_1, :LHCb_P8p_1, 0.02),

    (:LHCb_P1_1, :LHCb_P2_1, 0.05),
    (:LHCb_P1_1, :LHCb_P3_1, 0.02),
    (:LHCb_P1_1, :LHCb_P4p_1, -0.04),
    (:LHCb_P1_1, :LHCb_P5p_1, -0.00),
    (:LHCb_P1_1, :LHCb_P6p_1, 0.03),
    (:LHCb_P1_1, :LHCb_P8p_1, 0.01),

    (:LHCb_P2_1, :LHCb_P3_1, 0.00),
    (:LHCb_P2_1, :LHCb_P4p_1, -0.04),
    (:LHCb_P2_1, :LHCb_P5p_1, -0.06),
    (:LHCb_P2_1, :LHCb_P6p_1, 0.03),
    (:LHCb_P2_1, :LHCb_P8p_1, -0.04),

    (:LHCb_P3_1, :LHCb_P4p_1, 0.02),
    (:LHCb_P3_1, :LHCb_P5p_1, 0.03),
    (:LHCb_P3_1, :LHCb_P6p_1, 0.03),
    (:LHCb_P3_1, :LHCb_P8p_1, 0.08),

    (:LHCb_P4p_1, :LHCb_P5p_1, -0.06),
    (:LHCb_P4p_1, :LHCb_P6p_1, 0.03),
    (:LHCb_P4p_1, :LHCb_P8p_1, 0.01),

    (:LHCb_P5p_1, :LHCb_P6p_1, 0.01),
    (:LHCb_P5p_1, :LHCb_P8p_1, 0.00),

    (:LHCb_P6p_1, :LHCb_P8p_1, -0.02),

    (:ATLAS_P1_1, :ATLAS_P4p_1, 0.23),
    (:ATLAS_P1_1, :ATLAS_P5p_1, -0.09),
    (:ATLAS_P1_1, :ATLAS_P6p_1, 0.08),
    (:ATLAS_P1_1, :ATLAS_P8p_1, -0.07),

    (:ATLAS_P4p_1, :ATLAS_P5p_1, 0.53),
    (:ATLAS_P4p_1, :ATLAS_P6p_1, 0.15),
    (:ATLAS_P4p_1, :ATLAS_P8p_1, 0.08),

    (:ATLAS_P5p_1, :ATLAS_P6p_1, 0.28),
    (:ATLAS_P5p_1, :ATLAS_P8p_1, 0.24),

    (:ATLAS_P6p_1, :ATLAS_P8p_1, 0.67),

    (:LHCb_FL_Bsphimumu_1, :LHCb_S3_Bsphimumu_1, -0.02),
    (:LHCb_FL_Bsphimumu_1, :LHCb_S4_Bsphimumu_1, 0.08),
    (:LHCb_FL_Bsphimumu_1, :LHCb_S7_Bsphimumu_1, 0.07),

    (:LHCb_S3_Bsphimumu_1, :LHCb_S4_Bsphimumu_1, -0.07),
    (:LHCb_S3_Bsphimumu_1, :LHCb_S7_Bsphimumu_1, 0.10),

    (:LHCb_S4_Bsphimumu_1, :LHCb_S7_Bsphimumu_1, -0.06),

)

correlations = (
    exp = Correlation(exp_corr, active=true) ,
    theo = NoCorrelation(active=true),
)
