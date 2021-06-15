package com.beaver.test;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;

public class T1 {


        public static void main(String[] args) {
            //定义图形验证码的长、宽、验证码字符数、干扰线宽度
            LineCaptcha captcha = CaptchaUtil.createLineCaptcha(250, 120, 4, 4);
            //ShearCaptcha captcha = new ShearCaptcha(200, 100, 4, 4);
            //获取随机生成的内容
            String code = captcha.getCode();//这段代码是我自己加的，工具类中没有
            //输出获取到的内容
            System.out.println(code);//这段代码是我自己加的，工具类中没有
            //图形验证码写出，可以写出到文件，也可以写出到流，即在你的电脑D盘中会有一个shear.png的图片
            captcha.write("e:/shear.png");
            //验证图形验证码的有效性，返回boolean值
            captcha.verify("1234");
        }


}
