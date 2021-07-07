package com.Intern.MicrosoftProject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@SessionAttributes({"mipData","mipName","mName","updatedName"})
public class AppController {

    @Autowired
    JdbcTemplate conn;

    @GetMapping("/")
    public String index(ModelMap model){
        return "index";
    }
    @GetMapping("/list")
    public String list(ModelMap model){
        List<String[]> data = conn.query("SELECT * FROM mips",
                (row, index) -> {
                    return new String[]{row.getString("mip_id"),
                            row.getString("name")};
                });

        model.addAttribute("mipData", data.toArray(new String[0][2]));

        return "list";
    }
    @GetMapping("/addMip")
    public String addMip(ModelMap model){
        return "addMip";
    }
    @PostMapping("/addMip")
    public String addMip(ModelMap model, @RequestParam String mipName){
        model.put("mipName",mipName);

        String addMipQuery = "INSERT INTO mips(name)  VALUES" + "('"+ mipName +"')";

        conn.update(addMipQuery);

        return "addMip";
    }
    @GetMapping("/removeMip")
    public String removeMip(ModelMap model){
        return "removeMip";
    }
    @PostMapping("/removeMip")
    public String removeMip(ModelMap model, @RequestParam String mName){
        model.put("mName",mName);
        if (mName == null){
            model.put("errorMessage","Please enter a valid mip name! ");
            return "removeMip";
        }

        String removeMipQuery = "DELETE FROM mips WHERE name = " + "'"+mName+"' ";
        conn.update(removeMipQuery);
        return "removeMip";
    }
    @GetMapping("/updateMip")
    public String updateMip(ModelMap model){
        return "updateMip";
    }
    @PostMapping("/updateMip")
    public String updateMip(ModelMap model, @RequestParam String changingName, @RequestParam String updatedName ){
        model.put("updatedName",updatedName);
        if(updatedName == null){
            model.put("errorMessage","Please enter a valid mip name!");
            return "removeMip";
        }

        String updateMipQuery = "UPDATE mips SET name = " + "'"+updatedName+"'" + " WHERE name = " + "'"+changingName+"'";
        conn.update(updateMipQuery);

        return "updateMip";
    }
}
