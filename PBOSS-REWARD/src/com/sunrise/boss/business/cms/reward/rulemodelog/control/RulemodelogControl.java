/**
* auto-generated code
* Tue Jul 14 09:27:14 CST 2009
*/
package com.sunrise.boss.business.cms.reward.rulemodelog.control;

import com.sunrise.boss.common.base.control.AbstractControl;
import com.sunrise.boss.common.base.db.DataPackage;
import com.sunrise.boss.ui.commons.User;
import com.sunrise.boss.business.cms.reward.rulemodelog.persistent.RulemodelogVO;

import java.io.Serializable;

/**
 * <p>Title: RulemodelogControl</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: sunrise Tech Ltd.</p>
 * @author Linli
 * @version 1.0
 */
public interface RulemodelogControl extends AbstractControl {
    public RulemodelogVO doCreate(RulemodelogVO vo, User user)
        throws Exception;

    public void doRemove(RulemodelogVO vo, User user)
        throws Exception;

    public RulemodelogVO doUpdate(RulemodelogVO vo, User user)
        throws Exception;

    public RulemodelogVO doFindByPk(Serializable pk, User user)
        throws Exception;

}
