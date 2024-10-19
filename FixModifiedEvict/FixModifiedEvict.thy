theory FixModifiedEvict  imports Base.BasicInvariants Base.Super2023 begin
sledgehammer_params[timeout=10, dont_minimize, "try0" = false]

lemma snps2_ModifiedEvict: shows "snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = snps2 T"
  by simp

lemma snps1_ModifiedEvict: shows "snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = snps1 T"
  by simp

lemma reqs2_ModifiedEvict: shows "reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = reqs2 T"
  by simp

lemma reqs1_ModifiedEvict: shows " reqs1 T = [] \<Longrightarrow> length (reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
  by simp 
  


lemma snpresps2_ModifiedEvict: shows "snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = snpresps2 T"
  by simp

lemma snpresps1_ModifiedEvict: shows "snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = snpresps1 T"
  by simp


lemma reqresps1_ModifiedEvict: shows "reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = reqresps1 T"
  by simp


lemma reqresps2_ModifiedEvict: shows "reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = reqresps2 T"
  by simp

lemma dthdatas2_ModifiedEvict: shows "dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = dthdatas2 T"
  by simp


lemma htddatas1_ModifiedEvict: shows "htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = htddatas1 T"
  by simp

lemma htddatas2_ModifiedEvict: shows "htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = htddatas2 T"
  by simp

lemma reqresps1_ModifiedEvict_aux: shows "length (reqresps1 T) \<le> 1 \<Longrightarrow> reqresps1 (T [0 -=reqresp ]) = []"
  apply(case_tac "reqresps1 T")
  by simp+


lemma ModifiedEvict'_nextDTHDataPending: "nextDTHDataPending T i = nextDTHDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i"
  by simp

lemma ModifiedEvict'_nextEvict: "nextEvict T i = nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i"
  by simp

lemma ModifiedEvict'_nextStore: "nextStore T i = nextStore ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i"
  by simp


lemma ModifiedEvict'_nextGOPending: "nextGOPending T i = nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i"
  by simp

lemma ModifiedEvict'_nextGOPendingIs: "nextGOPendingIs X T i = nextGOPendingIs X ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i"
  by simp


lemma ModifiedEvict'_nextHTDDataPending: "nextHTDDataPending T i = nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i"
  by simp

lemma ModifiedEvict'_HSTATE: "HSTATE X T  = HSTATE X ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) "
  by simp

lemma ModifiedEvict'_CSTATE_otherside: "CSTATE X T 1 = CSTATE X ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
  by simp


lemma ModifiedEvict'_CSTATE_sameside: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
  by simp


lemma ModifiedEvict'_nextSnoopIs: "nextSnoopIs X T i = nextSnoopIs X ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i"
  by simp


lemma ModifiedEvict'_nextReqIs_otherside: "nextReqIs X T 1 = nextReqIs X ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
  by simp

lemma ModifiedEvict'_nextSnpRespIs: "nextSnpRespIs X T i = nextSnpRespIs X ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i"
  by simp


lemma ModifiedEvict'_nextReqIs_invariant1: shows "reqs1 T = [] \<Longrightarrow> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
  by simp
 
  





lemma ModifiedEvict'_nextReqIs_invariant_not_RdOwn: shows "X \<noteq> DirtyEvict \<Longrightarrow> nextReqIs X T i = nextReqIs X ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i"
  apply(case_tac i)
  apply simp
   apply(induct "reqs1 T")
 apply force
   apply (metis append_Cons startsWithProp.simps(2))
  by simp





lemma nextGOPending_DeviceModifiedEvict: "nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i = nextGOPending T i"
apply(case_tac i)
apply simp+
done

lemma nextLoad_DeviceModifiedEvict: "nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i = nextLoad T i"
apply(case_tac i)
apply simp+
done

lemma nextEvict_DeviceModifiedEvict: "nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) i = nextEvict T i"
apply(case_tac i)
apply simp+
done









lemma ModifiedEvict'_coherent_aux_simpler:  assumes "SWMR_state_machine T \<and>  CSTATE Modified T 0 \<and> nextEvict T 0" shows "
  SWMR_state_machine ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"

  proof -
have i0: "SWMR T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i1x: "CSTATE Modified T 0"  by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i2x: "nextEvict T 0"  by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i3: "C_msg_P_oppo ISD nextHTDDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i4: "H_msg_P_same SD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i5: "H_msg_P_same SAD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i6: "C_msg_P_oppo ISAD nextGOPending (\<lambda>T i. \<not> CSTATE Modified T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i10: "H_msg_P_same SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)


have i11: "H_msg_P_oppo SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i12: "H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i13: "H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextDTHDataPending T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i14: "H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i15: "H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i16: "C_H_state IMAD (nextReqIs RdOwn) Modified SD T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i17: "C_H_state IMAD (nextReqIs RdOwn) Modified SAD T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i18: "C_H_state IMAD (nextReqIs RdOwn) Modified SA T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i19: "C_H_state Invalid nextStore Modified SAD T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i20: "C_H_state Invalid nextStore Modified SA T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)


have i21: "C_H_state Invalid nextStore Modified SD T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i22: "HSTATE SharedM T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i23: "HSTATE SD T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i24: "HSTATE MD T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i25: "C_msg_not RdShared IMAD T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i26: "C_msg_not RdShared Invalid T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i27: "H_msg_P_same ModifiedM (nextReqIs DirtyEvict) (\<lambda>T i. CSTATE MIA T i \<or> CSTATE IIA T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i28: "C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (\<lambda>T. \<not> HSTATE ModifiedM T) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i29: "C_msg_P_same MIA (nextGOPendingIs GO_WritePull) nextEvict T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i30: "C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (HSTATE ID) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)


have i31: "C_state_not MIA RdShared T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i32: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) nextEvict T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i34: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i35: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i36: "H_C_state_msg_same ModifiedM Modified (\<lambda>T i. \<not> nextReqIs RdShared T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i37: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) nextEvict T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i39: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i40: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)


have i41: "H_C_state_msg_oppo ModifiedM IIA (\<lambda>T i. \<not> nextReqIs RdShared T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i46: "C_msg_P_host Shared (nextSnoopIs SnpInv) (HSTATE MA) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i47: "C_msg_state RdShared ISAD T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i49: "C_not_C_msg Modified ISAD nextGOPending T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i50: "C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextHTDDataPending T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)


have i51: "C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextSnoopIs SnpInv T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i52: "C_msg_P_same ISAD nextGOPending (\<lambda>T i. \<not> nextReqIs RdShared T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i55: "snps2 T \<noteq> [] \<longrightarrow> reqs1 T = [] \<and> snpresps2 T = [] \<and> dthdatas2 T = [] \<and> reqresps1 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i56: "snps1 T \<noteq> [] \<longrightarrow> reqs2 T = [] \<and> snpresps1 T = [] \<and> dthdatas1 T = [] \<and> reqresps2 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i57: "length (reqs1 T) \<le> 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i58: "length (reqs2 T) \<le> 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i59: "C_msg_P_same Shared (nextSnoopIs SnpInv) (\<lambda>T i. \<not> nextHTDDataPending T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i60: "length (snps2 T) \<le> 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)


have i61: "length (snps1 T) \<le> 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i611old: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda> T i. \<not>nextSnoopPending T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i612old: "C_msg_P_oppo Invalid nextStore (\<lambda>T i. \<not> nextSnoopPending T i) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i613old: "(CSTATE Invalid T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = [] \<and> htddatas1 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i614old: "(CSTATE Invalid T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = [] \<and> htddatas2 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i615old: "(CSTATE Shared T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = [] \<and> htddatas1 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i616old: "(CSTATE Shared T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = [] \<and> htddatas2 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i617old: "(CSTATE IIA T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> htddatas1 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i618old: "(CSTATE IIA T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> htddatas2 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i68: "CSTATE Invalid T 0 \<longrightarrow> reqs1 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i69: "CSTATE Invalid T 1 \<longrightarrow> reqs2 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i70: "CSTATE Shared T 0 \<longrightarrow> reqs1 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)


have i71: "CSTATE Shared T 1 \<longrightarrow> reqs2 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i72: "CSTATE Modified T 0 \<longrightarrow> \<not>CSTATE Modified T 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i73: "CSTATE Modified T 1 \<longrightarrow> \<not>CSTATE Modified T 0" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i74: "CSTATE ISD T 0 \<longrightarrow> \<not>HSTATE ModifiedM T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i75: "CSTATE ISD T 1 \<longrightarrow> \<not>HSTATE ModifiedM T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i76: "C_msg_P_host ISD (nextSnoopIs SnpInv) (HSTATE MA) T" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i77: "length (htddatas1 T) \<le> 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i78: "length (htddatas2 T) \<le> 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i79: "CSTATE ISD T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i80: "CSTATE ISD T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)


have i81: "CSTATE ISD T 0 \<longrightarrow> reqs1 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i82: "CSTATE ISD T 1 \<longrightarrow> reqs2 T = []" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i83: "(CSTATE IMAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> reqs1 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i84: "(CSTATE IMAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> reqs2 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i85: "(length (reqresps1 T) \<le> 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i86: "(length (reqresps2 T) \<le> 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i87: "(CSTATE MIA T 0 \<and> (nextGOPendingIs GO_WritePull T 0)  \<longrightarrow> snps1 T = [] )" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i88: "(CSTATE MIA T 1 \<and> (nextGOPendingIs GO_WritePull T 1)  \<longrightarrow> snps2 T = [] )" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)

have i89: "(CSTATE MIA T 0 \<and> (nextGOPendingIs GO_WritePull T 0) \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> htddatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i90: "(CSTATE MIA T 1 \<and> (nextGOPendingIs GO_WritePull T 1) \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> htddatas2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i91: "(CSTATE ISAD T 0 \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i92: "(CSTATE ISAD T 1 \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i93: "(C_msg_P_same MIA  (nextReqIs DirtyEvict) (nextEvict) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i94: "(reqs1 T \<noteq> [] \<longrightarrow> reqresps1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i95: "(reqs2 T \<noteq> [] \<longrightarrow> reqresps2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i98: "(reqs1 T \<noteq> [] \<longrightarrow> snpresps2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i99: "(reqs2 T \<noteq> [] \<longrightarrow> snpresps1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i100: "(reqs1 T \<noteq> [] \<longrightarrow> htddatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i101: "(reqs2 T \<noteq> [] \<longrightarrow> htddatas2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
  have i751old: " (CSTATE ISD T 0 \<longrightarrow> nextLoad T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)+
have i752old: " (CSTATE ISD T 1 \<longrightarrow> nextLoad T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)+

 
 have i104: "(reqs1 T \<noteq> [] \<longrightarrow> reqresps1 T = [] ) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i105: "(reqs2 T \<noteq> [] \<longrightarrow> reqresps2 T = [] ) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i106: "(HSTATE SAD T \<longrightarrow> (CSTATE ISAD T 0 \<or> CSTATE ISAD T 1)) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i107: "(HSTATE ModifiedM T \<longrightarrow> \<not>CSTATE Shared T 0 \<and> \<not>CSTATE Shared T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i108: "(HSTATE SD T \<and> dthdatas1 T \<noteq> [] \<longrightarrow> htddatas2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i109: "(HSTATE SD T \<and> dthdatas2 T \<noteq> [] \<longrightarrow> htddatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i110: "(length (dthdatas1 T ) \<le> 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i111: "(length (dthdatas2 T ) \<le> 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i112: "(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> (CSTATE ISAD T 1 \<or> CSTATE ISD T 1)) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i113: "(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> (CSTATE ISAD T 0 \<or> CSTATE ISD T 0)) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i114: "(HSTATE SA T \<and> (nextSnpRespIs RspIFwdM T 0 \<or> nextSnpRespIs RspSFwdM T 0) \<longrightarrow> CSTATE ISAD T 1 \<or> CSTATE ISA T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i115: "(HSTATE SA T \<and> (nextSnpRespIs RspIFwdM T 1 \<or> nextSnpRespIs RspSFwdM T 1) \<longrightarrow> CSTATE ISAD T 0 \<or> CSTATE ISA T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 
 
 have i118: "(snpresps1 T \<noteq> [] \<longrightarrow> reqresps2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i119: "(snpresps2 T \<noteq> [] \<longrightarrow> reqresps1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i120: "(length (snpresps1 T) \<le> 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i121: "(length (snpresps2 T) \<le> 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i126: "(HSTATE SAD T \<and> snpresps1 T \<noteq> [] \<longrightarrow> htddatas2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i127: "(HSTATE SAD T \<and> snpresps2 T \<noteq> [] \<longrightarrow> htddatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i128: "(HSTATE MD T \<and> reqs1 T \<noteq> [] \<longrightarrow> dthdatas1 T \<noteq> []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i129: "(HSTATE MD T \<and> reqs2 T \<noteq> [] \<longrightarrow> dthdatas2 T \<noteq> []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i130: "(HSTATE ID T \<and> dthdatas1 T \<noteq> [] \<longrightarrow> CSTATE Invalid T 0 \<or> CSTATE ISAD T 0 \<or> CSTATE IMAD T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i131: "(HSTATE ID T \<and> dthdatas2 T \<noteq> [] \<longrightarrow> CSTATE Invalid T 1 \<or> CSTATE ISAD T 1 \<or> CSTATE IMAD T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i132: "(HSTATE ID T \<and> dthdatas1 T \<noteq> [] \<longrightarrow> \<not>CSTATE MIA T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i133: "(HSTATE ID T \<and> dthdatas2 T \<noteq> [] \<longrightarrow> \<not>CSTATE MIA T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i136: "(dthdatas1 T \<noteq> [] \<and> HSTATE SD T \<longrightarrow> snpresps2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i137: "(dthdatas2 T \<noteq> [] \<and> HSTATE SD T \<longrightarrow> snpresps1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i138: "(CSTATE ISD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> nextLoad T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i139: "(CSTATE ISD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> nextLoad T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i142: "(C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda> T i. \<not>nextSnoopPending T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i143: "(CSTATE ISAD T 0 \<and> nextGOPending T 0 \<longrightarrow> HSTATE SD T \<or> HSTATE SharedM T \<or> HSTATE MAD T \<or> HSTATE SB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i144: "(CSTATE ISAD T 1 \<and> nextGOPending T 1 \<longrightarrow> HSTATE SD T \<or> HSTATE SharedM T \<or> HSTATE MAD T \<or> HSTATE SB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i145: "(CSTATE ISAD T 0 \<longrightarrow> nextLoad T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i146: "(CSTATE ISAD T 1 \<longrightarrow> nextLoad T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i147: "(CSTATE ISAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i148: "(CSTATE ISAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i149: "(CSTATE ISAD T 0 \<and> nextGOPending T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] ) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i150: "(CSTATE ISAD T 1 \<and> nextGOPending T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] ) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i153: "((CSTATE Invalid T 0 \<or> CSTATE ISDI T 0) \<and> HSTATE MD T \<longrightarrow> dthdatas1 T \<noteq> []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i154: "((CSTATE Invalid T 1 \<or> CSTATE ISDI T 1) \<and> HSTATE MD T \<longrightarrow> dthdatas2 T \<noteq> []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i159: "(HSTATE ModifiedM T \<longrightarrow> snpresps2 T = [] \<and> snpresps1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i160: "(HSTATE SAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE ISAD T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i161: "(HSTATE SAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE ISAD T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i164: "(HSTATE SAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> htddatas2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i165: "(HSTATE SAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> htddatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i166: "(HSTATE SAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqs2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i167: "(HSTATE SAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqs1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i168: "(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqs2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i169: "(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqs1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i170: "(HSTATE SharedM T \<and> nextReqIs RdOwn T 0 \<longrightarrow> dthdatas2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i171: "(HSTATE SharedM T \<and> nextReqIs RdOwn T 1 \<longrightarrow> dthdatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i172: "(HSTATE SharedM T \<and> nextReqIs RdShared T 0 \<longrightarrow> dthdatas2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i173: "(HSTATE SharedM T \<and> nextReqIs RdShared T 1 \<longrightarrow> dthdatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i178: "(CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> HSTATE IB T \<or> HSTATE SB T \<or> HSTATE MB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i179: "(CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> HSTATE IB T \<or> HSTATE SB T \<or> HSTATE MB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i180: "(CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0 \<longrightarrow> HSTATE SharedM T \<or> HSTATE InvalidM T \<or> HSTATE ModifiedM T \<or> HSTATE SB T \<or> HSTATE ID T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i181: "(CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1 \<longrightarrow> HSTATE SharedM T \<or> HSTATE InvalidM T \<or> HSTATE ModifiedM T \<or> HSTATE SB T \<or> HSTATE ID T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i182: "(CSTATE IMAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MA T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i183: "(CSTATE IMAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MA T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i186: "(HSTATE SharedM T \<longrightarrow> dthdatas1 T = [] \<and> dthdatas2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i187: "(CSTATE MIA T 1 \<longrightarrow> \<not>CSTATE MIA T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i188: "(CSTATE MIA T 0 \<longrightarrow> \<not>CSTATE MIA T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i189: "(HSTATE ModifiedM T \<longrightarrow> dthdatas2 T = [] \<and> dthdatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i190: "(nextDTHDataFrom  0 T \<longrightarrow> \<not> nextHTDDataPending T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i191: "(nextDTHDataFrom  1 T \<longrightarrow> \<not> nextHTDDataPending T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i192: "(nextDTHDataFrom 0 T \<longrightarrow> \<not> nextDTHDataFrom 1 T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i193: "(nextDTHDataFrom 1 T \<longrightarrow> \<not> nextDTHDataFrom 0 T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i194: "(HSTATE SA T \<longrightarrow> dthdatas2 T = [] \<and> dthdatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i195: "(HSTATE SD T \<longrightarrow> \<not> CSTATE IIA T 0 \<or> \<not> CSTATE IIA T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i196: "(HSTATE SAD T \<longrightarrow> (\<not> CSTATE IIA T 0 \<or> nextSnpRespIs RspIFwdM T 0) \<and> (\<not> CSTATE IIA T 1 \<or> nextSnpRespIs RspIFwdM T 1)) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i197: "(CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> nextDTHDataFrom 1 T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i198: "(CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> nextDTHDataFrom 0 T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i199: "(CSTATE IIA T 0 \<longrightarrow> \<not> CSTATE IIA T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i200: "(CSTATE IIA T 1 \<longrightarrow> \<not> CSTATE IIA T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i301: "(CSTATE MIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> nextDTHDataFrom 1 T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i302: "(CSTATE MIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> nextDTHDataFrom 0 T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i305: "(snpresps1 T \<noteq> [] \<longrightarrow> reqresps1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i306: "(snpresps2 T \<noteq> [] \<longrightarrow> reqresps2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i307: "(HSTATE SharedM T \<and> nextReqIs RdShared T 1 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i308: "(HSTATE SharedM T \<and> nextReqIs RdShared T 0 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i309: "(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i310: "(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i313: "(HSTATE ModifiedM T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i314: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) nextEvict T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i315: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i316: "(CSTATE SIA T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> htddatas1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i317: "(CSTATE SIA T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> htddatas2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i318: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda> T i. \<not>nextSnoopPending T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i319: "(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> HSTATE IB T \<or> HSTATE SB T \<or> HSTATE MB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i320: "(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> HSTATE IB T \<or> HSTATE SB T \<or> HSTATE MB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i321: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i322: "(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> nextDTHDataFrom 1 T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i323: "(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> nextDTHDataFrom 0 T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i324: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) nextEvict T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i325: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i326: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda> T i. \<not>nextSnoopPending T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i327: "(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0 \<longrightarrow> HSTATE InvalidM T \<or> HSTATE SharedM T \<or> HSTATE SB T \<or> HSTATE IB T \<or> HSTATE ModifiedM T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i328: "(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1 \<longrightarrow> HSTATE InvalidM T \<or> HSTATE SharedM T \<or> HSTATE SB T \<or> HSTATE IB T \<or> HSTATE ModifiedM T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i329: "(C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i332: "(CSTATE SMAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MA T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i333: "(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow>  HSTATE SharedM T \<or> HSTATE SA T \<or> HSTATE MA T \<or> HSTATE SB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i334: "(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow>  HSTATE SharedM T \<or> HSTATE SA T \<or> HSTATE MA T \<or> HSTATE SB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i335: "(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> nextHTDDataPending T 1)) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i336: "(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> nextHTDDataPending T 0)) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i337: "(C_not_C_msg Modified IMAD nextGOPending T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i338: "(CSTATE IMAD T 0 \<and> nextGOPending T 0 \<longrightarrow> HSTATE MD T \<or> HSTATE ModifiedM T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i339: "(CSTATE IMAD T 0 \<longrightarrow> nextStore T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i340: "(CSTATE IMAD T 1 \<longrightarrow> nextStore T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i341: "(CSTATE IMAD T 0 \<and> nextGOPending T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] ) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i342: "(CSTATE IMAD T 1 \<and> nextGOPending T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] ) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i343: "(snpresps1 T \<noteq> [] \<longrightarrow> reqresps1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i344: "(snpresps2 T \<noteq> [] \<longrightarrow> reqresps2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i345: "(CSTATE SMAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MA T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i346: "(CSTATE IMAD T 1 \<and> nextGOPending T 1 \<longrightarrow>  HSTATE MD T \<or> HSTATE ModifiedM T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i347: "(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<longrightarrow>  HSTATE MD T \<or> HSTATE ModifiedM T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i348: "(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<longrightarrow>  HSTATE MD T \<or> HSTATE ModifiedM T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i349: "(CSTATE SMAD T 0 \<longrightarrow> nextStore T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i350: "(CSTATE SMAD T 1 \<longrightarrow> nextStore T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i351: "(C_msg_P_same IMA (nextGOPending) nextStore T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i352: "(CSTATE IMA T 0 \<or> CSTATE SMA T 0 \<or> CSTATE ISA T 0 \<longrightarrow> \<not> nextHTDDataPending T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i353: "(CSTATE IMA T 1 \<or> CSTATE SMA T 1 \<or> CSTATE ISA T 1 \<longrightarrow> \<not> nextHTDDataPending T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i354: "(C_msg_P_oppo IMA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i355: "(C_msg_P_oppo SMA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i356: "(C_msg_P_oppo ISA (nextGOPending) (\<lambda> T i. \<not>nextSnoopPending T i) T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i357: "(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i358: "(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 
 
 have i365: "(C_msg_P_same SMA (nextGOPending) nextStore T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i366: "((CSTATE SMA T 0 \<and> nextGOPending T 0 \<or> CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<or> CSTATE SMD T 0 \<and> nextHTDDataPending T 0) \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i367: "((CSTATE SMA T 1 \<and> nextGOPending T 1 \<or> CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<or> CSTATE SMD T 1 \<and> nextHTDDataPending T 1) \<longrightarrow>  HSTATE ModifiedM T \<or> HSTATE MAD T \<or> HSTATE SAD T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i368: "(CSTATE ISD T 0 \<or> CSTATE ISAD T 0 \<or> CSTATE ISA T 0 \<or> CSTATE ISDI T 0 \<longrightarrow> nextLoad T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i369: "(CSTATE ISD T 1 \<or> CSTATE ISAD T 1 \<or> CSTATE ISA T 1 \<or> CSTATE ISDI T 1 \<longrightarrow> nextLoad T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i370: "(CSTATE IMD T 0 \<or> CSTATE IMAD T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMD T 0 \<or> CSTATE SMAD T 0 \<or> CSTATE SMA T 0  \<longrightarrow> nextStore T 0) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i371: "(CSTATE IMD T 1 \<or> CSTATE IMAD T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMD T 1 \<or> CSTATE SMAD T 1 \<or> CSTATE SMA T 1  \<longrightarrow> nextStore T 1) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i374: "(CSTATE ISA T 0 \<and> nextGOPending T 0 \<longrightarrow> HSTATE SharedM T \<or> HSTATE MAD T \<or> HSTATE MA T \<or> HSTATE SB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i375: "(CSTATE ISA T 1 \<and> nextGOPending T 1 \<longrightarrow> HSTATE SharedM T \<or> HSTATE MAD T \<or> HSTATE MA T \<or> HSTATE SB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i376: "(CSTATE ISDI T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> HSTATE ModifiedM T \<or> HSTATE MAD T  \<or> HSTATE MA T \<or> HSTATE MD T\<or> HSTATE ID T \<or> HSTATE InvalidM T \<or> HSTATE SharedM T \<or> HSTATE SB T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i377: "(CSTATE ISDI T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = [] \<and> snps1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i378: "(CSTATE ISDI T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = [] \<and> snps2 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i379: "(CSTATE ISDI T 0 \<longrightarrow> \<not>nextReqIs RdOwn T 1 \<or> \<not>HSTATE ModifiedM T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i380: "(CSTATE ISDI T 1 \<longrightarrow> \<not>nextReqIs RdOwn T 0 \<or> \<not>HSTATE ModifiedM T) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i381: "(CSTATE Invalid T 0 \<longrightarrow> reqresps1 T = []) "   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
 have i382: "(CSTATE Invalid T 1 \<longrightarrow> reqresps2 T = [])"   by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i383: "(CSTATE ISDI T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> HSTATE ModifiedM T \<or> HSTATE MAD T  \<or> HSTATE MA T \<or> HSTATE MD T\<or> HSTATE ID T \<or> HSTATE InvalidM T \<or> HSTATE SharedM T \<or> HSTATE SB T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i384: "(CSTATE Shared T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i385: "(CSTATE Shared T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i388: "(CSTATE SMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i389: "(CSTATE SMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i390: "(CSTATE SMAD T 0 \<and> reqresps1 T = [] \<and> htddatas1 T = [] \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i391: "(CSTATE SMAD T 1 \<and> reqresps2 T = [] \<and> htddatas2 T = [] \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i392: "(nextReqIs RdOwn T 0 \<longrightarrow> CSTATE SMAD T 0 \<or> CSTATE IMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i393: "(nextReqIs RdOwn T 1 \<longrightarrow> CSTATE SMAD T 1 \<or> CSTATE IMAD T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i396: "(CSTATE SMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<and> CXL_SPG_used T 0 \<longrightarrow> nextReqIs RdOwn T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i397: "(CSTATE SMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<and> CXL_SPG_used T 1 \<longrightarrow> nextReqIs RdOwn T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i400: "(CSTATE ISD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i401: "(CSTATE ISD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i406: "(CSTATE IMA T 0 \<or> CSTATE SMA T 0 \<or> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0)  \<longrightarrow> dthdatas1 T = [] \<and> (dthdatas2 T = [] \<or> HSTATE MB T \<or> HSTATE ModifiedM T)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i407: "(CSTATE IMA T 1 \<or> CSTATE SMA T 1 \<or> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1)  \<longrightarrow> dthdatas2 T = [] \<and> (dthdatas1 T = [] \<or> HSTATE MB T \<or> HSTATE ModifiedM T)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i408: "(HSTATE MD T \<longrightarrow> snpresps1 T = [] \<and> snpresps2 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)


have i415: "(HSTATE ModifiedM T  \<and> nextReqIs RdOwn T 0 \<longrightarrow> (CSTATE Modified T 1 \<or> CSTATE MIA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<or> (CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> nextGOPending T 1 \<or> (CSTATE IMD T 1 \<or> CSTATE SMD T 1) \<and> nextHTDDataPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i416: "(HSTATE ModifiedM T  \<and> nextReqIs RdOwn T 1 \<longrightarrow> (CSTATE Modified T 0 \<or> CSTATE MIA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<or> (CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> nextGOPending T 0 \<or> (CSTATE IMD T 0 \<or> CSTATE SMD T 0) \<and> nextHTDDataPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i417: "((CSTATE Invalid T 0 \<or> CSTATE ISDI T 0) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 1 \<or> CSTATE MIA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<or> (CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> nextGOPending T 1 \<or> (CSTATE IMD T 1 \<or> CSTATE SMD T 1) \<and> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i418: "((CSTATE Invalid T 1 \<or> CSTATE ISDI T 1) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 0 \<or> CSTATE MIA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<or> (CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> nextGOPending T 0 \<or> (CSTATE IMD T 0 \<or> CSTATE SMD T 0) \<and> nextHTDDataPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i419: "(CSTATE IIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 1 \<or> CSTATE MIA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<or> (CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> nextGOPending T 1 \<or> (CSTATE IMD T 1 \<or> CSTATE SMD T 1) \<and> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i420: "(CSTATE IIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 0 \<or> CSTATE MIA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<or> (CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> nextGOPending T 0 \<or> (CSTATE IMD T 0 \<or> CSTATE SMD T 0) \<and> nextHTDDataPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i421: "(HSTATE MD T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i422: "(HSTATE MD T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE IMAD T 1 \<and> nextGOPending T 1 \<or> CSTATE IMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i423: "(HSTATE MD T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE IMAD T 0 \<and> nextGOPending T 0 \<or> CSTATE IMD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i424: "(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE IMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i425: "(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE IMAD T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i426: "(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> snpresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i427: "(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> snpresps1 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i430: "(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> reqs2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i431: "(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE Modified T 1 \<and> reqs1 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i432: "(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i433: "(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqresps1 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i435: "(CSTATE IMD T 0 \<or> CSTATE SMD T 0 \<or> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextGOPending T 0) \<longrightarrow> dthdatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i436: "(CSTATE IMD T 1 \<or> CSTATE SMD T 1 \<or> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextGOPending T 1) \<longrightarrow> dthdatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i437: "(HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T 0 \<or> nextSnpRespIs RspSFwdM T 0) \<longrightarrow> CSTATE ISAD T 1 ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i438: "(HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T 1 \<or> nextSnpRespIs RspSFwdM T 1) \<longrightarrow> CSTATE ISAD T 0 ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i441: "(nextSnpRespIs RspSFwdM T 0 \<longrightarrow> CSTATE Shared T 0 \<or> CSTATE SMAD T 0 \<or> CSTATE SIA T 0 \<or> CSTATE SIAC T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i442: "(nextSnpRespIs RspSFwdM T 1 \<longrightarrow> CSTATE Shared T 1 \<or> CSTATE SMAD T 1 \<or> CSTATE SIA T 1 \<or> CSTATE SIAC T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i443: "((HSTATE SAD T \<or> HSTATE MAD T \<or> HSTATE SA T \<or> HSTATE MA T) \<and> snpresps1 T \<noteq> [] \<longrightarrow> htddatas1 T = [] \<or> CSTATE ISDI T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i444: "((HSTATE SAD T \<or> HSTATE MAD T \<or> HSTATE SA T \<or> HSTATE MA T) \<and> snpresps2 T \<noteq> [] \<longrightarrow> htddatas2 T = [] \<or> CSTATE ISDI T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i445: "(HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T 0 \<or> nextSnpRespIs RspSFwdM T 0) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i446: "(HSTATE SAD T \<and> (nextSnpRespIs RspIFwdM T 1 \<or> nextSnpRespIs RspSFwdM T 1) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i449: "(HSTATE MAD T \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> dthdatas1 T \<noteq> [] \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i450: "(HSTATE MAD T \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> dthdatas2 T \<noteq> [] \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i451: "(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> htddatas2 T \<noteq> [] \<or> (CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i452: "(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> htddatas1 T \<noteq> [] \<or> (CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i453: "(nextReqIs DirtyEvict T 0 \<longrightarrow> CSTATE MIA T 0 \<or>  CSTATE SIA T 0 \<or> CSTATE IIA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i454: "(nextReqIs DirtyEvict T 1 \<longrightarrow> CSTATE MIA T 1 \<or>  CSTATE SIA T 1 \<or> CSTATE IIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i455: "(HSTATE MA T \<longrightarrow> dthdatas2 T = [] \<and> dthdatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i456: "((nextSnpRespIs RspIFwdM T 0 \<or> nextSnpRespIs RspIHitSE T 0) \<longrightarrow> CSTATE Invalid T 0 \<or> CSTATE ISDI T 0 \<or> CSTATE ISAD T 0 \<or> CSTATE IMAD T 0 \<or> CSTATE IIA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i457: "((nextSnpRespIs RspIFwdM T 1 \<or> nextSnpRespIs RspIHitSE T 1) \<longrightarrow> CSTATE Invalid T 1 \<or> CSTATE ISDI T 1 \<or> CSTATE ISAD T 1 \<or> CSTATE IMAD T 1 \<or> CSTATE IIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i460: "((CSTATE Invalid T 0  \<or> CSTATE ISDI T 0 \<or> nextReqIs RdOwn T 0) \<and> HSTATE MA T \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMA T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i461: "((CSTATE Invalid T 1  \<or> CSTATE ISDI T 1 \<or> nextReqIs RdOwn T 1) \<and> HSTATE MA T \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMA T 0))" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i462: "((CSTATE ISAD T 0 \<and> nextGOPending T 0) \<or> CSTATE ISA T 0 \<or> ( nextHTDDataPending T 0) \<or> CSTATE Shared T 0 \<longrightarrow> \<not> CSTATE Modified T 1 \<and> (dthdatas1 T = [] \<or> nextSnpRespIs RspSFwdM T 0 \<or> HSTATE SD T)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i463: "((CSTATE ISAD T 1 \<and> nextGOPending T 1) \<or> CSTATE ISA T 1 \<or> ( nextHTDDataPending T 1) \<or> CSTATE Shared T 1 \<longrightarrow> \<not> CSTATE Modified T 0 \<and> (dthdatas2 T = [] \<or> nextSnpRespIs RspSFwdM T 1 \<or> HSTATE SD T)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i465: "(CSTATE IMD T 0 \<or> CSTATE SMD T 0 \<or> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextGOPending T 0) \<longrightarrow> ((\<not> CSTATE ISD T 1) \<and> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE SMD T 1 \<and> \<not>( (CSTATE ISAD T 1 \<or> CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextGOPending T 1) \<and> \<not>CSTATE ISA T 1 \<and> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1 \<and> \<not> (  nextHTDDataPending T 1) \<and>  \<not> CSTATE Shared T 1 \<and> \<not> CSTATE Modified T 1) \<or> nextSnoopIs SnpInv T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i466: "(CSTATE IMD T 1 \<or> CSTATE SMD T 1 \<or> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextGOPending T 1) \<longrightarrow> ((\<not> CSTATE ISD T 0) \<and> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE SMD T 0 \<and> \<not>( (CSTATE ISAD T 0 \<or> CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextGOPending T 0) \<and> \<not>CSTATE ISA T 0 \<and> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0 \<and> \<not> (  nextHTDDataPending T 0) \<and>  \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Modified T 0) \<or> nextSnoopIs SnpInv T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i467: "(CSTATE Shared T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMAD T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i468: "(CSTATE Shared T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMAD T 0 \<or> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i469: "(CSTATE ISD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMAD T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i470: "(CSTATE ISD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMAD T 0 \<or> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i471: "(HSTATE MD T \<and> nextDTHDataFrom 0 T \<longrightarrow>  \<not> nextReqIs CleanEvict T 0 \<and> \<not> nextReqIs CleanEvictNoData T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i472: "(HSTATE MD T \<and> nextDTHDataFrom 1 T \<longrightarrow>  \<not> nextReqIs CleanEvict T 1 \<and> \<not> nextReqIs CleanEvictNoData T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i473: "(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow>  \<not> nextReqIs CleanEvict T 0 \<and> \<not> nextReqIs CleanEvictNoData T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i474: "(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow>  \<not> nextReqIs CleanEvict T 1 \<and> \<not> nextReqIs CleanEvictNoData T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i475: "(CSTATE Modified T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i476: "(CSTATE Modified T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i477: "(CSTATE Modified T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i478: "(CSTATE Modified T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i479: "(CSTATE MIA T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i480: "(CSTATE MIA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i481: "(CSTATE MIA T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1 ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i482: "(CSTATE MIA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0 ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i483: "(CSTATE Modified T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i484: "(CSTATE Modified T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i485: "(CSTATE Modified T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1 ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i486: "(CSTATE Modified T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0 ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i487: "(CSTATE Modified T 0 \<longrightarrow> reqs1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i488: "(CSTATE Modified T 1 \<longrightarrow> reqs2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i489: "(CSTATE Modified T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = [] \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i490: "(CSTATE Modified T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = [] \<and> htddatas2 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i491: "(HSTATE InvalidM T \<and> nextReqIs RdShared T 0 \<longrightarrow> dthdatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i492: "(HSTATE InvalidM T \<and> nextReqIs RdShared T 1 \<longrightarrow> dthdatas1 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i493: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1 \<and> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i494: "(nextReqIs RdOwn T 0 \<longrightarrow> \<not> CSTATE ISAD T 0 \<and> \<not> CSTATE Invalid T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i495: "(nextReqIs RdOwn T 1 \<longrightarrow> \<not> CSTATE ISAD T 1 \<and> \<not> CSTATE Invalid T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i496: "(HSTATE InvalidM T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i497: "(HSTATE InvalidM T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i498: "(HSTATE InvalidM T \<and> nextReqIs RdOwn T 0 \<longrightarrow> dthdatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i499: "(HSTATE InvalidM T \<and> nextReqIs RdOwn T 1 \<longrightarrow> dthdatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i500: "(CSTATE SIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i501: "(CSTATE SIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i502: "(CSTATE SIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i503: "(CSTATE SIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i504: "(CSTATE SIA T 0 \<and> nextSnoopIs SnpInv T 0 \<and> CXL_SPG_used T 0 \<longrightarrow> (nextReqIs CleanEvict T 0 \<or> nextReqIs CleanEvictNoData T 0 )) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i505: "(CSTATE SIA T 1 \<and> nextSnoopIs SnpInv T 1 \<and> CXL_SPG_used T 1 \<longrightarrow> (nextReqIs CleanEvict T 1 \<or> nextReqIs CleanEvictNoData T 1 )) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i506: "(CSTATE SIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMAD T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i507: "(CSTATE SIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMAD T 0 \<or> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i508: "(CSTATE SMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMAD T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i509: "(CSTATE SMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMAD T 0 \<or> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i510: "(HSTATE ID T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1 \<and> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i511: "(HSTATE ModifiedM T \<and> nextReqIs DirtyEvict T 0 \<longrightarrow> (\<not> CSTATE Modified T 0 \<or> \<not> CSTATE Modified T 1) \<and> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i512: "(HSTATE ModifiedM T \<and> nextReqIs DirtyEvict T 1 \<longrightarrow> (\<not> CSTATE Modified T 0 \<or> \<not> CSTATE Modified T 1) \<and> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i513: "(HSTATE ID T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i514: "(HSTATE ID T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i515: "(CSTATE SMAD T 0 \<and> nextGOPending T 0\<longrightarrow> nextHTDDataPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i516: "(CSTATE SMAD T 1 \<and> nextGOPending T 1\<longrightarrow> nextHTDDataPending T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i517: "(C_msg_P_oppo SMAD nextGOPending (\<lambda>T i. \<not> nextSnoopPending T i) T)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i518: "(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> CSTATE SIAC T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i519: "(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> CSTATE SIAC T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i522: "(nextGOPendingIs GO_WritePull T 0 \<and> HSTATE InvalidM T \<longrightarrow> reqresps2 T = [] \<or> nextReqRespStateIs Invalid (reqresps2 T)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i523: "(nextGOPendingIs GO_WritePull T 1 \<and> HSTATE InvalidM T \<longrightarrow> reqresps1 T = [] \<or> nextReqRespStateIs Invalid (reqresps1 T)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i524: "(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> nextEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i525: "(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> nextEvict T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i526: "(HSTATE SharedM T \<and> nextReqIs CleanEvict T 0 \<longrightarrow> nextEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i527: "(HSTATE SharedM T \<and> nextReqIs CleanEvict T 1 \<longrightarrow> nextEvict T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i528: "(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> \<not> CSTATE ISDI T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i529: "(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> \<not> CSTATE ISDI T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i530: "(HSTATE SharedM T \<and> nextReqIs CleanEvict T 0 \<longrightarrow> \<not> CSTATE ISDI T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i531: "(HSTATE SharedM T \<and> nextReqIs CleanEvict T 1 \<longrightarrow> \<not> CSTATE ISDI T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i532: "(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> \<not> CSTATE MIA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i533: "(HSTATE SharedM T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i534: "(HSTATE SharedM T \<and> nextReqIs CleanEvict T 0 \<longrightarrow> \<not> CSTATE MIA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i535: "(HSTATE SharedM T \<and> nextReqIs CleanEvict T 1 \<longrightarrow> \<not> CSTATE MIA T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i536: "(CSTATE Shared T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> htddatas2 T \<noteq> [] \<or> (CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> htddatas2 T = [])) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i537: "(CSTATE Shared T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> htddatas1 T \<noteq> [] \<or> (CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> htddatas1 T = []))" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i538: "(nextReqIs DirtyEvict T 0 \<longrightarrow> nextEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i539: "(nextReqIs DirtyEvict T 1 \<longrightarrow> nextEvict T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i540: "(nextReqIs DirtyEvict T 0 \<and> HSTATE InvalidM T \<longrightarrow> \<not> nextDTHDataFrom 1 T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i541: "(nextReqIs DirtyEvict T 1 \<and> HSTATE InvalidM T \<longrightarrow> \<not> nextDTHDataFrom 0 T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i542: "(nextReqIs DirtyEvict T 0 \<and> HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISDI T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i543: "(nextReqIs DirtyEvict T 1 \<and> HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISDI T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i544: "(nextReqIs DirtyEvict T 0 \<and> HSTATE InvalidM T \<longrightarrow> (reqresps2 T = [] \<or> nextReqRespStateIs Invalid (reqresps2 T))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i545: "(nextReqIs DirtyEvict T 1 \<and> HSTATE InvalidM T \<longrightarrow> (reqresps1 T = [] \<or> nextReqRespStateIs Invalid (reqresps1 T)))" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i546: "(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not>(CSTATE ISA T 1 \<or> nextHTDDataPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i547: "(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not>(CSTATE ISA T 0 \<or> nextHTDDataPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i548: "(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T \<and> CSTATE IMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i549: "(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T \<and> CSTATE IMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i550: "(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T \<and> CSTATE ISAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i551: "(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T \<and> CSTATE ISAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i552: "(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i553: "(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i554: "(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i555: "(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> nextReqIs DirtyEvict T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i556: "((nextReqIs CleanEvictNoData T 0 \<or> nextReqIs CleanEvict T 0) \<longrightarrow> (CSTATE SIA T 0 \<or> CSTATE IIA T 0 \<or> CSTATE SIAC T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i557: "((nextReqIs CleanEvictNoData T 1 \<or> nextReqIs CleanEvict T 1) \<longrightarrow> (CSTATE SIA T 1 \<or> CSTATE IIA T 1 \<or> CSTATE SIAC T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i558: "((CSTATE Shared T 0 \<or> CSTATE Shared T 1) \<longrightarrow> \<not> HSTATE MD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i559: "(CSTATE Shared T 0 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i560: "(CSTATE Shared T 1 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i561: "((nextReqIs CleanEvictNoData T 0 \<or> nextReqIs CleanEvict T 0) \<longrightarrow> nextEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i562: "((nextReqIs CleanEvictNoData T 1 \<or> nextReqIs CleanEvict T 1) \<longrightarrow> nextEvict T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i563: "((nextReqIs CleanEvictNoData T 0 \<or> nextReqIs CleanEvict T 0) \<longrightarrow> \<not> CSTATE ISDI T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i564: "((nextReqIs CleanEvictNoData T 1 \<or> nextReqIs CleanEvict T 1) \<longrightarrow> \<not> CSTATE ISDI T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i565: "((nextReqIs CleanEvictNoData T 0 \<or> nextReqIs CleanEvict T 0) \<longrightarrow> \<not> CSTATE MIA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i566: "((nextReqIs CleanEvictNoData T 1 \<or> nextReqIs CleanEvict T 1) \<longrightarrow> \<not> CSTATE MIA T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i567: "(CSTATE IIA T 0 \<and> HSTATE SharedM T \<longrightarrow> reqs2 T = [] \<or> nextReqIs CleanEvict T 1 \<or> nextReqIs CleanEvictNoData T 1 \<or> nextReqIs RdOwn T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i568: "(CSTATE IIA T 1 \<and> HSTATE SharedM T \<longrightarrow> reqs1 T = [] \<or> nextReqIs CleanEvict T 0 \<or> nextReqIs CleanEvictNoData T 0 \<or> nextReqIs RdOwn T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i569: "(CSTATE IIA T 0 \<and> HSTATE SharedM T \<longrightarrow> CSTATE Shared T 1 \<or> CSTATE SIA T 1 \<or> CSTATE SMAD T 1 \<or> CSTATE ISAD T 1 \<and> nextGOPending T 1 \<and> nextHTDDataPending T 1 \<or> CSTATE ISA T 1 \<and> nextGOPending T 1 \<or> CSTATE ISD T 1 \<and> nextHTDDataPending T 1 \<or> CSTATE SIAC T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i570: "(CSTATE IIA T 1 \<and> HSTATE SharedM T \<longrightarrow> CSTATE Shared T 0 \<or> CSTATE SIA T 0 \<or> CSTATE SMAD T 0 \<or> CSTATE ISAD T 0 \<and> nextGOPending T 0 \<and> nextHTDDataPending T 0 \<or> CSTATE ISA T 0 \<and> nextGOPending T 0 \<or> CSTATE ISD T 0 \<and> nextHTDDataPending T 0 \<or> CSTATE SIAC T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i571: "(CSTATE IIA T 1 \<and> HSTATE InvalidM T \<and> nextReqIs RdShared T 0 \<longrightarrow> CSTATE ISAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i572: "(CSTATE IIA T 0 \<and> HSTATE InvalidM T \<and> nextReqIs RdShared T 1 \<longrightarrow> CSTATE ISAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i573: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0 \<and> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE SMD T 0 \<and>  \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1 \<and> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE SMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i574: "(HSTATE InvalidM T \<longrightarrow> \<not> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> (nextGOPending T 0 \<or> nextHTDDataPending T 0)) \<and> \<not> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> (nextGOPending T 1 \<or> nextHTDDataPending T 1))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i575: "(nextGOPendingIs GO_WritePull T 0 \<or> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> HSTATE InvalidM T)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i576: "(CSTATE MIA T 0 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1 \<and> \<not> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i577: "(CSTATE MIA T 1 \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0 \<and> \<not> nextHTDDataPending T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i578: "(nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i579: "(nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i580: "((CSTATE IMA T 0 \<or> CSTATE SMA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0) \<longrightarrow> (HSTATE MA T \<or> HSTATE ModifiedM T \<or> HSTATE MB T \<or> HSTATE MAD T \<or> HSTATE SAD T)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i581: "((CSTATE IMA T 1 \<or> CSTATE SMA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1) \<longrightarrow> (HSTATE MA T \<or> HSTATE ModifiedM T \<or> HSTATE MB T \<or> HSTATE MAD T \<or> HSTATE SAD T))" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i582: "(CSTATE MIA T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = [] \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i583: "(CSTATE MIA T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = [] \<and> htddatas2 T = [])" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i584: "(CSTATE MIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i585: "(CSTATE MIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i586: "(CSTATE MIA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i587: "(CSTATE MIA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i588: "((HSTATE InvalidM T \<or> HSTATE SharedM T \<or> HSTATE ModifiedM T) \<longrightarrow> (\<not> nextGOPendingIs GO_WritePull T 0) \<and> (\<not> nextGOPendingIs GO_WritePull T 1))" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i589: "(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0 \<and> CSTATE IIA T 1 \<longrightarrow> HSTATE InvalidM T \<or> HSTATE IB T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i590: "(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1 \<and> CSTATE IIA T 0 \<longrightarrow> HSTATE InvalidM T \<or> HSTATE IB T)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i591: "(HSTATE InvalidM T \<longrightarrow> dthdatas1 T = [] \<and> dthdatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i592: "(CSTATE Invalid T 0 \<longrightarrow> \<not> nextSnoopIs SnpInv T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i593: "(CSTATE Invalid T 1 \<longrightarrow> \<not> nextSnoopIs SnpInv T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i594: "(CSTATE Modified T 0 \<longrightarrow> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i595: "(CSTATE Modified T 1 \<longrightarrow> \<not> CSTATE MIA T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i596: "(HSTATE MA T \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> htddatas2 T \<noteq> [] \<or> (CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i597: "(HSTATE MA T \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> htddatas1 T \<noteq> [] \<or> (CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i598: "(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i599: "(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i600: "(HSTATE MA T \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i601: "(HSTATE MA T \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMA T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i602: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE ISD T 0 \<and> \<not> CSTATE ISA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i603: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE ISD T 1 \<and> \<not> CSTATE ISA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i604: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE SMD T 0 \<and> \<not> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i605: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE SMD T 1 \<and> \<not> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i606: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE IMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i607: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE IMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i608: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDDataPending T 0))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i609: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDDataPending T 0))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i610: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDDataPending T 0))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i611: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDDataPending T 1))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i612: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDDataPending T 1))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i613: "(HSTATE InvalidM T \<or> HSTATE ID T \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDDataPending T 1))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i614: "(CSTATE ISD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> htddatas2 T \<noteq> []) \<or> ((CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> htddatas2 T = [])) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i615: "(CSTATE ISD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> htddatas1 T \<noteq> []) \<or> ((CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> htddatas1 T = [])) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i616: "(CSTATE ISA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> htddatas2 T \<noteq> []) \<or> ((CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> htddatas2 T = [])) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i617: "(CSTATE ISA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> htddatas1 T \<noteq> []) \<or> ((CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> htddatas1 T = [])) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i618: "(CSTATE ISAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> htddatas2 T \<noteq> []) \<or> ((CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> htddatas2 T = [])) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i619: "(CSTATE ISAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> htddatas1 T \<noteq> []) \<or> ((CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> htddatas1 T = [])) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i620: "(CSTATE IMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i621: "(CSTATE IMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i622: "(CSTATE IMD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i623: "(CSTATE IMD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i624: "(CSTATE IMA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i625: "(CSTATE IMA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i626: "(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i627: "(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i628: "(CSTATE SMD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i629: "(CSTATE SMD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i630: "(CSTATE SMA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i631: "(CSTATE SMA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i632: "(CSTATE ISD T 0 \<or> CSTATE ISA T 0 \<longrightarrow> \<not> HSTATE MD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i633: "(CSTATE ISD T 1 \<or> CSTATE ISA T 1 \<longrightarrow> \<not> HSTATE MD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i634: "(CSTATE ISAD T 0 \<and> (nextHTDDataPending T 0 \<or> nextGOPending T 0) \<longrightarrow> \<not> HSTATE MD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i635: "(CSTATE ISAD T 1 \<and> (nextHTDDataPending T 1 \<or> nextGOPending T 1) \<longrightarrow> \<not> HSTATE MD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i636: "(CSTATE ISD T 0 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i637: "(CSTATE ISD T 1 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i638: "(CSTATE ISA T 0 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i639: "(CSTATE ISA T 1 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMA T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i640: "(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i641: "(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i642: "(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> CSTATE ISA T 1 \<and> \<not> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i643: "(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> nextHTDDataPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i644: "(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i645: "(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> CSTATE Shared T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i646: "(CSTATE ISA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i647: "(CSTATE ISA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i648: "(CSTATE ISAD T 0 \<and> nextGOPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i649: "(CSTATE ISAD T 1 \<and> nextGOPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i650: "(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MA T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i651: "(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MA T)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i652: "(HSTATE SharedM T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i653: "(HSTATE SharedM T \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i654: "(HSTATE SharedM T \<longrightarrow> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE SMD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i655: "(HSTATE SharedM T \<longrightarrow> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE SMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i656: "(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDDataPending T 0))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i657: "(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDDataPending T 1))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i658: "(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDDataPending T 0))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i659: "(HSTATE SharedM T \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDDataPending T 1))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i660: "(HSTATE SharedM T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i661: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i662: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISD T 0 \<and> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE SMD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i663: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISD T 1 \<and> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE SMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i664: "(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i665: "(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i666: "(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i667: "(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i668: "(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i669: "(HSTATE InvalidM T \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i670: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i671: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE ISA T 1 \<and> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i672: "(HSTATE InvalidM T \<longrightarrow> \<not> nextHTDDataPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i673: "(HSTATE InvalidM T \<longrightarrow> \<not> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i674: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Shared T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i675: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i676: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE Modified T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i677: "(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> snpresps2 T = [] \<and> reqresps1 T = [] \<and> snps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i678: "(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> snpresps1 T = [] \<and> reqresps2 T = [] \<and> snps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i679: "(CSTATE IMAD T 0 \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<longrightarrow> snpresps2 T = [] \<and> snps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i680: "(CSTATE IMAD T 1 \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<longrightarrow> snpresps1 T = [] \<and> snps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i681: "(CSTATE IMD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i682: "(CSTATE IMD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i683: "(CSTATE IMA T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i684: "(CSTATE IMA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i685: "(CSTATE IMAD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> CSTATE ISAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i686: "(CSTATE IMAD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> CSTATE ISAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i687: "(CSTATE IMD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i688: "(CSTATE IMD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i689: "(CSTATE IMA T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i690: "(CSTATE IMA T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i691: "(CSTATE IMAD T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i692: "(CSTATE IMD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i693: "(CSTATE IMD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i694: "(CSTATE IMAD T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i695: "(CSTATE IMAD T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i696: "(CSTATE IMA T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i697: "(CSTATE IMA T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> HSTATE MAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i698: "(CSTATE IMAD T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i699: "(HSTATE IB T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1 \<and> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i700: "(HSTATE IB T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i701: "(HSTATE IB T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i702: "(HSTATE SB T \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Modified T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i703: "(HSTATE SB T \<longrightarrow> length (dthdatas1 T) \<le> 1 \<and> length (dthdatas2 T) \<le> 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i704: "(HSTATE IB T \<longrightarrow> length (dthdatas1 T) \<le> 1 \<and> length (dthdatas2 T) \<le> 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i705: "(HSTATE SB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE IIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i706: "(HSTATE SB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE IIA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i707: "(HSTATE MB T \<longrightarrow> length (dthdatas1 T) \<le> 1 \<and> length (dthdatas2 T) \<le> 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i708: "(HSTATE SB T \<and> nextDTHDataFrom 0 T \<longrightarrow> dthdatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i709: "(HSTATE SB T \<and> nextDTHDataFrom 1 T \<longrightarrow> dthdatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i710: "(HSTATE IB T \<and> nextDTHDataFrom 0 T \<longrightarrow> dthdatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i711: "(HSTATE IB T \<and> nextDTHDataFrom 1 T \<longrightarrow> dthdatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i712: "(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> dthdatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i713: "(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> dthdatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i714: "(HSTATE SB T \<longrightarrow> snps2 T = [] \<and> snps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i715: "(HSTATE IB T \<longrightarrow> snps2 T = [] \<and> snps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i716: "(HSTATE MB T \<longrightarrow> snps2 T = [] \<and> snps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i717: "(HSTATE SB T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i718: "(HSTATE SB T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i719: "(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i720: "(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i721: "(HSTATE IB T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i722: "(HSTATE IB T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i723: "(HSTATE SB T \<longrightarrow> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE SMD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i724: "(HSTATE SB T \<longrightarrow> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE SMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i725: "(HSTATE IB T \<longrightarrow> \<not> CSTATE IMD T 0 \<and> \<not> CSTATE SMD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i726: "(HSTATE IB T \<longrightarrow> \<not> CSTATE IMD T 1 \<and> \<not> CSTATE SMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i727: "(HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i728: "(HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i729: "(HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T 0 \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i730: "(HSTATE SharedM T \<and> lastSharer T \<and> nextReqIs CleanEvictNoData T 1 \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOPending T 0))" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i731: "(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> snpresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i732: "(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> snpresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i733: "(HSTATE SAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> snpresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i734: "(HSTATE SAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> snpresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i735: "(CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i736: "(CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<and> HSTATE MA T \<longrightarrow> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMA T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i737: "(HSTATE ModifiedM T \<longrightarrow> (\<not> CSTATE SIA T 0 \<or> nextGOPendingIs GO_WritePullDrop T 0) \<and> (\<not> CSTATE SIA T 1 \<or> nextGOPendingIs GO_WritePullDrop T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i738: "(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> \<not> CSTATE SIA T 0 \<and> \<not> CSTATE SIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i739: "(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> \<not> CSTATE SIA T 0 \<and> \<not> CSTATE SIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i740: "(HSTATE MD T \<longrightarrow> \<not> CSTATE SIA T 0 \<and> \<not> CSTATE SIA T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i741: "(CSTATE MIA T 0 \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i742: "(CSTATE MIA T 1 \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i743: "(CSTATE MIA T 0 \<longrightarrow> \<not> (CSTATE SMAD T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i744: "(CSTATE MIA T 1 \<longrightarrow> \<not> (CSTATE SMAD T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i745: "(HSTATE ModifiedM T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i746: "(HSTATE ModifiedM T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i747: "(HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE ISA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i748: "(HSTATE MD T \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE ISA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i749: "(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE ISA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i750: "(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE ISA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i751: "(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMA T 1 \<and> \<not> CSTATE SMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i752: "(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMA T 0 \<and> \<not> CSTATE SMD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i753: "(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE IMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i754: "(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE IMD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i755: "(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> (CSTATE IMAD T 1 \<and> (nextGOPending T 1 \<or> nextHTDDataPending T 1))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i756: "(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> (CSTATE IMAD T 0 \<and> (nextGOPending T 0 \<or> nextHTDDataPending T 0))) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i757: "(CSTATE MIA T 0 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i758: "(CSTATE MIA T 1 \<and> HSTATE ModifiedM T \<longrightarrow> \<not> CSTATE SMAD T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i759: "(CSTATE IMD T 1 \<longrightarrow> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i760: "(CSTATE IMD T 0 \<longrightarrow> reqresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i761: "(HSTATE IB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i762: "(HSTATE IB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i763: "(HSTATE IB T \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE ISD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i764: "(HSTATE IB T \<longrightarrow> \<not> CSTATE ISA T 1 \<and> \<not> CSTATE ISD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i765: "(HSTATE IB T \<longrightarrow> \<not> CSTATE SMA T 0 \<and> \<not> CSTATE SMD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i766: "(HSTATE IB T \<longrightarrow> \<not> CSTATE SMA T 1 \<and> \<not> CSTATE SMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i767: "(HSTATE IB T \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE IMD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i768: "(HSTATE IB T \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE IMD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i769: "(HSTATE IB T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i770: "(HSTATE IB T \<longrightarrow> \<not> nextHTDDataPending T 0 \<and> \<not> nextHTDDataPending T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i771: "(HSTATE ID T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i772: "(HSTATE ID T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i773: "(HSTATE ID T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i774: "(HSTATE ID T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i775: "(HSTATE ID T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i776: "(HSTATE ID T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextHTDDataPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i777: "(HSTATE ModifiedM T \<and> nextReqIs RdShared T 0 \<longrightarrow> \<not> CSTATE ISDI T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i778: "(HSTATE ModifiedM T \<and> nextReqIs RdShared T 1 \<longrightarrow> \<not> CSTATE ISDI T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i779: "(HSTATE SD T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i780: "(HSTATE SAD T \<and> snpresps1 T \<noteq> [] \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i781: "(HSTATE SAD T \<and> snpresps2 T \<noteq> [] \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i782: "(HSTATE MD T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i783: "(snpresps1 T \<noteq> [] \<and> HSTATE MAD T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i784: "(snpresps2 T \<noteq> [] \<and> HSTATE MAD T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i785: "(CSTATE IMD T 0 \<and> HSTATE MD T \<longrightarrow> snpresps1 T = [] \<and> snps1 T = [] \<and> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i786: "(CSTATE IMD T 1 \<and> HSTATE MD T \<longrightarrow> snpresps2 T = [] \<and> snps2 T = [] \<and> reqresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i787: "(nextDTHDataFrom 0 T \<and> HSTATE MD T \<and> nextReqIs RdOwn T 0 \<longrightarrow> CSTATE IMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i788: "(nextDTHDataFrom 1 T \<and> HSTATE MD T \<and> nextReqIs RdOwn T 1 \<longrightarrow> CSTATE IMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i789: "(HSTATE SAD T \<and> nextSnpRespIs RspSFwdM T 0 \<longrightarrow> \<not> CSTATE Modified T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i790: "(HSTATE SAD T \<and> nextSnpRespIs RspSFwdM T 1 \<longrightarrow> \<not> CSTATE Modified T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i791: "(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE Modified T 1 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i792: "(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE Modified T 0 \<and> \<not> CSTATE Shared T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i793: "(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> dthdatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i794: "(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> dthdatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i795: "(HSTATE SA T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i796: "(HSTATE SharedM T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i797: "(CSTATE IIA T 0 \<and> HSTATE SA T \<longrightarrow> CSTATE ISAD T 1 \<and> nextHTDDataPending T 1 \<or> CSTATE ISA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i798: "(CSTATE IIA T 1 \<and> HSTATE SA T \<longrightarrow> CSTATE ISAD T 0 \<and> nextHTDDataPending T 0 \<or> CSTATE ISA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i799: "(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> htddatas1 T = [] \<or> CSTATE ISDI T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i800: "(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> htddatas2 T = [] \<or> CSTATE ISDI T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i801: "(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> (CSTATE Modified T 0 \<or> CSTATE MIA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<or> (CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> nextGOPending T 0 \<or> (CSTATE IMD T 0 \<or> CSTATE SMD T 0) \<and> nextHTDDataPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i802: "(HSTATE MB T \<longrightarrow> \<not> CSTATE ISD T 0 \<and> \<not> CSTATE ISD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i803: "(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE Invalid T 0 \<or> CSTATE ISAD T 0 \<or> CSTATE IMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i804: "(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE Invalid T 1 \<or> CSTATE ISAD T 1 \<or> CSTATE IMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i805: "(HSTATE MB T \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i806: "(HSTATE MB T \<longrightarrow> snpresps1 T = [] \<and> snpresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i807: "(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i808: "(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i809: "(HSTATE MB T \<longrightarrow> \<not> CSTATE SIA T 0 \<and> \<not> CSTATE SIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i810: "(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextReqIs RdOwn T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i811: "(HSTATE MB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextReqIs RdOwn T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i812: "(HSTATE MB T \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE ISA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i813: "(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE SB T \<longrightarrow> \<not> CSTATE IIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i814: "(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE SB T \<longrightarrow> \<not> CSTATE IIA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i815: "(HSTATE IB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i816: "(HSTATE IB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i817: "(HSTATE SB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i818: "(HSTATE SB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i819: "(HSTATE SB T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i820: "(HSTATE SB T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i821: "(HSTATE ID T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i822: "(HSTATE ID T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i823: "(CSTATE Modified T 0 \<longrightarrow> \<not> nextReqIs RdOwn T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i824: "(CSTATE Modified T 1 \<longrightarrow> \<not> nextReqIs RdOwn T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i825: "(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE ISD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i826: "(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE ISD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i827: "(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i828: "(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i829: "(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE IMA T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i830: "(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE IMA T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i831: "(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISA T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i832: "(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISA T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i833: "((CSTATE ISAD T 0 \<and> nextGOPending T 0) \<or> CSTATE ISA T 0 \<or> ( nextHTDDataPending T 0) \<or> CSTATE Shared T 0 \<longrightarrow> \<not> (CSTATE IMA T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i834: "((CSTATE ISAD T 1 \<and> nextGOPending T 1) \<or> CSTATE ISA T 1 \<or> ( nextHTDDataPending T 1) \<or> CSTATE Shared T 1 \<longrightarrow> \<not> (CSTATE IMA T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i835: "(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> snps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i836: "(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> snps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i837: "(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE MIA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i838: "(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i839: "(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE SIA T 0 \<and> \<not> CSTATE SIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i840: "(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE SIA T 1 \<and> \<not> CSTATE SIA T 0)  " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i841: "(CSTATE Modified T 0 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1 \<and> (htddatas2 T = [] \<or> CSTATE ISDI T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i842: "(CSTATE Modified T 1 \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0 \<and> (htddatas1 T = [] \<or> CSTATE ISDI T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i843: "(CSTATE Modified T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i844: "(CSTATE Modified T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i845: "(CSTATE Modified T 0 \<longrightarrow> snpresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i846: "(CSTATE Modified T 1 \<longrightarrow> snpresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i847: "(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> (CSTATE ISAD T 1 \<and> nextGOPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i848: "(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> (CSTATE ISAD T 0 \<and> nextGOPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i849: "(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE ISA T 1 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i850: "(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE ISA T 0 \<and> \<not> CSTATE Shared T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i851: "(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i852: "(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i853: "(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE IMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i854: "(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE IMA T 0)  " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i855: "(CSTATE Invalid T 0 \<longrightarrow> snps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i856: "(CSTATE Invalid T 1 \<longrightarrow> snps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i857: "(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> CSTATE ISD T 1 \<or> CSTATE ISAD T 1 \<and> nextGOPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i858: "(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> CSTATE ISD T 0 \<or> CSTATE ISAD T 0 \<and> nextGOPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i859: "(HSTATE SAD T \<longrightarrow> \<not> nextGOPendingIs GO_WritePull T 0 \<and> \<not> nextGOPendingIs GO_WritePull T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i860: "(HSTATE SAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i861: "(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpData T 0 \<longrightarrow> HSTATE SAD T \<and> CSTATE ISAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i862: "(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpData T 1 \<longrightarrow> HSTATE SAD T \<and> CSTATE ISAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i863: "(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i864: "(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i865: "(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> snps2 T = [] \<and> snpresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i866: "(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> snps1 T = [] \<and> snpresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i867: "(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE IB T \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i868: "(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE IB T \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i869: "(CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE SB T \<longrightarrow> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i870: "(CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE SB T \<longrightarrow> \<not> CSTATE MIA T 0)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i871: "(HSTATE InvalidM T \<and> nextReqIs DirtyEvict T 0 \<longrightarrow> CSTATE IIA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i872: "(HSTATE InvalidM T \<and> nextReqIs DirtyEvict T 1 \<longrightarrow> CSTATE IIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i873: "(HSTATE InvalidM T \<longrightarrow> (\<not> CSTATE SIA T 0 \<or> nextGOPendingIs GO_WritePullDrop T 0) \<and> (\<not> CSTATE SIA T 1 \<or> nextGOPendingIs GO_WritePullDrop T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i874: "(HSTATE MA T  \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMA T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i875: "(HSTATE MA T  \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMA T 0))  " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i876: "(HSTATE MB T \<and> nextDTHDataFrom 0 T \<longrightarrow> (CSTATE Modified T 1 \<or> CSTATE MIA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<or> (CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> nextGOPending T 1 \<or> (CSTATE IMD T 1 \<or> CSTATE SMD T 1) \<and> nextHTDDataPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i877: "(HSTATE MB T \<and> CSTATE IIA T 0 \<longrightarrow> (CSTATE Modified T 1 \<or> CSTATE MIA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<or> (CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> nextGOPending T 1 \<or> (CSTATE IMD T 1 \<or> CSTATE SMD T 1) \<and> nextHTDDataPending T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i878: "(HSTATE MB T \<and> CSTATE IIA T 1 \<longrightarrow> (CSTATE Modified T 0 \<or> CSTATE MIA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<or> (CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> nextGOPending T 0 \<or> (CSTATE IMD T 0 \<or> CSTATE SMD T 0) \<and> nextHTDDataPending T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i883: "length (dthdatas1 T) \<le> 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i884: "length (dthdatas2 T) \<le> 1" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i885: "(HSTATE IB T \<and> CSTATE IIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i886: "(HSTATE IB T \<and> CSTATE IIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i887: "(HSTATE MAD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i888: "(HSTATE MAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i889: "(HSTATE MA T \<and> snpresps1 T \<noteq> [] \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i890: "(HSTATE MA T \<and> snpresps2 T \<noteq> [] \<longrightarrow> \<not> CSTATE Shared T 0 \<and> \<not> CSTATE Shared T 1)  " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i891: "(CSTATE IMAD T 0 \<and> nextGOPending T 0 \<and> HSTATE MD T \<longrightarrow> snpresps1 T = [] \<and> snps1 T = [] \<and> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i892: "(CSTATE IMAD T 1 \<and> nextGOPending T 1 \<and> HSTATE MD T \<longrightarrow> snpresps2 T = [] \<and> snps2 T = [] \<and> reqresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i893: "(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1 \<and> (htddatas2 T = [] \<or> CSTATE ISDI T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i894: "(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0 \<and> (htddatas1 T = [] \<or> CSTATE ISDI T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i895: "(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1 \<and> (htddatas2 T = [] \<or> CSTATE ISDI T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i896: "(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0 \<and> (htddatas1 T = [] \<or> CSTATE ISDI T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i897: "(CSTATE Modified T 0 \<longrightarrow> dthdatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i898: "(CSTATE Modified T 1 \<longrightarrow> dthdatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i899: "(nextSnpRespIs RspIHitSE T 0 \<longrightarrow> \<not> CSTATE IMA T 0 \<and> \<not> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i900: "(nextSnpRespIs RspIHitSE T 1 \<longrightarrow> \<not> CSTATE IMA T 1 \<and> \<not> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i901: "(CSTATE IMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i902: "(CSTATE IMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i903: "(CSTATE SMD T 0 \<and> nextHTDDataPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i904: "(CSTATE SMD T 1 \<and> nextHTDDataPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i905: "(CSTATE IMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i906: "(CSTATE IMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i907: "(CSTATE SMA T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i908: "(CSTATE SMA T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i909: "(CSTATE IMAD T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i910: "(CSTATE IMAD T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i911: "(HSTATE MD T \<and> nextDTHDataFrom 0 T \<longrightarrow> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i912: "(HSTATE MD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE SMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i913: "(CSTATE SMAD T 0 \<and> nextGOPending T 0 \<longrightarrow> \<not> CSTATE SMAD T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i914: "(CSTATE SMAD T 1 \<and> nextGOPending T 1 \<longrightarrow> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i915: "(HSTATE InvalidM T \<longrightarrow> \<not> CSTATE SMAD T 1 \<and> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i916: "(HSTATE IB T \<longrightarrow> \<not> CSTATE SMAD T 1 \<and> \<not> CSTATE SMAD T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i917: "(HSTATE ID T \<longrightarrow> \<not> CSTATE SMAD T 1 \<and> \<not> CSTATE SMAD T 0)  " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i918: "(HSTATE MA T \<and> nextSnpRespIs RspIHitSE T 0 \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i919: "(HSTATE MA T \<and> nextSnpRespIs RspIHitSE T 1 \<longrightarrow> \<not> nextReqIs DirtyEvict T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i920: "(CSTATE Modified T 0 \<longrightarrow> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i921: "(CSTATE Modified T 1 \<longrightarrow> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i922: "(HSTATE ModifiedM T \<longrightarrow> snps1 T = [] \<and> snps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i923: "(CSTATE SMAD T 0 \<and> nextHTDDataPending T 0 \<and> nextSnoopIs SnpInv T 0 \<longrightarrow> CSTATE IMAD T 1 \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i924: "(CSTATE SMAD T 1 \<and> nextHTDDataPending T 1 \<and> nextSnoopIs SnpInv T 1 \<longrightarrow> CSTATE IMAD T 0 \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i925: "(CSTATE SMAD T 1 \<and> HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> \<not> nextReqIs DirtyEvict T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i926: "(CSTATE SMAD T 0 \<and> HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> \<not> nextReqIs DirtyEvict T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i927: "(CSTATE SIAC T 0 \<and> HSTATE SA T \<longrightarrow> \<not> CSTATE Modified T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i928: "(CSTATE SIAC T 1 \<and> HSTATE SA T \<longrightarrow> \<not> CSTATE Modified T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i929: "(CSTATE SIAC T 0 \<longrightarrow> \<not> nextHTDDataPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i930: "(CSTATE SIAC T 1 \<longrightarrow> \<not> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i931: "((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) --> snps2 T = [] \<and> snpresps2 T = [] \<and> htddatas1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i932: "((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) --> snps1 T = [] \<and> snpresps1 T = [] \<and> htddatas2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i933: "((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 1 \<or> CSTATE MIA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<or> (CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> nextGOPending T 1 \<or> (CSTATE IMD T 1 \<or> CSTATE SMD T 1) \<and> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i934: "((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 0 \<or> CSTATE MIA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<or> (CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> nextGOPending T 0 \<or> (CSTATE IMD T 0 \<or> CSTATE SMD T 0) \<and> nextHTDDataPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i935: "((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) \<and> HSTATE MD T \<longrightarrow> dthdatas1 T \<noteq> []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i936: "((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) \<and> HSTATE MD T \<longrightarrow> dthdatas2 T \<noteq> []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i937: "((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) \<and> HSTATE MA T \<longrightarrow>(CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i938: "((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) \<and> HSTATE MA T \<longrightarrow>(CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMA T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i939: "((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) --> snps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i940: "((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) --> snps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i941: "((CSTATE SIAC T 0 \<and> nextGOPending T 0 \<and> nextGOPendingState Invalid T 0) --> reqs1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i942: "((CSTATE SIAC T 1 \<and> nextGOPending T 1 \<and> nextGOPendingState Invalid T 1) --> reqs2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i943: "(HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 0 \<longrightarrow> \<not> nextHTDDataPending T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i944: "(HSTATE MA T \<and> nextSnpRespIs RspIFwdM T 1 \<longrightarrow> \<not> nextHTDDataPending T 1)" by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i945: "(HSTATE SB T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i946: "(nextReqIs CleanEvictNoData T 0 \<longrightarrow> CSTATE SIAC T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i947: "(nextReqIs CleanEvictNoData T 1 \<longrightarrow> CSTATE SIAC T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i948: "(nextSnpRespIs RspIHitSE T 0 \<longrightarrow> \<not> nextDTHDataFrom 0 T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i949: "(nextSnpRespIs RspIHitSE T 1 \<longrightarrow> \<not> nextDTHDataFrom 1 T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i950: "(nextSnpRespIs RspIFwdM T 0 \<longrightarrow> \<not> nextReqIs CleanEvictNoData T 0) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i951: "(nextSnpRespIs RspIFwdM T 1 \<longrightarrow> \<not> nextReqIs CleanEvictNoData T 1)  " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i952: "(CSTATE SMA T 0 \<and> nextSnoopIs SnpData T 0 \<and> nextGOPending T 0 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i953: "(CSTATE SMA T 1 \<and> nextSnoopIs SnpData T 1 \<and> nextGOPending T 1 \<longrightarrow> HSTATE SAD T) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i954: "((CSTATE SIA T 0 \<and> nextGOPendingIs GO_WritePullDrop T 0) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 1 \<or> CSTATE MIA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<or>(CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> nextGOPending T 1 \<or> (CSTATE IMD T 1 \<or> CSTATE SMD T 1) \<and> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i955: "((CSTATE SIA T 1 \<and> nextGOPendingIs GO_WritePullDrop T 1) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 0 \<or> CSTATE MIA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<or>(CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> nextGOPending T 0 \<or> (CSTATE IMD T 0 \<or> CSTATE SMD T 0) \<and> nextHTDDataPending T 0)   " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i956: "((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<not> CSTATE IIA T 1 \<and> GTS T 1) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 1 \<or> CSTATE MIA T 1 \<or> (CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<and> nextGOPending T 1 \<or>(CSTATE IMA T 1 \<or> CSTATE SMA T 1) \<and> nextGOPending T 1 \<or> (CSTATE IMD T 1 \<or> CSTATE SMD T 1) \<and> nextHTDDataPending T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i957: "((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<not> CSTATE IIA T 0 \<and> GTS T 0) \<and> HSTATE ModifiedM T \<longrightarrow> CSTATE Modified T 0 \<or> CSTATE MIA T 0 \<or> (CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<and> nextGOPending T 0 \<or>(CSTATE IMA T 0 \<or> CSTATE SMA T 0) \<and> nextGOPending T 0 \<or> (CSTATE IMD T 0 \<or> CSTATE SMD T 0) \<and> nextHTDDataPending T 0)   " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i958: "((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<not> CSTATE IIA T 1 \<and> GTS T 1) \<and> HSTATE MD T \<longrightarrow> dthdatas1 T \<noteq> []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i959: "((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<not> CSTATE IIA T 0 \<and> GTS T 0) \<and> HSTATE MD T \<longrightarrow> dthdatas2 T \<noteq> [])  " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i960: "((CSTATE SIAC T 0 \<and> nextGOPendingIs GO T 0 \<and> nextGOPendingState Invalid T 0 \<and> \<not> CSTATE IIA T 1 \<and> GTS T 1) \<and> HSTATE MA T \<longrightarrow> ((CSTATE IMAD T 1 \<or> CSTATE SMAD T 1) \<and> nextHTDDataPending T 1 \<or> CSTATE IMA T 1 \<or> CSTATE SMA T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i961: "((CSTATE SIAC T 1 \<and> nextGOPendingIs GO T 1 \<and> nextGOPendingState Invalid T 1 \<and> \<not> CSTATE IIA T 0 \<and> GTS T 0) \<and> HSTATE MA T \<longrightarrow> ((CSTATE IMAD T 0 \<or> CSTATE SMAD T 0) \<and> nextHTDDataPending T 0 \<or> CSTATE IMA T 0 \<or> CSTATE SMA T 0)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i962: "(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> snps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i963: "(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> snps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i964: "(HSTATE SD T \<and> nextDTHDataFrom 0 T \<longrightarrow> reqresps1 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i965: "(HSTATE SD T \<and> nextDTHDataFrom 1 T \<longrightarrow> reqresps2 T = []) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i966: "(HSTATE ID T \<and> nextDTHDataFrom 0 T \<longrightarrow> (\<not> CSTATE SIA T 1 \<or> nextGOPendingIs GO_WritePullDrop T 1) ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i967: "(HSTATE ID T \<and> nextDTHDataFrom 1 T \<longrightarrow> (\<not> CSTATE SIA T 0 \<or> nextGOPendingIs GO_WritePullDrop T 0) ) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i968: "(CSTATE MIA T 0 \<and> nextGOPendingIs GO_WritePull T 0 \<and> HSTATE ID T \<longrightarrow> (\<not> CSTATE SIA T 1 \<or> nextGOPendingIs GO_WritePullDrop T 1)) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i969: "(CSTATE MIA T 1 \<and> nextGOPendingIs GO_WritePull T 1 \<and> HSTATE ID T \<longrightarrow> (\<not> CSTATE SIA T 0 \<or> nextGOPendingIs GO_WritePullDrop T 0))  " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)
have i970: "(HSTATE SAD T \<and> nextDTHDataFrom 1 T \<longrightarrow> \<not> CSTATE MIA T 0 \<and> \<not> CSTATE MIA T 1) " by (insert assms, unfold SWMR_state_machine_def, elim conjE, assumption)






(*BigHeaderEnd*)









  have i201: "reqs1 T = []" 
 
 by (smt (verit) i1x i487)
  have i202: "snps2 T = []" 
 
 
 by (smt (verit) i1x i489)
  have i203: "length (reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1" 
 using i201 reqs1_ModifiedEvict by presburger
  have i204: "snps2 T = [] \<and> snpresps2 T = [] \<and> reqresps1 T = [] \<and> htddatas1 T = []" 
 
 
 by (smt (verit) i1x i202 i489)
  have i205: "snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []" 
 using i202 snps2_ModifiedEvict by presburger
  have i206: "snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []" 
 using i204 snpresps2_ModifiedEvict by presburger 
  have i207: "reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 
 using i204 reqresps1_ModifiedEvict by presburger
  have i209: "snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> 
  snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> 
   
  reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> 
  htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 using i204 
 using htddatas1_ModifiedEvict i205 i206 i207 by presburger
  have i210: "reqresps1 T = []"
 
 using i204 by blast
	have aux81: "\<not> nextGOPending T 0"
	  apply(case_tac "reqresps1 T")
	  apply simp+ 
	  using i210 by force
  have aux8: "\<not>nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 
 using aux81 nextGOPending_DeviceModifiedEvict by blast

  have aux_r110: "dthdatas1 T = dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 by simp

  have aux_r140: "nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 = nextLoad T 1"
 
 by simp


  show ?thesis
unfolding SWMR_state_machine_def

(*BigLemmaEnd*)

proof (intro conjI)
  show goal1: "SWMR ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_various_forms1 MESI_State.distinct(117) MESI_State.distinct(27) SharedSnpInv'_CSTATE_invariant5) done
  show goal2: "C_msg_P_oppo ISD nextHTDDataPending (\<lambda>T i. \<not> CSTATE Modified T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextHTDDataPending assms i72 i920 nextHTDDataPending_various_forms2) done
  show goal3: "H_msg_P_same SD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal4: "H_msg_P_same SAD nextDTHDataPending (\<lambda>T i. \<not> CSTATE Modified T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(27) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_CSTATE_sameside assms i72) done
  show goal5: "C_msg_P_oppo ISAD nextGOPending (\<lambda>T i. \<not> CSTATE Modified T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) C_not_C_msg_def ModifiedEvict'_CSTATE_otherside assms aux8 i49 nextGOPending_DeviceModifiedEvict) done
  show goal6: "H_msg_P_same SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal7: "H_msg_P_oppo SharedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal8: "H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> CSTATE Modified T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 MESI_State.distinct(27) SharedSnpInv'_CSTATE_invariant5 assms i72) done
  show goal9: "H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextDTHDataPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
    apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)
    
    by (metis ModifiedEvict'_HSTATE assms aux_r110 i189 i1x i72 nextDTHDataPending_def nextDTHDataPending_general_rule_4_0)

  show goal10: "H_msg_P_oppo ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) i1x i206 i845 nextSnpRespIs_general_rule_9_0 nextSnpRespIs_invariant1 nextSnpRespIs_invariant2) done
  show goal11: "H_msg_P_same ModifiedM (nextReqIs RdShared) (\<lambda>T i. \<not> nextSnpRespIs RspIFwdM T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) i1x i206 i845 nextSnpRespIs_general_rule_9_0 nextSnpRespIs_invariant1 nextSnpRespIs_invariant2) done
  show goal12: "C_H_state IMAD (nextReqIs RdOwn) Modified SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal13: "C_H_state IMAD (nextReqIs RdOwn) Modified SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextReqIs_otherside assms i106 i495 i72) done
  show goal14: "C_H_state IMAD (nextReqIs RdOwn) Modified SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) C_H_state_def ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextReqIs_otherside assms i18 i72) done
  show goal15: "C_H_state Invalid nextStore Modified SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) MESI_State.distinct(143) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE assms i106 i72) done
  show goal16: "C_H_state Invalid nextStore Modified SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) C_H_state_def ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextStore assms i20 i72) done
  show goal17: "C_H_state Invalid nextStore Modified SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal18: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal19: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal20: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal21: "C_msg_not RdShared IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_inequality_invariant C_msg_state_def MESI_State.distinct(11) MESI_State.distinct(261) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(11) assms i47) done
  show goal22: "C_msg_not RdShared Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_inequality_invariant C_msg_state_def MESI_State.distinct(11) MESI_State.distinct(143) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(11) assms i47) done
  show goal23: "H_msg_P_same ModifiedM (nextReqIs DirtyEvict) (\<lambda>T i. CSTATE MIA T i \<or> CSTATE IIA T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
  apply  (cases "dthdatas1 T") apply  (auto)
 
 apply (smt (verit) CSTATE_various_forms6 HSTATE_various_forms2 H_msg_P_same_def i1x i27 i594 nextReqIs_various_forms2)
apply (smt (verit) i1x i897 list.discI) 
 done

  show goal24: "C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (\<lambda>T. \<not> HSTATE ModifiedM T) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs i313) done
  show goal25: "C_msg_P_same MIA (nextGOPendingIs GO_WritePull) nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594 nextEvict_DeviceModifiedEvict) done
  show goal26: "C_msg_P_host MIA (nextGOPendingIs GO_WritePull) (HSTATE ID) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_starting_transaction_otherside_invariant1 i1x i207 i594 reqresps_empty_noGOPendingIs1) done
  show goal27: "C_state_not MIA RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply simp 
 by (metis CSTATE_various_forms4 Message.simps(37) ReqType.simps(12) append.left_neutral i1x i201 i594 nextReqIs_various_forms2 startsWithProp.simps(2))
  show goal28: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_starting_transaction_otherside_invariant1 C_msg_P_same_def ModifiedEvict'_nextGOPendingIs i210 i32 nextEvict_DeviceModifiedEvict reqresps1_ModifiedEvict reqresps_empty_noGOPendingIs1) done
  show goal29: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_inequality_invariant C_msg_state_def MESI_State.distinct(277) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside i207 i47 reqresps_empty_noGOPendingIs1) done
  show goal30: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_disj1 CSTATE_starting_transaction_otherside_invariant1 MESI_State.distinct(493) ModifiedEvict'_nextDTHDataPending ModifiedEvict'_nextGOPendingIs SharedSnpInv'_CSTATE_invariant5 dthdatas1_general_rule_6_0 i181 i189 i1x i22 i493 i510 i702 i897 nextDTHDataPending_def) done
  show goal31: "H_C_state_msg_same ModifiedM Modified (\<lambda>T i. \<not> nextReqIs RdShared T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 MESI_State.distinct(27) SharedSnpInv'_CSTATE_invariant5 assms i72) done
  show goal32: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) C_msg_P_same_def ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextGOPendingIs assms i37 nextEvict_DeviceModifiedEvict) done
  show goal33: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis i210 i95 nextReqIs_not_various_forms2 reqresps1_ModifiedEvict reqresps2_ModifiedEvict reqresps_empty_noGOPendingIs1 reqresps_empty_noGOPendingIs2 reqs2_ModifiedEvict) done
  show goal34: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextDTHDataPending ModifiedEvict'_nextGOPendingIs i179 i1x i209 i699 i73 i808 i818 nextDTHDataFrom_def nextDTHDataPending_def reqresps_empty_noGOPendingIs1) done
  show goal35: "H_C_state_msg_oppo ModifiedM IIA (\<lambda>T i. \<not> nextReqIs RdShared T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(493) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(11) SharedSnpInv'_CSTATE_invariant5 i201 reqs1_empty_not_nextReqIs_general_invariant) done
  show goal36: "C_msg_P_host Shared (nextSnoopIs SnpInv) (HSTATE MA) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_disj1 MESI_State.distinct(117) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_CSTATE_sameside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i385) done
  show goal37: "C_msg_state RdShared ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_starting_transaction_otherside_invariant1 C_msg_state_def ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(11) i201 i47 nextReqIs_not_various_forms1 nextReqIs_otherside_rule_2_0) done
  show goal38: "C_not_C_msg Modified ISAD nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) C_not_C_msg_def ModifiedEvict'_CSTATE_otherside assms aux8 i49 nextGOPending_DeviceModifiedEvict) done
  show goal39: "C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextHTDDataPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) HTDDataPending_htddatas_invariant1 HTDDataPending_htddatas_invariant2 ModifiedEvict'_nextHTDDataPending assms i204 i920) done
  show goal40: "C_msg_P_same Invalid nextStore (\<lambda>T i. \<not> nextSnoopIs SnpInv T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_inequality_invariant Invalid_not_eq_MIA SharedSnpInv'_CSTATE_invariant5 empty_no_snoop2 i202 snps2_X_Evict_invariant1) done
  show goal41: "C_msg_P_same ISAD nextGOPending (\<lambda>T i. \<not> nextReqIs RdShared T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) C_not_C_msg_def ModifiedEvict'_CSTATE_otherside assms aux8 i49 nextGOPending_DeviceModifiedEvict) done
  show goal42: "snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205) done
  show goal43: "snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i56 i845 i897 reqresps2_ModifiedEvict reqs2_ModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal44: "length (reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) i203) done
  show goal45: "length (reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) i58 reqs2_ModifiedEvict) done
  show goal46: "length (snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) i202 i205 i60) done
  show goal47: "length (snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) i61 snps1_ModifiedEvict) done
  show goal48: "C_msg_P_same Shared (nextSnoopIs SnpInv) (\<lambda>T i. \<not> nextHTDDataPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(117) SharedSnpInv'_CSTATE_invariant5 assms htddatas2_ModifiedEvict i920 nextHTDDataPending_various_forms2) done
  show goal49: "C_msg_P_same IIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextSnoopPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)
 by (smt (verit) assms i209 i489 nextSnoopPending_empty_not_rule_9_1 reqresps_empty_noGOPendingIs1)
  show goal50: "C_msg_P_oppo Invalid nextStore (\<lambda>T i. \<not> nextSnoopPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside i202 i614old i616old nextSnoopPending_empty_not_rule_9_0 nextSnoopPending_empty_not_rule_9_1) done
  show goal51: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i207 i209) done
  show goal52: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms htddatas2_ModifiedEvict i382 i490 i614old i845 i920 reqresps2_ModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal53: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i207 i209) done
  show goal54: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms htddatas2_ModifiedEvict i490 i616old i845 i920 reqresps2_ModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal55: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i209) done
  show goal56: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms htddatas2_ModifiedEvict i583 i618old i845 i920 snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal57: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 Invalid_not_eq_MIA SharedSnpInv'_CSTATE_invariant5) done
  show goal58: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside i69 reqs2_ModifiedEvict) done
  show goal59: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(117) SharedSnpInv'_CSTATE_invariant5) done
  show goal60: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside i71 reqs2_ModifiedEvict) done
  show goal61: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal62: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal63: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(199) SharedSnpInv'_CSTATE_invariant5) done
  show goal64: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE i75) done
  show goal65: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(199) SharedSnpInv'_CSTATE_invariant5) done
  show goal66: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside aux_r140 i752old) done
  show goal67: "C_msg_P_host ISD (nextSnoopIs SnpInv) (HSTATE MA) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_disj1 CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(199) SharedSnpInv'_CSTATE_invariant5 i401 nextSnoopIs_general_rule_9_0) done
  show goal68: "length (htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) i201 i202 i209 i57) done
  show goal69: "length (htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) assms htddatas2_ModifiedEvict i201 i78 i920) done
  show goal70: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i207) done
  show goal71: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i80 i845 reqresps2_ModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal72: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(199) SharedSnpInv'_CSTATE_invariant5) done
  show goal73: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside i82 reqs2_ModifiedEvict) done
  show goal74: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextHTDDataPending assms i489 i613old nextHTDDataPending_various_forms1) done
  show goal75: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextHTDDataPending i84 reqs2_ModifiedEvict) done
  show goal76: "length (reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) i207 i210 i85) done
  show goal77: "length (reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) i86 reqresps2_ModifiedEvict) done
  show goal78: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply simp 
 by (metis i210 nextReqRespIs.simps(1))
  show goal79: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205) done
  show goal80: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i209) done
  show goal81: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal82: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(273) SharedSnpInv'_CSTATE_invariant5) done
  show goal83: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside i92) done
  show goal84: "C_msg_P_same MIA (nextReqIs DirtyEvict) nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594 nextEvict_DeviceModifiedEvict) done
  show goal85: "reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal86: "reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i95 reqresps2_ModifiedEvict reqs2_ModifiedEvict) done
  show goal87: "reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal88: "reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal89: "reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i209) done
  show goal90: "reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms htddatas2_ModifiedEvict i920) done
  show goal91: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(39) i1x i823) done
  show goal92: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_sameside) done
  show goal93: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 HSTATE_X_Evict_invariant1 MESI_State.distinct(11) MESI_State.distinct(15) MESI_State.distinct(5) assms i803 nextDTHDataFrom_general_rule_6_0) done
  show goal94: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_sameside) done
  show goal95: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_disj1 MESI_State.distinct(493) ModifiedEvict'_CSTATE_sameside) done
  show goal96: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_sameside) done
  show goal97: "reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal98: "reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i95 reqresps2_ModifiedEvict reqs2_ModifiedEvict) done
  show goal99: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE assms i106) done
  show goal100: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(117) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_CSTATE_sameside ModifiedEvict'_HSTATE i107) done
  show goal101: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal102: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i209) done
  show goal103: "length (dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) aux_r110 i883) done
  show goal104: "length (dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) dthdatas2_ModifiedEvict i884) done
  show goal105: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal106: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal107: "HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> (nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnpRespIs i114) done
  show goal108: "HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> (nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) MESI_State.distinct(9) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnpRespIs assms i115) done
  show goal109: "nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextSnpRespIs RspIHitSE ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) MESI_State.distinct(13) MESI_State.distinct(15) MESI_State.distinct(31) MESI_State.distinct(5) ModifiedEvict'_nextSnpRespIs assms i456) done
  show goal110: "nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextSnpRespIs RspIHitSE ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnpRespIs i457) done
  show goal111: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_sameside) done
  show goal112: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside assms i454 i594) done
  show goal113: "snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal114: "snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal115: "length (snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) assms i120 i201 i845 snpresps1_ModifiedEvict) done
  show goal116: "length (snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) i201 i206 i57) done
  show goal117: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> (nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnpRespIs i437) done
  show goal118: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> (nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnpRespIs assms i438 i790) done
  show goal119: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnpRespIs assms i449 i897) done
  show goal120: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply simp 
 by (metis i204 startsWithProp.simps(1))
  show goal121: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal122: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal123: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms htddatas2_ModifiedEvict i845 i920) done
  show goal124: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal125: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal126: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal127: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal128: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal129: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal130: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal131: "dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<and> HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal132: "dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<and> HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal133: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) HTDDataPending_htddatas_invariant1 ModifiedEvict'_nextHTDDataPending i204) done
  show goal134: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside aux_r140 i752old) done
  show goal135: "C_msg_P_same IIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextSnoopPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) i202 i209 nextSnoopPending_empty_not_rule_9_1 reqresps_empty_noGOPendingIs1) done
  show goal136: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal137: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE assms i143 i144 i22 i23 i702 nextGOPending_DeviceModifiedEvict) done
  show goal138: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(273) SharedSnpInv'_CSTATE_invariant5) done
  show goal139: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside aux_r140 i146) done
  show goal140: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(273) SharedSnpInv'_CSTATE_invariant5) done
  show goal141: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i148) done
  show goal142: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal143: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i150 i845 nextGOPending_DeviceModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal144: "(CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 Invalid_not_eq_MIA MESI_State.distinct(307) SharedSnpInv'_CSTATE_invariant5) done
  show goal145: "(CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_sameside) done
  show goal146: "(CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal147: "(CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal148: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms i206 i845 snpresps1_ModifiedEvict) done
  show goal149: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE assms i106) done
  show goal150: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) ModifiedEvict'_HSTATE assms i161 nextDTHDataFrom_general_rule_6_0) done
  show goal151: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms htddatas2_ModifiedEvict i920) done
  show goal152: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i209) done
  show goal153: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i205 i897 nextDTHDataFrom_def) done
  show goal154: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_different1 InvalidX_HSTATE1 MESI_State.distinct(11) i161 i1x nextDTHDataFrom_general_rule_6_0) done
  show goal155: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal156: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal157: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal158: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal159: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal160: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal161: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_disj1 MESI_State.distinct(493) ModifiedEvict'_CSTATE_sameside) done
  show goal162: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_sameside) done
  show goal163: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal164: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal165: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) i207 reqresps_empty_noGOPendingIs1) done
  show goal166: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs assms i178 i179 i699 i702) done
  show goal167: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) i207 reqresps_empty_noGOPendingIs1) done
  show goal168: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs assms i180 i181 i22 i493 i510 i702) done
  show goal169: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(339) ModifiedEvict'_CSTATE_sameside) done
  show goal170: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextHTDDataPending i182 i183) done
  show goal171: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal172: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal173: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal174: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal175: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal176: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms aux_r110 dthdatas2_ModifiedEvict i189 i897) done
  show goal177: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms aux_r110 dthdatas2_ModifiedEvict i455 i897) done
  show goal178: "nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextHTDDataPending i190 nextDTHDataFrom_general_rule_6_0) done
  show goal179: "nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextHTDDataPending i191 nextDTHDataFrom_general_rule_6_0) done
  show goal180: "nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) i192 nextDTHDataFrom_general_rule_6_0) done
  show goal181: "nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) i192 nextDTHDataFrom_general_rule_6_0) done
  show goal182: "HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms aux_r110 dthdatas2_ModifiedEvict i194 i897) done
  show goal183: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal184: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (\<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> (\<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(11) MESI_State.distinct(493) SharedSnpInv'_CSTATE_invariant5 assms i196 i438) done
  show goal185: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply simp done
  show goal186: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextGOPendingIs i198 nextDTHDataFrom_general_rule_6_0) done
  show goal187: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(493) ModifiedEvict'_CSTATE_sameside) done
  show goal188: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(493) ModifiedEvict'_CSTATE_sameside) done
  show goal189: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply simp 
 by (metis i210 nextReqRespIs.simps(1))
  show goal190: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal191: "snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal192: "snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal193: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal194: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal195: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal196: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal197: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> (nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs i859) done
  show goal198: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> (nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs i859) done
  show goal199: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs i313) done
  show goal200: "C_msg_P_same SIA (nextGOPendingIs GO_WritePull) nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) C_msg_P_same_def ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextGOPendingIs assms i314 nextEvict_DeviceModifiedEvict) done
  show goal201: "C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextReqIs RdShared T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis i210 i95 nextReqIs_not_various_forms2 reqresps1_ModifiedEvict reqresps2_ModifiedEvict reqresps_empty_noGOPendingIs1 reqresps_empty_noGOPendingIs2 reqs2_ModifiedEvict) done
  show goal202: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i209) done
  show goal203: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms htddatas2_ModifiedEvict i317 i583 i845 i920 snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal204: "C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextSnoopPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)
 by (metis CSTATE_different1 MESI_State.distinct(505) SharedSnpInv'_CSTATE_invariant5 i202 nextSnoopPending_empty_not_rule_9_1)
  show goal205: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) i207 reqresps_empty_noGOPendingIs1) done
  show goal206: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextGOPendingIs assms i319 i320 i699 i702 i809) done
  show goal207: "C_msg_P_same SIA (nextGOPendingIs GO_WritePull) (\<lambda>T i. \<not> nextDTHDataPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_starting_transaction_otherside_invariant1 i1x i207 i320 i699 i702 i809 nextGOPendingIs_general_rule_9_1 reqresps_empty_noGOPendingIs1) done
  show goal208: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply simp done
  show goal209: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextGOPendingIs i323 nextDTHDataFrom_general_rule_6_0) done
  show goal210: "C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_starting_transaction_otherside_invariant1 C_msg_P_same_def ModifiedEvict'_nextGOPendingIs i210 i324 nextEvict_DeviceModifiedEvict reqresps1_ModifiedEvict reqresps_empty_noGOPendingIs1) done
  show goal211: "C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextReqIs RdShared T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_inequality_invariant C_msg_state_def MESI_State.distinct(289) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside i207 i47 reqresps_empty_noGOPendingIs1) done
  show goal212: "C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextSnoopPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) i202 i209 nextSnoopPending_empty_not_rule_9_1 reqresps_empty_noGOPendingIs1) done
  show goal213: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(505) SharedSnpInv'_CSTATE_invariant5) done
  show goal214: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs assms i22 i327 i328 i493 i699 i702) done
  show goal215: "C_msg_P_same SIA (nextGOPendingIs GO_WritePullDrop) (\<lambda>T i. \<not> nextDTHDataPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (metis CSTATE_disj1 CSTATE_starting_transaction_otherside_invariant1 MESI_State.distinct(505) ModifiedEvict'_nextDTHDataPending ModifiedEvict'_nextGOPendingIs SharedSnpInv'_CSTATE_invariant5 dthdatas1_general_rule_6_0 i189 i1x i22 i328 i493 i699 i702 i897 nextDTHDataPending_def) done
  show goal216: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(497) SharedSnpInv'_CSTATE_invariant5) done
  show goal217: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(273) SharedSnpInv'_CSTATE_invariant5) done
  show goal218: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextHTDDataPending assms i22 i333 i334 i702) done
  show goal219: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextHTDDataPending assms i489 i615old nextHTDDataPending_various_forms1) done
  show goal220: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextHTDDataPending assms i489 i615old nextHTDDataPending_various_forms1) done
  show goal221: "C_not_C_msg Modified IMAD nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) C_not_C_msg_def ModifiedEvict'_CSTATE_otherside assms aux8 i337 nextGOPending_DeviceModifiedEvict) done
  show goal222: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal223: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextStore ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(339) SharedSnpInv'_CSTATE_invariant5) done
  show goal224: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextStore ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextStore i340) done
  show goal225: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal226: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i342 i741 i845 nextGOPending_DeviceModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal227: "snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal228: "snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal229: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal230: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE assms i24 i338 i346 i741 nextGOPending_DeviceModifiedEvict) done
  show goal231: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal232: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal233: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextStore ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(497) SharedSnpInv'_CSTATE_invariant5) done
  show goal234: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextStore ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal235: "C_msg_P_same IMA nextGOPending nextStore ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms aux8 i841 i893) done
  show goal236: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) HTDDataPending_htddatas_invariant1 ModifiedEvict'_nextHTDDataPending assms i489 i615old) done
  show goal237: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextHTDDataPending assms i353 i841) done
  show goal238: "C_msg_P_oppo IMA nextGOPending (\<lambda>T i. \<not> nextSnoopPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms aux8 i841 i893) done
  show goal239: "C_msg_P_oppo SMA nextGOPending (\<lambda>T i. \<not> nextSnoopPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms aux8 i841) done
  show goal240: "C_msg_P_oppo ISA nextGOPending (\<lambda>T i. \<not> nextSnoopPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) CSTATE_starting_transaction_otherside_invariant1 aux8 i1x i463) done
  show goal241: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal242: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i792 i829 nextGOPending_DeviceModifiedEvict) done
  show goal243: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> ((CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_disj1 MESI_State.distinct(397) MESI_State.distinct(501) ModifiedEvict'_CSTATE_sameside aux8) done
  show goal244: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> ((CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_starting_transaction_otherside_invariant1 assms empty_no_snoop i466 i56 i843 nextGOPending_DeviceModifiedEvict nextSnoopIs_general_rule_9_0 reqresps_empty_noGOPending2) done
  show goal245: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> (dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]))"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(369) MESI_State.distinct(499) SharedSnpInv'_CSTATE_invariant5 htddatas1_general_rule_7_0 i204 nextHTDDataPending_various_forms1) done
  show goal246: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> (dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]))"
 apply  (insert assms)(**)apply (metis CSTATE_starting_transaction_otherside_invariant1 assms htddatas2_ModifiedEvict i841 i920 nextHTDDataPending_various_forms2) done
  show goal247: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal248: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis CSTATE_starting_transaction_otherside_invariant1 assms dthdatas2_ModifiedEvict i436 i843 nextGOPending_DeviceModifiedEvict) done
  show goal249: "C_msg_P_same SMA nextGOPending nextStore ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms aux8 i841) done
  show goal250: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(397) MESI_State.distinct(501) ModifiedEvict'_CSTATE_sameside aux8) done
  show goal251: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextHTDDataPending i353 i366 i367 nextGOPending_DeviceModifiedEvict) done
  show goal252: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(199) MESI_State.distinct(237) MESI_State.distinct(273) MESI_State.distinct(307) SharedSnpInv'_CSTATE_invariant5) done
  show goal253: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextLoad ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside aux_r140 i146 i369 i752old) done
  show goal254: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextStore ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(339) MESI_State.distinct(369) MESI_State.distinct(397) MESI_State.distinct(497) MESI_State.distinct(499) MESI_State.distinct(501) SharedSnpInv'_CSTATE_invariant5) done
  show goal255: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextStore ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextStore assms i340 i371 i841 i843 i895) done
  show goal256: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms aux_r110 i72 i897) done
  show goal257: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextHTDDataPending assms i463 nextGOPending_DeviceModifiedEvict) done
  show goal258: "CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal259: "CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE assms i22 i374 i375 i702 nextGOPending_DeviceModifiedEvict) done
  show goal260: "CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) i209 nextHTDDataPending_def) done
  show goal261: "CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextHTDDataPending assms i22 i24 i376 i383 i493 i510 i702) done
  show goal262: "CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(307) SharedSnpInv'_CSTATE_invariant5) done
  show goal263: "CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i202 i205 i378 i845 reqresps2_ModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal264: "CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> \<not> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(307) SharedSnpInv'_CSTATE_invariant5) done
  show goal265: "CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> \<not> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(39) i1x i823) done
  show goal266: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal267: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside i205 i382 reqresps2_ModifiedEvict) done
  show goal268: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_different1 MESI_State.distinct(117) SharedSnpInv'_CSTATE_invariant5) done
  show goal269: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i385) done
  show goal270: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i477) done
  show goal271: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(35) MESI_State.distinct(37) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i468 i509) done
  show goal272: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206) done
  show goal273: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal274: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(497) ModifiedEvict'_CSTATE_sameside) done
  show goal275: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal276: "nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(39) assms i823) done
  show goal277: "nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside assms i393 i843) done
  show goal278: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> CXL_SPG_used ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(497) SharedSnpInv'_CSTATE_invariant5) done
  show goal279: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> CXL_SPG_used ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal280: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(199) SharedSnpInv'_CSTATE_invariant5) done
  show goal281: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i401) done
  show goal282: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i477) done
  show goal283: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(35) MESI_State.distinct(37) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i470 i509) done
  show goal284: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal285: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal286: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal287: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal288: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal289: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal290: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE i424 i837 nextDTHDataFrom_general_rule_6_0) done
  show goal291: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) ModifiedEvict'_HSTATE assms i425 i838 nextDTHDataFrom_general_rule_6_0) done
  show goal292: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal293: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal294: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) InvalidX_HSTATE1 i1x i430 nextDTHDataFrom_general_rule_6_0) done
  show goal295: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextReqIs_otherside i474 i838 nextDTHDataFrom_general_rule_6_0) done
  show goal296: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i205 i897 nextDTHDataFrom_def) done
  show goal297: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) ModifiedEvict'_HSTATE assms i425 i838 nextDTHDataFrom_general_rule_6_0) done
  show goal298: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) InvalidX_HSTATE1 i1x i430 nextDTHDataFrom_general_rule_6_0) done
  show goal299: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal300: "(HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) i209) done
  show goal301: "(HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal302: "nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(3) MESI_State.distinct(35) MESI_State.distinct(43) MESI_State.distinct(47) ModifiedEvict'_nextSnpRespIs assms i441) done
  show goal303: "nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnpRespIs assms i442 i843) done
  show goal304: "(CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant Invalid_not_eq_MIA MESI_State.distinct(307) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(39) SharedSnpInv'_CSTATE_invariant5 i1x i823) done
  show goal305: "(CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 Invalid_not_eq_MIA MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(35) MESI_State.distinct(37) MESI_State.distinct(5) assms i461 lastSharer_def lastSharer_non_Invalid_rule_6_0 nextReqIs_otherside_rule_2_0) done
  show goal306: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i475) done
  show goal307: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal308: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i477) done
  show goal309: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal310: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i475) done
  show goal311: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE assms i466 i475) done
  show goal312: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i477) done
  show goal313: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i466 i477 i621 i924) done
  show goal314: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i475) done
  show goal315: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i695) done
  show goal316: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i477) done
  show goal317: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i621 i924) done
  show goal318: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i475) done
  show goal319: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i697) done
  show goal320: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i477) done
  show goal321: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841 i893) done
  show goal322: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i483) done
  show goal323: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal324: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i485) done
  show goal325: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal326: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i483) done
  show goal327: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal328: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i485) done
  show goal329: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal330: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(27) SharedSnpInv'_CSTATE_invariant5) done
  show goal331: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal332: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i207 i209) done
  show goal333: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal334: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal335: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal336: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal337: "nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(39) assms i823) done
  show goal338: "nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside i495) done
  show goal339: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal340: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal341: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal342: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal343: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206) done
  show goal344: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i317 i583 i845 snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal345: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_different1 MESI_State.distinct(505) SharedSnpInv'_CSTATE_invariant5) done
  show goal346: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i503) done
  show goal347: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> CXL_SPG_used ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(505) SharedSnpInv'_CSTATE_invariant5) done
  show goal348: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> CXL_SPG_used ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
    apply  (insert assms)(**)
    by (metis CXL_SPG_used_general_rule_5_0 ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside ModifiedEvict'_nextSnoopIs i505)
  show goal349: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i477) done
  show goal350: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
    
    by (smt (verit) empty_no_snoop_variant2 i205)  show goal351: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i477) done
  show goal352: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal353: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal354: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> (\<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_disj4' MESI_State.distinct(117) MESI_State.distinct(27) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_CSTATE_sameside ModifiedEvict'_HSTATE assms i107 i72) done
  show goal355: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> (\<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_disj4' MESI_State.distinct(117) MESI_State.distinct(27) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_CSTATE_sameside ModifiedEvict'_HSTATE assms i107 i72) done
  show goal356: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal357: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal358: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal359: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal360: "C_msg_P_oppo SMAD nextGOPending (\<lambda>T i. \<not> nextSnoopPending T i) ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms , unfold SWMR_def C_msg_P_same_def C_msg_P_oppo_def H_msg_P_same_def C_H_state_def C_msg_not_def H_msg_P_oppo_def C_msg_P_host_def C_state_not_def H_C_state_msg_same_def H_C_state_msg_oppo_def C_msg_state_def C_not_C_msg_def)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms aux8 i843) done
  show goal361: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal362: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal363: "nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> nextReqRespStateIs Invalid (reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal364: "nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> nextReqRespStateIs Invalid (reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]))"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal365: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal366: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal367: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal368: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal369: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal370: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal371: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal372: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal373: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal374: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal375: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal376: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal377: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(117) ModifiedEvict'_CSTATE_sameside) done
  show goal378: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis empty_no_snoop2 i202 snps2_X_Evict_invariant1) done
  show goal379: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) assms nextEvict_DeviceModifiedEvict) done
  show goal380: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_otherside i539 nextEvict_DeviceModifiedEvict) done
  show goal381: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal382: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal383: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal384: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal385: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> nextReqRespStateIs Invalid (reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal386: "nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> nextReqRespStateIs Invalid (reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]))"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal387: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) HTDDataPending_htddatas_invariant1 ModifiedEvict'_nextHTDDataPending i204) done
  show goal388: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) HTDDataPending_htddatas_invariant2 ModifiedEvict'_nextHTDDataPending assms i920) done
  show goal389: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i475 i477) done
  show goal390: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextHTDDataPending ModifiedEvict'_nextSnoopIs assms i549) done
  show goal391: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i483 i485) done
  show goal392: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) empty_no_snoop_variant2 i205) done
  show goal393: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i207) done
  show goal394: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextHTDDataPending assms i553 i845 reqresps2_ModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal395: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) HTDDataPending_htddatas_invariant1 ModifiedEvict'_nextHTDDataPending i204) done
  show goal396: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) HTDDataPending_htddatas_invariant2 ModifiedEvict'_nextHTDDataPending assms i920) done
  show goal397: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_disj1 MESI_State.distinct(31) MESI_State.distinct(43) MESI_State.distinct(47) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(131) ReqType.distinct(151) assms i556 i561 i946) done
  show goal398: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside i557 i562 i947) done
  show goal399: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal400: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(117) ModifiedEvict'_CSTATE_sameside) done
  show goal401: "CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(35) MESI_State.distinct(37) assms i560) done
  show goal402: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) assms nextEvict_DeviceModifiedEvict) done
  show goal403: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> nextEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_otherside i562 nextEvict_DeviceModifiedEvict) done
  show goal404: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_disj1 MESI_State.distinct(31) MESI_State.distinct(43) MESI_State.distinct(47) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(131) ReqType.distinct(151) assms i556 i561 i946) done
  show goal405: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside i562 i564) done
  show goal406: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_disj1 MESI_State.distinct(31) MESI_State.distinct(43) MESI_State.distinct(47) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(131) ReqType.distinct(151) assms i556 i561 i946) done
  show goal407: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextReqIs CleanEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal408: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal409: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal410: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal411: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> ((CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)) \<and> \<not> ((CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal412: "nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal413: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) HTDDataPending_htddatas_invariant2 ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextHTDDataPending assms i841 i895 i920) done
  show goal414: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal415: "nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextGOPendingIs i578) done
  show goal416: "nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextGOPendingIs i578) done
  show goal417: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(339) MESI_State.distinct(369) MESI_State.distinct(497) MESI_State.distinct(499) SharedSnpInv'_CSTATE_invariant5) done
  show goal418: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 assms i183 i581 i843 nextHTDDataPending_general_rule_7_0) done
  show goal419: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i209) done
  show goal420: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal421: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i475) done
  show goal422: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal423: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i477) done
  show goal424: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal425: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs assms i22 i313 i493) done
  show goal426: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(505) SharedSnpInv'_CSTATE_invariant5) done
  show goal427: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(493) SharedSnpInv'_CSTATE_invariant5) done
  show goal428: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal429: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant Invalid_not_eq_MIA SharedSnpInv'_CSTATE_invariant5) done
  show goal430: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs i593) done
  show goal431: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal432: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal433: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis assms hstate_invariants(24) hstate_invariants(4) i596 i841 i920 nextSnoopIs_general_rule_9_0) done
  show goal434: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply simp 
 by (metis i202 startsSnp.simps(1))
  show goal435: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal436: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal437: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextHTDDataPending ModifiedEvict'_nextSnoopIs assms i477 i600) done
  show goal438: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) empty_no_snoop_variant2 i205) done
  show goal439: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal440: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal441: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal442: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal443: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal444: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal445: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal446: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal447: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal448: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal449: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal450: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<or> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i510) done
  show goal451: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(199) ModifiedEvict'_CSTATE_sameside) done
  show goal452: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis empty_no_snoop2 i202 snps2_X_Evict_invariant1) done
  show goal453: "CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(237) ModifiedEvict'_CSTATE_sameside) done
  show goal454: "CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis empty_no_snoop2 i202 snps2_X_Evict_invariant1) done
  show goal455: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(273) ModifiedEvict'_CSTATE_sameside) done
  show goal456: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis empty_no_snoop2 i202 snps2_X_Evict_invariant1) done
  show goal457: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms htddatas2_ModifiedEvict i477 i920) done
  show goal458: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply simp 
 by (metis i202 startsSnp.simps(1))
  show goal459: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms htddatas2_ModifiedEvict i477 i920) done
  show goal460: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply simp 
 by (metis i202 startsSnp.simps(1))
  show goal461: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms htddatas2_ModifiedEvict i477 i920) done
  show goal462: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841) done
  show goal463: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal464: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal465: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms htddatas2_ModifiedEvict i477 i920) done
  show goal466: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply simp 
 by (metis i202 startsSnp.simps(1))
  show goal467: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms htddatas2_ModifiedEvict i477 i920) done
  show goal468: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841) done
  show goal469: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal470: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal471: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<longrightarrow> \<not> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal472: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<longrightarrow> \<not> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal473: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(199) ModifiedEvict'_CSTATE_sameside) done
  show goal474: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(35) MESI_State.distinct(37) assms i637) done
  show goal475: "CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(237) ModifiedEvict'_CSTATE_sameside) done
  show goal476: "CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(35) MESI_State.distinct(37) assms i639) done
  show goal477: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) C_not_C_msg_def ModifiedEvict'_CSTATE_otherside assms i49 nextGOPending_DeviceModifiedEvict) done
  show goal478: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal479: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) HTDDataPending_htddatas_invariant1 ModifiedEvict'_nextHTDDataPending assms i489 i615old) done
  show goal480: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(331) ModifiedEvict'_CSTATE_otherside assms i466 i477) done
  show goal481: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(397) ModifiedEvict'_CSTATE_sameside) done
  show goal482: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(331) ModifiedEvict'_CSTATE_otherside assms i466 i477) done
  show goal483: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(199) SharedSnpInv'_CSTATE_invariant5) done
  show goal484: "CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i401) done
  show goal485: "CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 MESI_State.distinct(237) SharedSnpInv'_CSTATE_invariant5) done
  show goal486: "CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i647) done
  show goal487: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal488: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i148) done
  show goal489: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant MESI_State.distinct(273) SharedSnpInv'_CSTATE_invariant5) done
  show goal490: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i148) done
  show goal491: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal492: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal493: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal494: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal495: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal496: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal497: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal498: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal499: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal500: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal501: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal502: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal503: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal504: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal505: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal506: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal507: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal508: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal509: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal510: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal511: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal512: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal513: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal514: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal515: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal516: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal517: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i207) done
  show goal518: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextHTDDataPending assms i678 i759 i845 reqresps2_ModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal519: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal520: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i342 i741 i845 nextGOPending_DeviceModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal521: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i485) done
  show goal522: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_starting_transaction_otherside_invariant1 assms i466 i618 i682 i841 i920 nextSnoopIs_general_rule_9_0) done
  show goal523: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i485) done
  show goal524: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841 i895) done
  show goal525: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i485) done
  show goal526: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms i686) done
  show goal527: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i483) done
  show goal528: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i688) done
  show goal529: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i483) done
  show goal530: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i690) done
  show goal531: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs assms i483) done
  show goal532: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextSnoopIs i698) done
  show goal533: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal534: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493 i699) done
  show goal535: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal536: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal537: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> length (dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1 \<and> length (dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal538: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> length (dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1 \<and> length (dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal539: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal540: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal541: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> length (dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1 \<and> length (dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) aux_r110 dthdatas2_ModifiedEvict i883 i884) done
  show goal542: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal543: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal544: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510 i699) done
  show goal545: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal546: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis InvalidX_HSTATE1 i1x i463 i594 i72 i841 i876 nextDTHDataFrom_general_rule_6_0) done
  show goal547: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal548: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal549: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal550: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE i205 i716 snps1_ModifiedEvict) done
  show goal551: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal552: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal553: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal554: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE i205 i720 nextDTHDataFrom_general_rule_6_0 reqresps2_ModifiedEvict) done
  show goal555: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal556: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal557: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal558: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal559: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal560: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal561: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> lastSharer ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal562: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> lastSharer ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal563: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> lastSharer ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal564: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> lastSharer ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal565: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal566: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal567: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal568: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal569: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(273) ModifiedEvict'_CSTATE_sameside) done
  show goal570: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(17) MESI_State.distinct(329) MESI_State.distinct(35) MESI_State.distinct(37) assms i336 i736 nextHTDDataPending_general_rule_7_0) done
  show goal571: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (\<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> (\<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 MESI_State.distinct(505) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs SharedSnpInv'_CSTATE_invariant5 i737) done
  show goal572: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal573: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal574: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal575: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) C_not_C_msg_def ModifiedEvict'_CSTATE_otherside assms i337 nextGOPending_DeviceModifiedEvict) done
  show goal576: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal577: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal578: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal579: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(39) i1x i823) done
  show goal580: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE ModifiedEvict'_nextReqIs_otherside i746) done
  show goal581: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(237) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_CSTATE_sameside ModifiedEvict'_HSTATE i747) done
  show goal582: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal583: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal584: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal585: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_starting_transaction_otherside_invariant1 InvalidX_HSTATE1 empty_no_snoop_variant i1x i466 i841 i922) done
  show goal586: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal587: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_starting_transaction_otherside_invariant1 InvalidX_HSTATE1 empty_no_snoop_variant i1x i466 i841 i922) done
  show goal588: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal589: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1))"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_starting_transaction_otherside_invariant1 InvalidX_HSTATE1 empty_no_snoop i1x i463 i466 i922 nextGOPending_General_rule_5_1 nextHTDDataPending_general_rule_7_0) done
  show goal590: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0))"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal591: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal592: "CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal593: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside i205 i759 reqresps2_ModifiedEvict) done
  show goal594: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal595: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal596: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal597: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal598: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal599: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal600: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal601: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal602: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal603: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal604: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal605: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal606: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal607: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i207) done
  show goal608: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal609: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal610: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal611: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_starting_transaction_otherside_invariant1 InvalidX_HSTATE1 ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(11) i777) done
  show goal612: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdShared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(307) ModifiedEvict'_CSTATE_sameside) done
  show goal613: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal614: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal615: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal616: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal617: "snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<and> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal618: "snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<and> HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal619: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal620: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i207) done
  show goal621: "nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal622: "nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal623: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal624: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspSFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnpRespIs assms i790) done
  show goal625: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal626: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841 i893) done
  show goal627: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis InvalidX_HSTATE1 i1x i463 i594 i72 i841 i876 nextDTHDataFrom_general_rule_6_0) done
  show goal628: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal629: "HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs i795) done
  show goal630: "HSTATE SharedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i22) done
  show goal631: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(493) ModifiedEvict'_CSTATE_sameside) done
  show goal632: "CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) MESI_State.distinct(9) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE assms i798) done
  show goal633: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) i209) done
  show goal634: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal635: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(199) SharedSnpInv'_CSTATE_invariant5 i802) done
  show goal636: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) MESI_State.distinct(15) MESI_State.distinct(5) ModifiedEvict'_HSTATE assms i803 nextDTHDataFrom_general_rule_6_0) done
  show goal637: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE i804 nextDTHDataFrom_general_rule_6_0) done
  show goal638: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(117) SharedSnpInv'_CSTATE_invariant5 i805) done
  show goal639: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms i206 i845 snpresps1_ModifiedEvict) done
  show goal640: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs i807 nextDTHDataFrom_general_rule_6_0) done
  show goal641: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs i807 i808 nextDTHDataFrom_general_rule_6_0) done
  show goal642: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(505) SharedSnpInv'_CSTATE_invariant5 i809) done
  show goal643: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextReqIs_otherside i810 nextDTHDataFrom_general_rule_6_0) done
  show goal644: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(39) i1x i823) done
  show goal645: "HSTATE MB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(237) SharedSnpInv'_CSTATE_invariant5 i812) done
  show goal646: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal647: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal648: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal649: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal650: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal651: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal652: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal653: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal654: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal655: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal656: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(39) assms i823) done
  show goal657: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextReqIs RdOwn ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal658: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal659: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841) done
  show goal660: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal661: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal662: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal663: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal664: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal665: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal666: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841 i895) done
  show goal667: "CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal668: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205) done
  show goal669: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE i836 i838 nextDTHDataFrom_general_rule_6_0 snps1_ModifiedEvict) done
  show goal670: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i430 i837 nextDTHDataFrom_general_rule_6_0) done
  show goal671: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i594) done
  show goal672: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(505) SharedSnpInv'_CSTATE_invariant5 i839 nextDTHDataFrom_general_rule_6_0) done
  show goal673: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) ModifiedEvict'_HSTATE assms i425 i838 nextDTHDataFrom_general_rule_6_0) done
  show goal674: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms htddatas2_ModifiedEvict i841 i920) done
  show goal675: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal676: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal677: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal678: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal679: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal680: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal681: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> (CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal682: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal683: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE ISA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841 i895) done
  show goal684: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal685: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i209) done
  show goal686: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal687: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841 i893) done
  show goal688: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 Invalid_not_eq_MIA SharedSnpInv'_CSTATE_invariant5) done
  show goal689: "CSTATE Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205) done
  show goal690: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal691: "HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE ISD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i23) done
  show goal692: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextGOPendingIs i859) done
  show goal693: "HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux_r110 i1x i897 nextDTHDataFrom_def) done
  show goal694: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal695: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE ISAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal696: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal697: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal698: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal699: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal700: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal701: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal702: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal703: "CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal704: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal705: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal706: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (\<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> (\<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal707: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 assms i843 i874 nextHTDDataPending_general_rule_7_0 nextSnpRespIs_general_rule_9_0) done
  show goal708: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant HSTATE_X_Evict_invariant1 MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(35) MESI_State.distinct(37) assms i875 nextSnpRespIs_general_rule_9_0) done
  show goal709: "length (dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) aux_r110 i883) done
  show goal710: "length (dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) \<le> 1"
 apply  (insert assms)(**)apply (smt (verit) dthdatas2_ModifiedEvict i884) done
  show goal711: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal712: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal713: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(117) SharedSnpInv'_CSTATE_invariant5 i887 nextDTHDataFrom_general_rule_6_0) done
  show goal714: "HSTATE MAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(15) ModifiedEvict'_HSTATE assms i425 i838 nextDTHDataFrom_general_rule_6_0) done
  show goal715: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) assms i845 snpresps1_ModifiedEvict) done
  show goal716: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [] \<longrightarrow> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE Shared ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) i206) done
  show goal717: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal718: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205 i206 i207) done
  show goal719: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal720: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841) done
  show goal721: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> (htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal722: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> (htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<or> CSTATE ISDI ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841) done
  show goal723: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms aux_r110 i897) done
  show goal724: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal725: "nextSnpRespIs RspIHitSE ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(11) MESI_State.distinct(13) MESI_State.distinct(15) MESI_State.distinct(31) MESI_State.distinct(5) ModifiedEvict'_nextSnpRespIs assms i456) done
  show goal726: "nextSnpRespIs RspIHitSE ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841 i893) done
  show goal727: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal728: "CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(331) ModifiedEvict'_CSTATE_otherside assms i466 i477) done
  show goal729: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal730: "CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) HTDDataPending_htddatas_invariant2 ModifiedEvict'_nextHTDDataPending assms i920) done
  show goal731: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal732: "CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841 i893) done
  show goal733: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal734: "CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i841 i895) done
  show goal735: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal736: "CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) C_not_C_msg_def ModifiedEvict'_CSTATE_otherside assms i337 nextGOPending_DeviceModifiedEvict) done
  show goal737: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal738: "HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal739: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal740: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal741: "HSTATE InvalidM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i493) done
  show goal742: "HSTATE IB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i699) done
  show goal743: "HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i510) done
  show goal744: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIHitSE ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 
 by (smt (verit) SARspSFwdM_invariant1 i1x i845 nextSnpRespIs_general_rule_9_0)
  show goal745: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIHitSE ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextReqIs_otherside ModifiedEvict'_nextSnpRespIs i919) done
  show goal746: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) assms htddatas2_ModifiedEvict i920) done
  show goal747: "CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i209) done
  show goal748: "HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE i205 i922 snps1_ModifiedEvict) done
  show goal749: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextSnoopIs assms htddatas2_ModifiedEvict i477 i920) done
  show goal750: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpInv ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal751: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i843) done
  show goal752: "CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextReqIs DirtyEvict ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (metis CSTATE_inequality_invariant HSTATE_X_Evict_invariant1 MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(37) assms i875 i926 nextReqIs_otherside_rule_2_0 nextSnpRespIs_general_rule_9_0) done
  show goal753: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms i72) done
  show goal754: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE SA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_HSTATE assms i928) done
  show goal755: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextHTDDataPending assms i489 nextHTDDataPending_various_forms1) done
  show goal756: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextHTDDataPending i930) done
  show goal757: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal758: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> snpresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = [] \<and> htddatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside assms htddatas2_ModifiedEvict i583 i845 i920 i932 nextGOPendingStateGeneral_rule_5_1 nextGOPending_DeviceModifiedEvict snpresps1_ModifiedEvict snps1_ModifiedEvict) done
  show goal759: "(CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal760: "(CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_sameside) done
  show goal761: "(CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal762: "(CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i24) done
  show goal763: "(CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal764: "(CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (metis CSTATE_disj1 CSTATE_starting_transaction_otherside_invariant1 HSTATE_X_Evict_invariant1 MESI_State.distinct(15) MESI_State.distinct(17) MESI_State.distinct(35) MESI_State.distinct(37) assms i938 nextGOPendingStateGeneral_rule_5_1 nextGOPending_General_rule_5_1) done
  show goal765: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal766: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) i205) done
  show goal767: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> reqs1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) aux8) done
  show goal768: "CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> reqs2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside i942 nextGOPendingStateGeneral_rule_5_1 nextGOPending_DeviceModifiedEvict reqs2_ModifiedEvict) done
  show goal769: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextSnpRespIs assms i460 i463 i834 i841 i874 i895 i943) done
  show goal770: "HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE ModifiedEvict'_nextHTDDataPending ModifiedEvict'_nextSnpRespIs i944) done
  show goal771: "HSTATE SB ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_HSTATE assms i702) done
  show goal772: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) CSTATE_disj1 MESI_State.distinct(47) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ReqType.distinct(151) assms i946) done
  show goal773: "nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_CSTATE_otherside ModifiedEvict'_nextReqIs_otherside i947) done
  show goal774: "nextSnpRespIs RspIHitSE ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextSnpRespIs i948 nextDTHDataFrom_general_rule_6_0) done
  show goal775: "nextSnpRespIs RspIHitSE ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextSnpRespIs i949 nextDTHDataFrom_general_rule_6_0) done
  show goal776: "nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> \<not> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_invariant_not_RdOwn ModifiedEvict'_nextSnpRespIs ReqType.distinct(151) i950) done
  show goal777: "nextSnpRespIs RspIFwdM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> \<not> nextReqIs CleanEvictNoData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1"
 apply  (insert assms)(**)apply (smt (verit) ModifiedEvict'_nextReqIs_otherside ModifiedEvict'_nextSnpRespIs i951) done
  show goal778: "(CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) "

 by (smt (verit) aux8)
  show goal779: "(CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextSnoopIs SnpData ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<longrightarrow> HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA])) "

 by (smt (verit) ModifiedEvict'_CSTATE_sameside goal413)
  show goal780: "((CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or>(CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) "

 by (smt (verit) CSTATE_inequality_invariant MESI_State.distinct(505) SharedSnpInv'_CSTATE_invariant5)
  show goal781: "((CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or>(CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)   "

 by (smt (verit) SharedSnpInv'_CSTATE_invariant5)
  show goal782: "((CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> GTS ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or>(CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) "

 by (metis CSTATE_disj1 MESI_State.distinct(509) SharedSnpInv'_CSTATE_invariant5)
  show goal783: "((CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> GTS ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE ModifiedM ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> CSTATE Modified ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or>(CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextGOPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> (CSTATE IMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)   "

 by (metis ModifiedEvict'_CSTATE_sameside)
  show goal784: "((CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> GTS ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> []) "

 by (smt (verit) ModifiedEvict'_HSTATE i1x i24)
  show goal785: "((CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> GTS ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE MD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> dthdatas2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<noteq> [])  "

 by (smt (verit) ModifiedEvict'_HSTATE i1x i24)
  show goal786: "((CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> GTS ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> ((CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)) "

 by (metis CSTATE_disj1 MESI_State.distinct(509) SharedSnpInv'_CSTATE_invariant5)
  show goal787: "((CSTATE SIAC ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingState Invalid ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> \<not> CSTATE IIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> GTS ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> HSTATE MA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> ((CSTATE IMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) \<and> nextHTDDataPending ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE IMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> CSTATE SMA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0)) "
apply simp 
 by (smt (verit) CSTATE_different1 CSTATE_various_forms6 HSTATE_def MESI_State.distinct(17) MESI_State.distinct(37) ModifiedEvict'_nextHTDDataPending SharedSnpInv'_CSTATE_invariant5 goal175 goal419 i1x i406 i938 i961 nextGOPendingState_def nextGOPending_various_forms6 nextHTDDataPending_various_forms1)


  show goal788: "(HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []) "

 by (metis i205)
  show goal789: "(HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> snps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []) "

 by (metis ModifiedEvict'_CSTATE_sameside goal613)
  show goal790: "(HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []) "

 by (metis i207)
  show goal791: "(HSTATE SD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> reqresps2 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) = []) "

 by (smt (verit) ModifiedEvict'_HSTATE i1x i23)

  show goal792: "(HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 0 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (\<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) ) "

 by (metis ModifiedEvict'_HSTATE i1x i510)
  show goal793: "(HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (\<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0) ) "

 by (metis ModifiedEvict'_HSTATE i1x i510)
  show goal794: "(CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (\<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<or> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1)) "

 by (metis ModifiedEvict'_HSTATE i1x i510)
  show goal795: "(CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> nextGOPendingIs GO_WritePull ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1 \<and> HSTATE ID ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> (\<not> CSTATE SIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<or> nextGOPendingIs GO_WritePullDrop ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0))  "

 by (metis ModifiedEvict'_CSTATE_sameside goal174)

  show goal796: "(HSTATE SAD ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<and> nextDTHDataFrom 1 ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) \<longrightarrow> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 0 \<and> \<not> CSTATE MIA ( T [ 0 +=rdreq DirtyEvict] [ 0 s= MIA]) 1) "

    by (metis CSTATE_disj1 MESI_State.distinct(273) SharedSnpInv'_CSTATE_invariant5 goal150)
qed

qed



lemma ModifiedEvict_coherent: shows "
SWMR_state_machine T \<Longrightarrow> Lall (ModifiedEvict' T 0) SWMR_state_machine
"
  unfolding ModifiedEvict'_def sendReq_def

  using ModifiedEvict'_coherent_aux_simpler
  
  by (smt (verit) Lall.simps(1) Lall.simps(2) clearBuffer_def)


 











end







