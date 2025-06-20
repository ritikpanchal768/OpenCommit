package com.example.opencommit.project;

import com.example.opencommit.commonServices.CommonResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/projects")
public class ProjectController {

    private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

    @PostMapping("/create/project")
    public CommonResponse<Projects> addProject(@RequestBody ProjectRequest request) throws Exception {
        logger.info("************* Inside Add project Controller ****************");

        CommonResponse<Projects> commonResponse;
        try {
            commonResponse = new ProjectHelper().addProjectRequest(request);
        } catch (Exception e) {
            throw new Exception(e);
        }
        return commonResponse;
    }

    @GetMapping("/view/all/{username}")
    public CommonResponse<List<Projects>> viewbyusername(@PathVariable String username)throws Exception{
        CommonResponse<List<Projects>> commonResponse;
        try {
            commonResponse = new ProjectHelper().viewbyusername(username);
        } catch (Exception e) {
            throw new Exception(e);
        }
        return commonResponse;
    }
}
