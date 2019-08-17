package org.aaa.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aaa.web.entity.FlightTickets;
import org.aaa.web.entity.Flights;
import org.aaa.web.service.FlightsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	public FlightsService flightsService;
	
	@RequestMapping("/seeMain.html")
	public String seeMain() {
		
		return "main";
	}
	
	
	@RequestMapping("/getFlight")
	@ResponseBody
	public Object getFlight(Integer page,Integer limit,Flights flight,String takeAirportName,String ladingAirportName) {
		List<Integer> takeArrayCity;
		List<Integer> landArrayCity;
		if ((takeAirportName==null || takeAirportName=="") && (ladingAirportName == null || ladingAirportName =="")) {
			 takeArrayCity = flightsService.getAirportCity(takeAirportName);
			 landArrayCity = flightsService.getAirportCity(ladingAirportName);
		}else {
			 takeArrayCity = flightsService.getAirportCity(takeAirportName);
			 landArrayCity = flightsService.getAirportCity(ladingAirportName);
			
			if (takeArrayCity.size()==0 && landArrayCity.size()==0) {
				 landArrayCity.add(-1);
			}
			
			
		}
		
		
		List<Flights> data = flightsService.getFlights(page,limit,flight,takeArrayCity,landArrayCity);
		Integer count = flightsService.getCount(flight,takeArrayCity,landArrayCity);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("code", 0);
		map.put("data", data);
		map.put("count", count);
		return map;
	}
	
	
	@RequestMapping("/getTickets")
	@ResponseBody
	public Object getTickets(Integer id) {
		
		List<FlightTickets> data = flightsService.getTicket(id);
		int code=0;
		if (!(data.size()>0)) {
			code=1;
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("code", code);
		map.put("data", data);
		return map;
		
	}
	
}
