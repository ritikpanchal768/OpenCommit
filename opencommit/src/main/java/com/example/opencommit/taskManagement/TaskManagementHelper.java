package com.example.opencommit.taskManagement;
import java.util.List;
import com.example.opencommit.commonServices.CommonResponse;
import com.example.opencommit.commonServices.DbUtils;
import com.example.opencommit.commonServices.OCUtils;
import com.example.opencommit.project.ProjectRequest;
import com.example.opencommit.project.Projects;
import com.example.opencommit.usermanagement.Users;
import com.example.opencommit.usermanagement.UsersDataAccess;
import org.springframework.util.ObjectUtils;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

public class TaskManagementHelper {
    public CommonResponse addTask(TasksRequest request)throws Exception{
        CommonResponse<Tasks> commonResponse = new CommonResponse<>();
        Tasks tasks = new Tasks();
        OCUtils.copyNonNullFields(request,tasks);

//        Get user with user id
        Users users = new UsersDataAccess().getByUsername(request.getUsername());

//        Populate Project
        tasks.setReportTo(users.getFullName());
        tasks.setCreatedBy(users.getFullName());
        tasks.setCreatedOn(Timestamp.from(Instant.now()));

//        Save in Db
        new DbUtils().saveObject(tasks,"tasks");

//        prepare response
        commonResponse.setCode("200");
        commonResponse.setResponseMessage("Success");
        commonResponse.setResponseObject(tasks);
        return commonResponse;
    }
    public CommonResponse<List<Tasks>> viewbyusername(String projectId)throws Exception{
        CommonResponse<List<Tasks>> commonResponse = new CommonResponse<>();

//        Get List of Projects by owner Id
       List<Tasks> tasks = new TaskManagementDataAccess().getbyProjectId(projectId);

        if(ObjectUtils.isEmpty(tasks)){
            commonResponse.setCode("101");
            commonResponse.setResponseMessage("No Task Created !!!!!");
        }
        //        prepare response
        commonResponse.setCode("200");
        commonResponse.setResponseMessage("Success");
        commonResponse.setResponseObject(tasks);
        return commonResponse;
    }
}
