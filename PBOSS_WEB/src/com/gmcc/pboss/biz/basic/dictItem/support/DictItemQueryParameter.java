package com.gmcc.pboss.biz.basic.dictItem.support;

import com.gmcc.pboss.common.support.QueryAction;
import com.gmcc.pboss.common.support.QueryParameter;

public class DictItemQueryParameter extends QueryParameter {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	public DictItemQueryParameter() {
		setAction(QueryAction.ALL);// ����ҳ
	}

	private String query;

	private int limit = 10;

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

}
