package com.project.kinone.util;

import java.util.HashMap;
import java.util.List;

import com.project.kinone.model.Club;

public class clubname {

	public static HashMap<String, String> insertcname(List<Club> clist){
		HashMap<String, String> cnamemap = new HashMap<String,String>();
		System.out.println("clistsize="+clist.size());
		for (int i=0; i<clist.size();i++) {
			
			cnamemap.put(clist.get(i).getCcode(),clist.get(i).getCname());
			
		}
		
		System.out.println("cnamemapsize="+cnamemap.size());
		
		return cnamemap;
	}
	
}
