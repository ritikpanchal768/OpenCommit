package com.example.opencommit.project;

import com.example.opencommit.commonServices.CommonResponse;
import com.example.opencommit.commonServices.DbUtils;
import com.example.opencommit.commonServices.OCUtils;
import com.example.opencommit.usermanagement.Users;
import com.example.opencommit.usermanagement.UsersDataAccess;

import java.sql.Timestamp;
import java.time.Instant;

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
}
