package com.tellhow.yezhihun.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class ConvertPdf2Swf {
	public static int convertPDF2SWF(String sourcePath, String destPath,    String fileName) throws IOException {
		//目标路径不存在则建立目标路径             
		File dest = new File(destPath);             
		if (!dest.exists()) dest.mkdirs();                           
		//源文件不存在则返回             
		File source = new File(sourcePath);             
		if (!source.exists()) return 0;                           
		//调用pdf2swf命令进行转换              
		String command = "D:\\Program Files\\SWFTools\\pdf2swf.exe" + " -o \""    + destPath + "\\" + fileName + "\"   <span style=\"color: rgb(255, 0, 0);\">-s    languagedir=D:\\xpdf\\xpdf-chinese-simplified</span> -s flashversion=9 \"" +    sourcePath + "\"";                            
		Process pro = Runtime.getRuntime().exec(command);                           
		BufferedReader bufferedReader = new BufferedReader(new    InputStreamReader(pro.getInputStream()));              
		while (bufferedReader.readLine() != null);                            
		try {                 
			pro.waitFor();              
		} catch (InterruptedException e) {                  
			// TODO Auto-generated catch block                 
			e.printStackTrace();             
		}                            
		return pro.exitValue();                      
	}
}
