package net.astercrono.pgstat.model;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("pgamon")
public class Config {
	private String sql;
	private Integer refreshInterval;
	private Integer warningThreshold;
	private Integer dangerThreshold;

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public Integer getRefreshInterval() {
		return refreshInterval;
	}

	public void setRefreshInterval(Integer refreshInterval) {
		this.refreshInterval = refreshInterval;
	}

	public Integer getWarningThreshold() {
		return warningThreshold;
	}

	public void setWarningThreshold(Integer warningThreshold) {
		this.warningThreshold = warningThreshold;
	}

	public Integer getDangerThreshold() {
		return dangerThreshold;
	}

	public void setDangerThreshold(Integer dangerThreshold) {
		this.dangerThreshold = dangerThreshold;
	}
}
