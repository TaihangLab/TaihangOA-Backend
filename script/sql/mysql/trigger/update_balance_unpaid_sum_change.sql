CREATE DEFINER=`root`@`localhost` TRIGGER `update_balance_unpaid_sum_change` BEFORE UPDATE ON `project_balance_unpaid` FOR EACH ROW BEGIN





    SET NEW.sbf_zx_zj_unpaid = NEW.sbf_gzsb_zx_zj_unpaid + NEW.sbf_szsb_zx_zj_unpaid + NEW.sbf_sbsjgz_zx_zj_unpaid + NEW.sbf_sbzl_zx_zj_unpaid;





    SET NEW.sbf_zc_zj_unpaid = NEW.sbf_gzsb_zc_zj_unpaid + NEW.sbf_szsb_zc_zj_unpaid + NEW.sbf_sbsjgz_zc_zj_unpaid + NEW.sbf_sbzl_zc_zj_unpaid;





	SET NEW.sbf_gzsb_zj_unpaid = NEW.sbf_gzsb_zx_zj_unpaid + NEW.sbf_gzsb_zc_zj_unpaid;





	SET NEW.sbf_szsb_zj_unpaid = NEW.sbf_szsb_zx_zj_unpaid + NEW.sbf_szsb_zc_zj_unpaid;





	SET NEW.sbf_sbsjgz_zj_unpaid = NEW.sbf_sbsjgz_zx_zj_unpaid + NEW.sbf_sbsjgz_zc_zj_unpaid;





	SET NEW.sbf_sbzl_zj_unpaid = NEW.sbf_sbzl_zx_zj_unpaid + NEW.sbf_sbzl_zc_zj_unpaid;





	SET NEW.ywf_hyclgjhzyjlf_zx_zj_unpaid = NEW.ywf_hyclgjhzyjlf_hyf_zx_zj_unpaid + NEW.ywf_hyclgjhzyjlf_clf_zx_zj_unpaid + NEW.ywf_hyclgjhzyjlf_gjhzf_zx_zj_unpaid;





	SET NEW.ywf_cbwxxxcbzscqswf_zx_zj_unpaid = NEW.ywf_cbwxxxcbzscqswf_zscqswf_zx_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_ysdyzzf_zx_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_wxsjkf_zx_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_xxcbf_zx_zj_unpaid;





	SET NEW.ywf_zx_zj_unpaid = NEW.ywf_clf_zx_zj_unpaid + NEW.ywf_zlf_zx_zj_unpaid + NEW.ywf_sjybcjf_zx_zj_unpaid + NEW.ywf_cshyjgf_zx_zj_unpaid + NEW.ywf_rldlf_zx_zj_unpaid + NEW.ywf_bgf_zx_zj_unpaid + NEW.ywf_yscbf_zx_zj_unpaid + NEW.ywf_zscqswf_zx_zj_unpaid + NEW.ywf_clsyf_zx_zj_unpaid + NEW.ywf_chlf_zx_zj_unpaid + NEW.ywf_hyhwf_zx_zj_unpaid + NEW.ywf_gnxzf_zx_zj_unpaid + NEW.ywf_gjhzjlf_zx_zj_unpaid + NEW.ywf_hyclgjhzyjlf_zx_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_zx_zj_unpaid;





	SET NEW.ywf_hyclgjhzyjlf_zc_zj_unpaid = NEW.ywf_hyclgjhzyjlf_hyf_zc_zj_unpaid + NEW.ywf_hyclgjhzyjlf_clf_zc_zj_unpaid + NEW.ywf_hyclgjhzyjlf_gjhzf_zc_zj_unpaid;





	SET NEW.ywf_cbwxxxcbzscqswf_zc_zj_unpaid = NEW.ywf_cbwxxxcbzscqswf_zscqswf_zc_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_ysdyzzf_zc_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_wxsjkf_zc_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_xxcbf_zc_zj_unpaid;





	SET NEW.ywf_zc_zj_unpaid = NEW.ywf_clf_zc_zj_unpaid + NEW.ywf_zlf_zc_zj_unpaid + NEW.ywf_sjybcjf_zc_zj_unpaid + NEW.ywf_cshyjgf_zc_zj_unpaid + NEW.ywf_rldlf_zc_zj_unpaid + NEW.ywf_bgf_zc_zj_unpaid + NEW.ywf_yscbf_zc_zj_unpaid + NEW.ywf_zscqswf_zc_zj_unpaid + NEW.ywf_clsyf_zc_zj_unpaid + NEW.ywf_chlf_zc_zj_unpaid + NEW.ywf_hyhwf_zc_zj_unpaid + NEW.ywf_gnxzf_zc_zj_unpaid + NEW.ywf_gjhzjlf_zc_zj_unpaid + NEW.ywf_hyclgjhzyjlf_zc_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_zc_zj_unpaid;





	SET NEW.ywf_clf_zj_unpaid = NEW.ywf_clf_zx_zj_unpaid + NEW.ywf_clf_zc_zj_unpaid;





	SET NEW.ywf_zlf_zj_unpaid = NEW.ywf_zlf_zx_zj_unpaid + NEW.ywf_zlf_zc_zj_unpaid;





	SET NEW.ywf_sjybcjf_zj_unpaid = NEW.ywf_sjybcjf_zx_zj_unpaid + NEW.ywf_sjybcjf_zc_zj_unpaid;





	SET NEW.ywf_cshyjgf_zj_unpaid = NEW.ywf_cshyjgf_zx_zj_unpaid + NEW.ywf_cshyjgf_zc_zj_unpaid;





	SET NEW.ywf_rldlf_zj_unpaid = NEW.ywf_rldlf_zx_zj_unpaid + NEW.ywf_rldlf_zc_zj_unpaid;





	SET NEW.ywf_bgf_zj_unpaid = NEW.ywf_bgf_zx_zj_unpaid + NEW.ywf_bgf_zc_zj_unpaid;





	SET NEW.ywf_yscbf_zj_unpaid = NEW.ywf_yscbf_zx_zj_unpaid + NEW.ywf_yscbf_zc_zj_unpaid;





	SET NEW.ywf_zscqswf_zj_unpaid = NEW.ywf_zscqswf_zx_zj_unpaid + NEW.ywf_zscqswf_zc_zj_unpaid;





	SET NEW.ywf_clsyf_zj_unpaid = NEW.ywf_clsyf_zx_zj_unpaid + NEW.ywf_clsyf_zc_zj_unpaid;





	SET NEW.ywf_chlf_zj_unpaid = NEW.ywf_chlf_zx_zj_unpaid + NEW.ywf_chlf_zc_zj_unpaid;





	SET NEW.ywf_hyhwf_zj_unpaid = NEW.ywf_hyhwf_zx_zj_unpaid + NEW.ywf_hyhwf_zc_zj_unpaid;





	SET NEW.ywf_gnxzf_zj_unpaid = NEW.ywf_gnxzf_zx_zj_unpaid + NEW.ywf_gnxzf_zc_zj_unpaid;





	SET NEW.ywf_gjhzjlf_zj_unpaid = NEW.ywf_gjhzjlf_zx_zj_unpaid + NEW.ywf_gjhzjlf_zc_zj_unpaid;





	SET NEW.ywf_hyclgjhzyjlf_hyf_zj_unpaid = NEW.ywf_hyclgjhzyjlf_hyf_zx_zj_unpaid + NEW.ywf_hyclgjhzyjlf_hyf_zc_zj_unpaid;





	SET NEW.ywf_hyclgjhzyjlf_clf_zj_unpaid = NEW.ywf_hyclgjhzyjlf_clf_zx_zj_unpaid + NEW.ywf_hyclgjhzyjlf_clf_zc_zj_unpaid;





	SET NEW.ywf_hyclgjhzyjlf_gjhzf_zj_unpaid = NEW.ywf_hyclgjhzyjlf_gjhzf_zx_zj_unpaid + NEW.ywf_hyclgjhzyjlf_gjhzf_zc_zj_unpaid;





	SET NEW.ywf_cbwxxxcbzscqswf_zscqswf_zj_unpaid = NEW.ywf_cbwxxxcbzscqswf_zscqswf_zx_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_zscqswf_zc_zj_unpaid;





	SET NEW.ywf_cbwxxxcbzscqswf_ysdyzzf_zj_unpaid = NEW.ywf_cbwxxxcbzscqswf_ysdyzzf_zx_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_ysdyzzf_zc_zj_unpaid;





	SET NEW.ywf_cbwxxxcbzscqswf_wxsjkf_zj_unpaid = NEW.ywf_cbwxxxcbzscqswf_wxsjkf_zx_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_wxsjkf_zc_zj_unpaid;





	SET NEW.ywf_cbwxxxcbzscqswf_xxcbf_zj_unpaid = NEW.ywf_cbwxxxcbzscqswf_xxcbf_zx_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_xxcbf_zc_zj_unpaid;





	SET NEW.ywf_hyclgjhzyjlf_zj_unpaid = NEW.ywf_hyclgjhzyjlf_zx_zj_unpaid + NEW.ywf_hyclgjhzyjlf_zc_zj_unpaid;





	SET NEW.ywf_cbwxxxcbzscqswf_zj_unpaid = NEW.ywf_cbwxxxcbzscqswf_zx_zj_unpaid + NEW.ywf_cbwxxxcbzscqswf_zc_zj_unpaid;





	SET NEW.lwf_zjzxf_zj_unpaid = NEW.lwf_zjzxf_zx_zj_unpaid + NEW.lwf_zjzxf_zc_zj_unpaid;





	SET NEW.lwf_rylwf_zj_unpaid = NEW.lwf_rylwf_zx_zj_unpaid + NEW.lwf_rylwf_zc_zj_unpaid;





	SET NEW.lwf_zx_zj_unpaid = NEW.lwf_zjzxf_zx_zj_unpaid + NEW.lwf_rylwf_zx_zj_unpaid;





	SET NEW.lwf_zc_zj_unpaid = NEW.lwf_zjzxf_zc_zj_unpaid + NEW.lwf_rylwf_zc_zj_unpaid;





	SET NEW.clf_clf_zj_unpaid = NEW.clf_clf_zx_zj_unpaid + NEW.clf_clf_zc_zj_unpaid;





	SET NEW.clf_zx_zj_unpaid = NEW.clf_clf_zx_zj_unpaid;





	SET NEW.clf_zc_zj_unpaid = NEW.clf_clf_zc_zj_unpaid;





	SET NEW.kyhdf_zl_zj_unpaid = NEW.kyhdf_zl_zx_zj_unpaid + NEW.kyhdf_zl_zc_zj_unpaid;





	SET NEW.kyhdf_cshyjg_zj_unpaid = NEW.kyhdf_cshyjg_zx_zj_unpaid + NEW.kyhdf_cshyjg_zc_zj_unpaid;





	SET NEW.kyhdf_bg_zj_unpaid = NEW.kyhdf_bg_zx_zj_unpaid + NEW.kyhdf_bg_zc_zj_unpaid;





	SET NEW.kyhdf_sjybcj_zj_unpaid = NEW.kyhdf_sjybcj_zx_zj_unpaid + NEW.kyhdf_sjybcj_zc_zj_unpaid;





	SET NEW.kyhdf_yscb_zj_unpaid = NEW.kyhdf_yscb_zx_zj_unpaid + NEW.kyhdf_yscb_zc_zj_unpaid;





	SET NEW.kyhdf_zscqsw_zj_unpaid = NEW.kyhdf_zscqsw_zx_zj_unpaid + NEW.kyhdf_zscqsw_zc_zj_unpaid;





	SET NEW.kyhdf_rldl_zj_unpaid = NEW.kyhdf_rldl_zx_zj_unpaid + NEW.kyhdf_rldl_zc_zj_unpaid;





	SET NEW.kyhdf_clsy_zj_unpaid = NEW.kyhdf_clsy_zx_zj_unpaid + NEW.kyhdf_clsy_zc_zj_unpaid;





	SET NEW.kyhdf_zx_zj_unpaid = NEW.kyhdf_zl_zx_zj_unpaid + NEW.kyhdf_cshyjg_zx_zj_unpaid + NEW.kyhdf_bg_zx_zj_unpaid + NEW.kyhdf_sjybcj_zx_zj_unpaid

                                 + NEW.kyhdf_yscb_zx_zj_unpaid + NEW.kyhdf_zscqsw_zx_zj_unpaid + NEW.kyhdf_rldl_zx_zj_unpaid + NEW.kyhdf_clsy_zx_zj_unpaid;





	SET NEW.kyhdf_zc_zj_unpaid = NEW.kyhdf_zl_zc_zj_unpaid + NEW.kyhdf_cshyjg_zc_zj_unpaid + NEW.kyhdf_bg_zc_zj_unpaid + NEW.kyhdf_sjybcj_zc_zj_unpaid

                                 + NEW.kyhdf_yscb_zc_zj_unpaid + NEW.kyhdf_zscqsw_zc_zj_unpaid + NEW.kyhdf_rldl_zc_zj_unpaid + NEW.kyhdf_clsy_zc_zj_unpaid;





	SET NEW.kyfwf_zjzx_zj_unpaid = NEW.kyfwf_zjzx_zx_zj_unpaid + NEW.kyfwf_zjzx_zc_zj_unpaid;





	SET NEW.kyfwf_cl_zj_unpaid = NEW.kyfwf_cl_zx_zj_unpaid + NEW.kyfwf_cl_zc_zj_unpaid;





	SET NEW.kyfwf_hyhw_zj_unpaid = NEW.kyfwf_hyhw_zx_zj_unpaid + NEW.kyfwf_hyhw_zc_zj_unpaid;





	SET NEW.kyfwf_gjhzjl_zj_unpaid = NEW.kyfwf_gjhzjl_zx_zj_unpaid + NEW.kyfwf_gjhzjl_zc_zj_unpaid;





	SET NEW.kyfwf_gnxz_zj_unpaid = NEW.kyfwf_gnxz_zx_zj_unpaid + NEW.kyfwf_gnxz_zc_zj_unpaid;





	SET NEW.kyfwf_zx_zj_unpaid = NEW.kyfwf_zjzx_zx_zj_unpaid + NEW.kyfwf_cl_zx_zj_unpaid + NEW.kyfwf_hyhw_zx_zj_unpaid + NEW.kyfwf_gjhzjl_zx_zj_unpaid

                                 + NEW.kyfwf_gnxz_zx_zj_unpaid;





	SET NEW.kyfwf_zc_zj_unpaid = NEW.kyfwf_zjzx_zc_zj_unpaid + NEW.kyfwf_cl_zc_zj_unpaid + NEW.kyfwf_hyhw_zc_zj_unpaid + NEW.kyfwf_gjhzjl_zc_zj_unpaid

                                 + NEW.kyfwf_gnxz_zc_zj_unpaid;





    SET NEW.ryhlwbzf_rylw_zj_unpaid = NEW.ryhlwbzf_rylw_zx_zj_unpaid + NEW.ryhlwbzf_rylw_zc_zj_unpaid;





	SET NEW.ryhlwbzf_zx_zj_unpaid = NEW.ryhlwbzf_rylw_zx_zj_unpaid;





	SET NEW.ryhlwbzf_zc_zj_unpaid = NEW.ryhlwbzf_rylw_zc_zj_unpaid;





	SET NEW.sbf_jj_unpaid = NEW.sbf_zx_jj_unpaid + NEW.sbf_zc_jj_unpaid;





	SET NEW.clf_jj_unpaid = NEW.clf_zx_jj_unpaid + NEW.clf_zc_jj_unpaid;





	SET NEW.zlf_jj_unpaid = NEW.zlf_zx_jj_unpaid + NEW.zlf_zc_jj_unpaid;





	SET NEW.sjybcjf_jj_unpaid = NEW.sjybcjf_zx_jj_unpaid + NEW.sjybcjf_zc_jj_unpaid;





	SET NEW.cshyjgf_jj_unpaid = NEW.cshyjgf_zx_jj_unpaid + NEW.cshyjgf_zc_jj_unpaid;





	SET NEW.rldlf_jj_unpaid = NEW.rldlf_zx_jj_unpaid + NEW.rldlf_zc_jj_unpaid;





	SET NEW.bgf_jj_unpaid = NEW.bgf_zx_jj_unpaid + NEW.bgf_zc_jj_unpaid;





	SET NEW.yscbf_jj_unpaid = NEW.yscbf_zx_jj_unpaid + NEW.yscbf_zc_jj_unpaid;





	SET NEW.zscqswf_jj_unpaid = NEW.zscqswf_zx_jj_unpaid + NEW.zscqswf_zc_jj_unpaid;





	SET NEW.clsyf_jj_unpaid = NEW.clsyf_zx_jj_unpaid + NEW.clsyf_zc_jj_unpaid;





	SET NEW.chlf_jj_unpaid = NEW.chlf_zx_jj_unpaid + NEW.chlf_zc_jj_unpaid;





	SET NEW.hyhwf_jj_unpaid = NEW.hyhwf_zx_jj_unpaid + NEW.hyhwf_zc_jj_unpaid;





	SET NEW.zjzxf_jj_unpaid = NEW.zjzxf_zx_jj_unpaid + NEW.zjzxf_zc_jj_unpaid;





	SET NEW.jxzc_jj_unpaid = NEW.jxzc_zx_jj_unpaid + NEW.jxzc_zc_jj_unpaid;





	SET NEW.others_jj_unpaid = NEW.others_zx_unpaid + NEW.others_zc_unpaid;





	SET NEW.glf_jj_unpaid = NEW.glf_zx_jj_unpaid + NEW.glf_zc_jj_unpaid;





	SET NEW.fwzjf_jj_unpaid = NEW.fwzjf_zx_jj_unpaid + NEW.fwzjf_zc_jj_unpaid;





	SET NEW.rcsdnf_jj_unpaid = NEW.rcsdnf_zx_jj_unpaid + NEW.rcsdnf_zc_jj_unpaid;





	SET NEW.sbf_zj_unpaid = NEW.sbf_zx_zj_unpaid + NEW.sbf_zc_zj_unpaid;





	SET NEW.ywf_zj_unpaid = NEW.ywf_zx_zj_unpaid + NEW.ywf_zc_zj_unpaid;





	SET NEW.lwf_zj_unpaid = NEW.lwf_zx_zj_unpaid + NEW.lwf_zc_zj_unpaid;





	SET NEW.clf_zj_unpaid = NEW.clf_zx_zj_unpaid + NEW.clf_zc_zj_unpaid;





	SET NEW.kyhdf_zj_unpaid = NEW.kyhdf_zx_zj_unpaid + NEW.kyhdf_zc_zj_unpaid;





	SET NEW.kyfwf_zj_unpaid = NEW.kyfwf_zx_zj_unpaid + NEW.kyfwf_zc_zj_unpaid;





	SET NEW.ryhlwbzf_zj_unpaid = NEW.ryhlwbzf_zx_zj_unpaid + NEW.ryhlwbzf_zc_zj_unpaid;





	SET NEW.total_funds_zx_zj_unpaid = NEW.sbf_zx_zj_unpaid + NEW.ywf_zx_zj_unpaid + NEW.lwf_zx_zj_unpaid + NEW.clf_zx_zj_unpaid + NEW.kyhdf_zx_zj_unpaid + NEW.kyfwf_zx_zj_unpaid + NEW.ryhlwbzf_zx_zj_unpaid;





	SET NEW.total_funds_zc_zj_unpaid = NEW.sbf_zc_zj_unpaid + NEW.ywf_zc_zj_unpaid + NEW.lwf_zc_zj_unpaid + NEW.clf_zc_zj_unpaid + NEW.kyhdf_zc_zj_unpaid + NEW.kyfwf_zc_zj_unpaid + NEW.ryhlwbzf_zc_zj_unpaid;





	SET NEW.total_funds_zx_jj_unpaid = NEW.sbf_zx_jj_unpaid + NEW.clf_zx_jj_unpaid + NEW.zlf_zx_jj_unpaid + NEW.sjybcjf_zx_jj_unpaid + NEW.cshyjgf_zx_jj_unpaid + NEW.rldlf_zx_jj_unpaid + NEW.bgf_zx_jj_unpaid

										+ NEW.yscbf_zx_jj_unpaid + NEW.zscqswf_zx_jj_unpaid + NEW.clsyf_zx_jj_unpaid + NEW.chlf_zx_jj_unpaid + NEW.hyhwf_zx_jj_unpaid

										+ NEW.zjzxf_zx_jj_unpaid + NEW.jxzc_zx_jj_unpaid + NEW.others_zx_unpaid + NEW.glf_zx_jj_unpaid + NEW.fwzjf_zx_jj_unpaid + NEW.rcsdnf_zx_jj_unpaid;





	SET NEW.total_funds_zc_jj_unpaid = NEW.sbf_zc_jj_unpaid + NEW.clf_zc_jj_unpaid + NEW.zlf_zc_jj_unpaid + NEW.sjybcjf_zc_jj_unpaid + NEW.cshyjgf_zc_jj_unpaid + NEW.rldlf_zc_jj_unpaid + NEW.bgf_zc_jj_unpaid

										+ NEW.yscbf_zc_jj_unpaid + NEW.zscqswf_zc_jj_unpaid + NEW.clsyf_zc_jj_unpaid + NEW.chlf_zc_jj_unpaid + NEW.hyhwf_zc_jj_unpaid

										+ NEW.zjzxf_zc_jj_unpaid + NEW.jxzc_zc_jj_unpaid + NEW.others_zc_unpaid + NEW.glf_zc_jj_unpaid + NEW.fwzjf_zc_jj_unpaid + NEW.rcsdnf_zc_jj_unpaid;





	SET NEW.total_funds_zj_unpaid = NEW.sbf_zj_unpaid + NEW.ywf_zj_unpaid + NEW.lwf_zj_unpaid + NEW.clf_zj_unpaid + NEW.kyhdf_zj_unpaid + NEW.kyfwf_zj_unpaid + NEW.ryhlwbzf_zj_unpaid;





	SET NEW.total_funds_jj_unpaid = NEW.jxzc_jj_unpaid + NEW.others_jj_unpaid + NEW.sbf_jj_unpaid + NEW.clf_jj_unpaid + NEW.glf_jj_unpaid + NEW.fwzjf_jj_unpaid + NEW.rcsdnf_jj_unpaid + NEW.zjzxf_jj_unpaid

									+ NEW.jxzc_zx_jj_unpaid + NEW.sjybcjf_jj_unpaid + NEW.cshyjgf_jj_unpaid + NEW.rldlf_jj_unpaid + NEW.bgf_jj_unpaid + NEW.yscbf_jj_unpaid + NEW.zscqswf_jj_unpaid + NEW.clsyf_jj_unpaid + NEW.chlf_jj_unpaid + NEW.hyhwf_jj_unpaid;

























	SET NEW.total_funds_zx_unpaid = NEW.total_funds_zx_zj_unpaid + NEW.total_funds_zx_jj_unpaid;





	SET NEW.total_funds_zc_unpaid = NEW.total_funds_zc_zj_unpaid + NEW.total_funds_zc_jj_unpaid;





	SET NEW.total_funds_all_unpaid = NEW.total_funds_zj_unpaid + NEW.total_funds_jj_unpaid;



END
