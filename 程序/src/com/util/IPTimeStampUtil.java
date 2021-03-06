package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/* Ϊ��ֹ�û��ϴ��ļ��������ļ�����ͬ
 * ������getIPTimeRand()�������ɵ��ַ�����IP��ַ+ʱ���+3λ��������Զ�����
 * */

public class IPTimeStampUtil {

    
    private SimpleDateFormat sdf = null;
    private String ip = null;
    
    
    public IPTimeStampUtil(String ip) {
        super();
    
        this.ip = ip;
    }


    public IPTimeStampUtil() {
        super();
    }
    
    /***����Ψһ�ļ���***/
    public String getIPTimeRand(){
        StringBuffer buf = new StringBuffer();
        if(this.ip != null){
            String s[] = this.ip.split("\\.");//����ip�Ե�ָIP�е�������ȡ
            for(int i = 0 ; i < s.length; i++){
                buf.append(this.addZero(s[i], 3));//������λ���Ĳ���
            }
        }
        buf.append(this.getTimeStamp());
        Random r = new Random();//���ڽ�β�������������
        for(int i = 0 ; i < 3 ; i++ ){
            buf.append(r.nextInt(10));
        }
        return buf.toString();
    }
    
    private String addZero(String str, int len){
        
        StringBuffer s = new StringBuffer();
        s.append(str);
        while(s.length()<len){
            s.insert(0, 0);
        }
        
        return s.toString();
    }
    
    
    private String getTimeStamp(){//��ȡʱ���
        this.sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return this.sdf.format(new Date());
    }
    
    public String getDate(){
        this.sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        return this.sdf.format(new Date());
    }
}