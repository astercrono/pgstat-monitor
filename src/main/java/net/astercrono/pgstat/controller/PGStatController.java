package net.astercrono.pgstat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.astercrono.pgstat.dataaccess.PGStatDao;
import net.astercrono.pgstat.model.Config;
import net.astercrono.pgstat.model.PGStat;

@Controller
public class PGStatController {
	@Autowired
	private Config config;

	@Autowired
	private PGStatDao pgStatDao;

	@RequestMapping(value = "/pgStats", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<PGStat> getPgStats() {
		return pgStatDao.getPGStats();
	}

	@RequestMapping(value = "pgStatMonitor", method = RequestMethod.GET)
	public String pgStatMonitor(Model model) {
		List<PGStat> stats = pgStatDao.getPGStats();
		model.addAttribute("stats", stats);
		model.addAttribute("config", config);
		return "pgStatMonitor";
	}
}
