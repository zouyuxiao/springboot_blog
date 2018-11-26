package com.yuxiao.blog.controller;

import com.csvreader.CsvReader;
import com.csvreader.CsvWriter;
import com.yuxiao.blog.bean.User;
import com.yuxiao.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.nio.charset.Charset;

/**
 * Created by ${邹} on 2018/11/14.
 * 描述：利用JavaCSV API来读写csv文件
 * 教程网址：https://blog.csdn.net/loongshawn/article/details/53423121
 *  http://javacsv.sourceforge.net/
 *  https://sourceforge.net/projects/javacsv/
 */
@Controller
public class CSVController {
    @Autowired
    UserService userService;
    public static void read(){
        String filePath ="E:\\我的文档\\2.1扩展题.xlsx";
        try{
            // 创建csv对象
            CsvReader csvReader = new CsvReader(filePath,',',Charset.forName( "GBK" ));
            // 读表头
            csvReader.readHeaders();
            while (csvReader.readRecord()){
                // 读一整行
                System.out.println( csvReader.getRawRecord() );
                //读这行的某一列
                System.out.println( csvReader.get( "Link" ) );
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 操作
    @GetMapping("/csv")
    public void write(User user){
        String filePath = "E:\\我的文档\\2.1扩展题.xlsx";
        try {
            // 创建CSV写对象
            CsvWriter csvWriter = new CsvWriter(filePath,',', Charset.forName("GBK"));
            //CsvWriter csvWriter = new CsvWriter(filePath);
            // 写表头
            String[] headers = {"编号","姓名","年龄"};
            String[] content = {"12365","张山","34"};
            csvWriter.writeRecord(headers);
            csvWriter.writeRecord(content);
            csvWriter.close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        write();
//        read();
    }
}
