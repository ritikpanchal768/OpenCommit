package com.example.opencommit.project;

import com.example.opencommit.commonServices.DbUtils;

import java.util.List;

public class ProjectDataAccess {


    public List<Projects> getbyusername(String ownerId)throws Exception{
        String query = "Select * from projects where ownerid = ? order by createdOn desc";
        return new DbUtils().returnedAsList(query,Projects.class,ownerId);
    }
}
