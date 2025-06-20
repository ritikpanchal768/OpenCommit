package com.example.opencommit.project;

import com.example.opencommit.commonServices.CommonResponse;
import com.example.opencommit.commonServices.DbUtils;
import com.example.opencommit.commonServices.OCUtils;
import com.example.opencommit.usermanagement.Users;
import com.example.opencommit.usermanagement.UsersDataAccess;
import org.springframework.util.ObjectUtils;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.Collections;
import java.util.List;

public class ProjectHelper {
    public CommonResponse addProjectRequest(ProjectRequest request)throws Exception{
        CommonResponse<Projects> commonResponse = new CommonResponse<>();
        Projects project = new Projects();
        OCUtils.copyNonNullFields(request,project);

//        Get user with user id
        Users users = new UsersDataAccess().getByUsername(request.getUsername());

//        Populate Project
        project.setOwnerid(users.getId());
        project.setCreatedBy(users.getFullName());
        project.setCreatedOn(Timestamp.from(Instant.now()));

//        Save in Db
        new DbUtils().saveObject(project,"projects");

//        prepare response
        commonResponse.setCode("200");
        commonResponse.setResponseMessage("Success");
        commonResponse.setResponseObject(project);
        return commonResponse;
    }

    public CommonResponse<List<Projects>> viewbyusername(String username)throws Exception{
        CommonResponse<List<Projects>> commonResponse = new CommonResponse<>();

//        Get user with user id
        Users users = new UsersDataAccess().getByUsername(username);

//        Get List of Projects by owner Id
        List<Projects> projects = new ProjectDataAccess().getbyusername(users.getId());

        if(ObjectUtils.isEmpty(projects)){
            commonResponse.setCode("101");
            commonResponse.setResponseMessage("");
        }
        //        prepare response
        commonResponse.setCode("200");
        commonResponse.setResponseMessage("Success");
        commonResponse.setResponseObject(projects);
        return commonResponse;
    }
}
