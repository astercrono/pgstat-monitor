package net.astercrono.pgstat.dataaccess;

import java.util.List;

import net.astercrono.pgstat.model.PGStat;

public interface PGStatDao {
	List<PGStat> getPGStats();
}
