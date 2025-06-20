package com.example.opencommit.taskManagement;

import com.example.opencommit.commonServices.DbUtils;

import java.util.List;

public class TaskManagementDataAccess {

    public List<Tasks> getbyProjectId(String projectId)throws Exception{

        String query = "Select * from tasks where projectid = ?";
        return new DbUtils().returnedAsList(query,Tasks.class,projectId);
    }
}
