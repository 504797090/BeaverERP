package com.beaver.controller.purchase;

import com.beaver.bean.Account;
import com.beaver.bean.Purchase;
import com.beaver.bean.vo.PurchaseAccountSupplierMaterial;
import com.beaver.service.AccountService;
import com.beaver.service.MaterialService;
import com.beaver.service.PurchaseService;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/purchase")
@Controller
public class PurchaseController {

    @Autowired
    private PurchaseService purchaseService;

    @Autowired
    private MaterialService materialService;

    @Autowired
    HttpServletRequest request;

    @Autowired
    private AccountService accountService;

    @RequestMapping("/getAllPurchase")
    @ResponseBody
    public List<PurchaseAccountSupplierMaterial> getAllPurchase() {
        return purchaseService.getAllPurchase();
    }

    @RequestMapping("/addtOnePurchase")
    @ResponseBody
    public int addtOnePurchase(Purchase purchase) throws UnsupportedEncodingException {
        HttpSession sessoin = request.getSession();
        int m_id = materialService.findMaxId();
        String sponsorUsername = (String) sessoin.getAttribute("bv_name");
        String sponsorDepartment = (String) sessoin.getAttribute("bv_department");
        String bvPassword = (String) sessoin.getAttribute("bv_password");

        Account solve1 = new Account();
        solve1.setBvName(sponsorUsername);
        solve1.setBvPassword(bvPassword);
        Account solve2 = accountService.userLonin(solve1);
        sponsorDepartment = solve2.getBvDepartment();
        sponsorUsername = solve2.getBvName();

        purchase.setSponsorDepartment(sponsorDepartment);
        purchase.setSponsorUsername(sponsorUsername);
        purchase.setMId(m_id);
        return purchaseService.addtOnePurchase(purchase);
    }

    @RequestMapping("/updatePurchase")
    @ResponseBody
    public int updatePurchase(Purchase purchase) {
//        System.out.println("打印这个时间==="+purchase.getPayTime1());
//        String format1 = null;
//        if (purchase.getPayTime1() != null) {
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//             format1 = format.format(purchase.getPayTime1());
//            Date date = new Date();
//           purchase.setPayTime1(new Timestamp(date.getTime()));
//        }
//
//        String format2 = null;
//        if (purchase.getPayTime1() != null) {
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            Date date = new Date(String.valueOf(purchase.getPayTime2()));
//            format2 = format.format(date);
//        }
        System.out.println(purchase.getPayTime1());
        System.out.println(purchase.getPayTime2());

        return purchaseService.updatePurchasFromTable(purchase);
    }

    public static String checkDate(String str) {
        String format1 = null;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(str);
        format1 = format.format(date);

        return format1;
    }

    @RequestMapping("/deletePurchase")
    @ResponseBody
    public int deletePurchase(int pid) {
        return purchaseService.deletePurchase(pid);
    }

    @RequestMapping("/addPurchaseList")
    @ResponseBody
    public int addPurchaseList(MultipartHttpServletRequest request) {
        MultipartFile file = request.getFile("file");
        if (file == null) {
            System.out.println("file is null");
        }
        InputStream inputStream = null;
        try {
            inputStream = file.getInputStream();
            XSSFWorkbook wb = new XSSFWorkbook(inputStream);
            int sheets = wb.getNumberOfSheets();
            List<Account> accounts = new ArrayList<>();
            for (int i = 0; i < sheets; i++) {
                XSSFSheet sheet = wb.getSheetAt(i);
                int rows = sheet.getLastRowNum();
                for (int j = 1; j <= rows; j++) {
                    XSSFRow row = sheet.getRow(j);
                    if (row != null) {
                        Account a = new Account();
                        a.setBvName(row.getCell(0).toString().trim());
                        a.setBvPassword(row.getCell(1).toString().trim());
                        accounts.add(a);
                    }
                }
            }
            accounts.forEach(item -> {
                accountService.addOneAccount(item);
            });

            return 1;
        } catch (IOException e) {
            e.printStackTrace();
            try {
                inputStream.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            return 2;
        }
    }


    //4个2级菜单跳转页面  正在测试  正在大同
    @RequestMapping("/project-purchasing")
    public String projectPurchasing() {
        return "/admin/purchase/project-purchasing";
    }

    @RequestMapping("/task-creation")
    public String taskCreationWindow() {
        return "/admin/purchase/task-creation";
    }

//    采购中的二级菜单 物料编码管理
    @RequestMapping("/material-code")
    public String tasCreationindow() {
        return "/admin/purchase/material-code";
    }

}