package com.gmcc.pboss.control.sales.bgcontrol.SMPActiveRateCalc.calcmode.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;

import com.gmcc.pboss.business.channel.way.WayVO;
import com.gmcc.pboss.business.sales.activerate.ActiverateVO;
import com.gmcc.pboss.business.sales.bgbusiness.PartnerSMPBrandVO;
import com.gmcc.pboss.business.sales.orderstd.OrderstdDBParam;
import com.gmcc.pboss.business.sales.orderstd.OrderstdVO;
import com.gmcc.pboss.control.base.sysparam.Sysparam;
import com.gmcc.pboss.control.base.sysparam.SysparamBO;
import com.gmcc.pboss.control.channel.way.Way;
import com.gmcc.pboss.control.channel.way.WayBO;
import com.gmcc.pboss.control.sales.activerate.Activerate;
import com.gmcc.pboss.control.sales.activerate.ActiverateBO;
import com.gmcc.pboss.control.sales.bgcontrol.SMPActiveRateCalc.SMPActiveRateCalc;
import com.gmcc.pboss.control.sales.bgcontrol.SMPActiveRateCalc.calcmode.intf.CalcMode;
import com.gmcc.pboss.control.sales.orderstd.Orderstd;
import com.gmcc.pboss.control.sales.orderstd.OrderstdBO;
import com.sunrise.jop.common.utils.bean.BeanUtils;
import com.sunrise.jop.common.utils.lang.LoggerUtils;
import com.sunrise.jop.common.utils.lang.PublicUtils;
import com.sunrise.jop.exception.BusinessException;
import com.sunrise.jop.infrastructure.control.BOFactory;
import com.sunrise.jop.infrastructure.db.DBAccessUser;
import com.sunrise.jop.infrastructure.db.DataPackage;
/**
 * 套卡激活率组合模式
 * @author zsw
 * @date 2010-03-18
 */
public class BuildupCalcMode implements CalcMode {

	private Logger log = Logger.getLogger(BuildupCalcMode.class);
	private SMPActiveRateCalc arcBO;
	private static String ALLBRAND = "AllBrand";
	
	public BuildupCalcMode(SMPActiveRateCalc arcBO) {
		this.arcBO = arcBO;
	}
	public void doSMPActiveRateCalc(DBAccessUser user) throws Exception {
		log.info("套卡激活率计算模式为\"组合模式\"");
		// 直接累计模式
		Sysparam spBo = (SysparamBO)BOFactory.build(SysparamBO.class, user);
		
//		String spBrandValue = spBo.doFindByID(12L, "pboss_fx");
		String spActiveOrderValue = spBo.doFindByID(32L, "pboss_fx");
		String spActiveValue = spBo.doFindByID(33L, "pboss_fx");
		String spInActiveValue = spBo.doFindByID(34L, "pboss_fx");
		
//		String brandValue = "";
//		if(spBrandValue == null) {
//			brandValue = "-1";
//			log.warn("系统参数配置表中没有参数类型为“pboss_fx”，参数标识为“12”的数据，按“ 不区分品牌”处理");
//		}else {
//			brandValue = spBrandValue.trim();
//		}
		// 已激活套卡订购天数
		String activeOrderDayValue = "";
		if(spActiveOrderValue == null) {
			activeOrderDayValue = "-1";
			log.warn("系统参数配置表中没有参数类型为“pboss_fx”，参数标识为“32”的数据，按 -1 处理");
		}else {
			activeOrderDayValue = spActiveOrderValue.trim();
			if(!PublicUtils.isInteger(activeOrderDayValue)) {
				throw new Exception("系统参数配置表中 \"已激活套卡订购天数\" 的值不是整数");
			}
		}
		// 已激活套卡激活天数
		String activeDayValue = "";
		if(spActiveValue == null) {
			activeDayValue = "-1";
			log.warn("系统参数配置表中没有参数类型为“pboss_fx”，参数标识为“33”的数据，按 -1 处理");
		}else {
			activeDayValue = spActiveValue.trim();
			if(!PublicUtils.isInteger(activeDayValue)) {
				throw new Exception("系统参数配置表中 \"已激活套卡激活天数\" 的值不是整数");
			}
		}
		// 未激活套卡订购天数
		String inActiveOrderDayValue = "";
		if(spInActiveValue == null) {
			inActiveOrderDayValue = "-1";
			log.warn("系统参数配置表中没有参数类型为“pboss_fx”，参数标识为“34”的数据，按 -1 处理");
		}else {
			inActiveOrderDayValue = spInActiveValue.trim();
			if(!PublicUtils.isInteger(inActiveOrderDayValue)) {
				throw new Exception("系统参数配置表中 \"未激活套卡订购天数\" 的值不是整数");
			}
		}
		
		Integer intActiveOrderDay = Integer.parseInt(activeOrderDayValue);
		
		Integer intActiveDay = Integer.parseInt(activeDayValue);

		Integer intInactiveOrderDay = Integer.parseInt(inActiveOrderDayValue);
		
//		if("1".equals(brandValue.trim())) {
//			log.info("区分品牌");
			// 区分品牌
			Way wayBo = (WayBO)BOFactory.build(WayBO.class, user);
			Orderstd osBo = (OrderstdBO)BOFactory.build(OrderstdBO.class,user);
			Activerate arBo = (ActiverateBO)BOFactory.build(ActiverateBO.class,user,BOFactory.PROPAGATION_REQUIRES_NEW);
			
			Map<PartnerSMPBrandVO, Long[]> dataMap = 
				arcBO.doStatSMPWithBrand(intActiveOrderDay, 
						intActiveDay, intInactiveOrderDay);
			
			Map<String, Map<PartnerSMPBrandVO, Object[]>> wayidAndActiveRateMap = this.getWayidAndActiveRateMap(dataMap);
			 
			Set<String> keys = wayidAndActiveRateMap.keySet();
			for(Iterator<String> it = keys.iterator();it.hasNext();) {
				try {
					String wayid = it.next();
					Map<PartnerSMPBrandVO, Object[]> activeRateMap = wayidAndActiveRateMap.get(wayid);
					
					WayVO wayVo = wayBo.doFindByPk(wayid);
					String _cityid = wayVo.getCityid();
					String _countyid = wayVo.getCountyid();
					String _cooptype = wayVo.getCusttype();
					Long _starlevel = wayVo.getStarlevel();
					
					OrderstdDBParam osParam = new OrderstdDBParam();
					if(_cityid == null || "".equals(_cityid.trim())) {
						throw new BusinessException("渠道："+wayid+" 的 cityid 字段为空",null);
					}
					if(_countyid == null || "".equals(_countyid.trim())) {
						throw new BusinessException("渠道："+wayid+" 的 countyid 字段为空",null);
					}
					if(_cooptype == null || "".equals(_cooptype.trim())) {
//						throw new Exception("渠道："+wayid+" 的 custtype 字段为空");
						// 若合作类型为空，则按照合作类型等于“ALL”来处理
						osParam.set_se_cooptype("ALL");
					}else {
						osParam.set_se_cooptype(_cooptype);
					}
					if(_starlevel == null || "".equals(_starlevel.toString().trim())) {
						throw new BusinessException("渠道："+wayid+" 的 starlevel 字段为空",null);
					}
					for(Iterator<PartnerSMPBrandVO> ait = activeRateMap.keySet().iterator();ait.hasNext();) {
						try {
							PartnerSMPBrandVO pbVo = ait.next();
							String brand = pbVo.getBrand();
							
							if(brand == null || "".equals(brand.trim())) {
								throw new BusinessException("合作商资源表 FX_SW_PARTNERRES 中存在 渠道ID为  "+wayid+" 的数据其品牌字段Brand的值为空，请核实。",null);
							}
							
							Object[] value = activeRateMap.get(pbVo);
							
							osParam.set_se_cityid(_cityid);
							osParam.set_se_countyid(_countyid);
							osParam.set_ne_starlevel(_starlevel.toString());
							osParam.set_se_brand(brand);
							osParam.set_se_stdtype("ACTRATE");
							osParam.set_pagesize("0");
							osParam.setDataOnly(true);
							DataPackage osDp = osBo.doQuery(osParam);
							List osDatas = osDp.getDatas();
							
							double activeRate = (Double)value[0];
							long activeQuantity = (Long)value[1];
							long inActiveQuantity = (Long)value[2];
							
							Serializable pkVO = new ActiverateVO();
							BeanUtils.setProperty(pkVO, "wayid", wayid);
							BeanUtils.setProperty(pkVO, "brand", brand);
							ActiverateVO arVo = arBo.doFindByPk(pkVO);
							boolean isNew = arVo == null ? true : false;
							if(isNew) {
								arVo = new ActiverateVO();
								arVo.setWayid(wayid);
								arVo.setBrand(brand);
							}
							if(_cooptype == null || "".equals(_cooptype.trim())) {
								// 若合作类型为空，则按照合作类型等于“ALL”来处理
							}else if((osDatas == null || osDatas.size() <= 0)) {
								// 若渠道合作类型不为空且无数据则按照合作类型等于“ALL”再次查询，
								// 如果仍然无数据，是否达标字段取1，达标差距取0。(根据CR_SW20100624_1065427做修改)
								osParam.set_se_cooptype("ALL");
								osDp = osBo.doQuery(osParam);
								osDatas = osDp.getDatas();
								if(osDatas == null || osDatas.size() <= 0) {
									arVo.setIsachieve(new Short("1"));
									arVo.setDifamt(0L);
								}
							}
							if((osDatas == null || osDatas.size() <= 0)) {
								// 如果仍然无数据，是否达标字段取1，达标差距取0。(根据CR_SW20100624_1065427做修改)
								arVo.setIsachieve(new Short("1"));
								arVo.setDifamt(0L);
							}else {
								OrderstdVO osVo = (OrderstdVO)(osDatas.get(0));
								double lowestStd = osVo.getLoweststd();
								
								if(activeRate >= lowestStd) {
									arVo.setIsachieve(new Short("1"));
									// 达标时达标差距取0
									arVo.setDifamt(0L);
								}else {
									arVo.setIsachieve(new Short("0"));
									double lowestQuantity = (activeQuantity+inActiveQuantity)*lowestStd;
									// 达标差距
									double difamt = lowestQuantity - activeQuantity;
									difamt = Math.ceil(difamt);
									arVo.setDifamt((long)difamt);
								}
							}
							// 更新时间
							arVo.setChgtime(new Date());
							// 激活率
							arVo.setRate(activeRate);
							if(isNew) {
								arBo.doCreate(arVo);
								log.info("新增套卡激活率数据："+"[渠道标识:"+wayid+";品牌:"+brand+";激活率:"+activeRate+";是否达标:"+arVo.getIsachieve()+";达标差距(已达标时为0):"+arVo.getDifamt());
							}else {
								arBo.doUpdate(arVo);
								log.info("更新套卡激活率数据："+"[渠道标识:"+wayid+";品牌:"+brand+";激活率:"+activeRate+";是否达标:"+arVo.getIsachieve()+";达标差距(已达标时为0):"+arVo.getDifamt());
							}
						}catch(BusinessException ex) {
							log.info(ex.getMessage());
						}catch(Exception ex) {
							LoggerUtils.error(ex, log);
						}
					}
					
				}catch(BusinessException ex) {
					log.info(ex.getMessage());
				}catch(Exception ex) {
					LoggerUtils.error(ex, log);
				}
			}
			
//		}else {
//			log.info("不区分品牌");
//			// 不区分品牌
//			Way wayBo = (WayBO)BOFactory.build(WayBO.class, user);
//			Orderstd osBo = (OrderstdBO)BOFactory.build(OrderstdBO.class,user);
//			Activerate arBo = (ActiverateBO)BOFactory.build(ActiverateBO.class,user,BOFactory.PROPAGATION_REQUIRES_NEW);
//			
//			Map<String,String> dataMap = arcBO.doStatSMPNotWithBrand(intActiveOrderDay, 
//						intActiveDay, intInactiveOrderDay);
//			
//			Set<String> keys = dataMap.keySet();
//			for(Iterator<String> it = keys.iterator();it.hasNext();) {
//				try {
//					String wayid = it.next();
//					String[] quantity = dataMap.get(wayid).split("\\|");
//					long activeQuantity = Long.parseLong(quantity[0]);
//					long inActiveQuantity = Long.parseLong(quantity[1]);
//					double activeRate = (double)activeQuantity/((double)activeQuantity+(double)inActiveQuantity);
//					WayVO wayVo = wayBo.doFindByPk(wayid);
//					String _cityid = wayVo.getCityid();
//					String _countyid = wayVo.getCountyid();
//					String _cooptype = wayVo.getCusttype();
//					Long _starlevel = wayVo.getStarlevel();
//					
//					OrderstdDBParam osParam = new OrderstdDBParam();
//					if(_cityid == null || "".equals(_cityid.trim())) {
//						throw new Exception("渠道："+wayid+" 的 cityid 字段为空");
//					}
//					if(_countyid == null || "".equals(_countyid.trim())) {
//						throw new Exception("渠道："+wayid+" 的 countyid 字段为空");
//					}
//					if(_cooptype == null || "".equals(_cooptype.trim())) {
////						throw new Exception("渠道："+wayid+" 的 custtype 字段为空");
//						// 若合作类型为空，则按照合作类型等于“ALL”来处理
//						osParam.set_se_cooptype("ALL");
//					}else {
//						osParam.set_se_cooptype(_cooptype);
//					}
//					if(_starlevel == null || "".equals(_starlevel.toString().trim())) {
//						throw new Exception("渠道："+wayid+" 的 starlevel 字段为空");
//					}
//					
//					osParam.set_se_cityid(_cityid);
//					osParam.set_se_countyid(_countyid);
//					osParam.set_ne_starlevel(_starlevel.toString());
//					osParam.set_se_brand("AllBrand");
//					osParam.set_se_stdtype("ACTRATE");
//					osParam.set_pagesize("0");
//					osParam.setDataOnly(true);
//					DataPackage osDp = osBo.doQuery(osParam);
//					Collection osDatas = osDp.getDatas();
//					if(_cooptype == null || "".equals(_cooptype.trim())) {
//						if((osDatas == null || osDatas.size() <= 0)) {
//							continue;
//						}
//					}else {
//						// 若渠道合作类型不为空且无数据则按照合作类型等于“ALL”再次查询，如果仍然无数据则处理下一条记录
//						if((osDatas == null || osDatas.size() <= 0)) {
//							osParam.set_se_cooptype("ALL");
//							osDp = osBo.doQuery(osParam);
//							osDatas = osDp.getDatas();
//							if(osDatas == null || osDatas.size() <= 0) {
//								continue;
//							}
//						}
//					}
//					OrderstdVO osVo = (OrderstdVO)(new ArrayList(osDatas).get(0));
//					double lowestStd = osVo.getLoweststd();
//					Serializable pkVO = new ActiverateVO();
//					BeanUtils.setProperty(pkVO, "wayid", wayid);
//					BeanUtils.setProperty(pkVO, "brand", "AllBrand");
//					ActiverateVO arVo = arBo.doFindByPk(pkVO);
//					boolean isNew = arVo == null ? true : false;
//					if(isNew) {
//						arVo = new ActiverateVO();
//						arVo.setWayid(wayid);
//						arVo.setBrand("AllBrand");
//					}
//					if(activeRate >= lowestStd) {
//						arVo.setIsachieve(new Short("1"));
//					}else {
//						arVo.setIsachieve(new Short("0"));
//						double lowestQuantity = (activeQuantity+inActiveQuantity)*lowestStd;
//						// 达标差距
//						double difamt = lowestQuantity - activeQuantity;
//						difamt = Math.ceil(difamt);
//						arVo.setDifamt((long)difamt);
//					}
//					// 更新时间
//					arVo.setChgtime(new Date());
//					// 激活率
//					arVo.setRate(activeRate);
//					if(isNew) {
//						arBo.doCreate(arVo);
//					}else {
//						arBo.doUpdate(arVo);
//					}
//					if(isNew) {
//						log.info("新增套卡激活率数据："+"[渠道标识:"+wayid+";品牌:AllBrand"+";激活率:"+activeRate+";是否达标:"+arVo.getIsachieve()+";达标差距(已达标时为null):"+arVo.getDifamt());
//					}else {
//						log.info("跟新套卡激活率数据："+"[渠道标识:"+wayid+";品牌:AllBrand"+";激活率:"+activeRate+";是否达标:"+arVo.getIsachieve()+";达标差距(已达标时为null):"+arVo.getDifamt());
//					}
//				}catch(Exception ex) {
//					LoggerUtils.error(ex, log);
//				}
//			}
//		}

	}
	/**
	 * 激活率计算：计算各品牌以及“所有品牌”的套卡激活率，激活率=已激活数/（已激活数+未激活数）。
	 * 计算“所有品牌”激活率时需要将各品牌已激活数和未激活数分别累加，“所有品牌”代码取“AllBrand”。
	 * @param dataMap
	 * @return 以渠道ID分类存放各渠道对应的各品牌和"所有品牌"的激活率,激活量,未激活量的Map
	 * @throws Exception
	 */
	private Map<String, Map<PartnerSMPBrandVO, Object[]>> getWayidAndActiveRateMap(
			Map<PartnerSMPBrandVO, Long[]> dataMap) throws Exception {
		
		// 以渠道ID分类存放各渠道对应的各品牌和"所有品牌"的激活率,激活量,未激活量的Map
		Map<String, Map<PartnerSMPBrandVO, Object[]>> wayidAndActiveRateMap = new HashMap<String, Map<PartnerSMPBrandVO, Object[]>>();
		// 存放渠道ID和未激活量的Map
		Map<String,Long> wayAndInActiveQty = new HashMap<String,Long>();
		// 存放渠道ID和激活量的Map
		Map<String,Long> wayAndActiveQty = new HashMap<String,Long>();
		
		Set<PartnerSMPBrandVO> keys = dataMap.keySet();
		for(Iterator<PartnerSMPBrandVO> it = keys.iterator();it.hasNext();) {
			PartnerSMPBrandVO pbVo = it.next();
			String wayid = pbVo.getWayid();
			Long[] quantity = dataMap.get(pbVo);
			long activeQuantity = quantity[0];
			long inActiveQuantity = quantity[1];
			double activeRate = (double)activeQuantity/((double)activeQuantity+(double)inActiveQuantity);
			Object[] value = {activeRate,activeQuantity,inActiveQuantity};
			if(wayidAndActiveRateMap.containsKey(wayid)) {
				Map<PartnerSMPBrandVO, Object[]> activeRateMap = wayidAndActiveRateMap.get(wayid);
				activeRateMap.put(pbVo, value);
			}else {
				Map<PartnerSMPBrandVO,Object[]> activeRateMap = new HashMap<PartnerSMPBrandVO,Object[]>();
				activeRateMap.put(pbVo, value);
				wayidAndActiveRateMap.put(wayid, activeRateMap);
			}
			if(wayAndInActiveQty.containsKey(wayid)) {
				long oldInActiveQty = wayAndInActiveQty.get(wayid);
				long newInActiveQty = inActiveQuantity + oldInActiveQty;
				wayAndInActiveQty.put(wayid, newInActiveQty);
			}else {
				wayAndInActiveQty.put(wayid,inActiveQuantity);
			}
			if(wayAndActiveQty.containsKey(wayid)) {
				long oldActiveQty = wayAndActiveQty.get(wayid);
				long newActiveQty = activeQuantity + oldActiveQty;
				wayAndActiveQty.put(wayid, newActiveQty);
			}else {
				wayAndActiveQty.put(wayid, activeQuantity);
			}
		}
		for(Iterator<String> it = wayAndActiveQty.keySet().iterator();it.hasNext();) {
			String wayid = it.next();
			PartnerSMPBrandVO allBrand_pbVO = new PartnerSMPBrandVO(wayid,ALLBRAND);
			long activeQty_AllBrand = wayAndActiveQty.get(wayid);
			long inActiveQty_AllBrand = wayAndInActiveQty.get(wayid);
			double activeRate_AllBrand = (double)activeQty_AllBrand/((double)activeQty_AllBrand+(double)inActiveQty_AllBrand);
			Object[] value_AllBrand = {activeRate_AllBrand,activeQty_AllBrand,inActiveQty_AllBrand};
			Map<PartnerSMPBrandVO,Object[]> activeRateMap = wayidAndActiveRateMap.get(wayid);
			activeRateMap.put(allBrand_pbVO, value_AllBrand);
			wayidAndActiveRateMap.put(wayid, activeRateMap);
		}
		return wayidAndActiveRateMap;
	}

}
