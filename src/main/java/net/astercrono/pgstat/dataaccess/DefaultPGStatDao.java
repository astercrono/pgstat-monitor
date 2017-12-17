package net.astercrono.pgstat.dataaccess;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import net.astercrono.pgstat.model.Config;
import net.astercrono.pgstat.model.PGStat;

@Repository
public class DefaultPGStatDao implements PGStatDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private Config config;

	@Override
	public List<PGStat> getPGStats() {
		String sql = config.getSql();
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			PGStat row = new PGStat();

			row.setDuration(Objects.toString(rs.getString("dur"), ""));
			row.setPid(rs.getInt("pid"));
			row.setUser(Objects.toString(rs.getString("usr"), ""));
			row.setApp(Objects.toString(rs.getString("app"), ""));
			row.setAddress(Objects.toString(rs.getString("addr"), ""));
			row.setStart(Objects.toString(rs.getString("start"), ""));
			row.setState(Objects.toString(rs.getString("state"), ""));
			row.setQuery(Objects.toString(rs.getString("query"), ""));
			row.setMinutes(rs.getInt("minutes"));
			row.setWait(rs.getString("wait"));

			return row;
		});
	}
}
