package com.example.demo.bbs;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BbsVo {
    private int bbsNo; 
    private String bbsTitle;
    private String bbsContent;
    private String bbsWriter;
    private Date bbsRegDate;
}
