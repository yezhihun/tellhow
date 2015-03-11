package com.tellhow.yezhihun.util;

import java.io.File;
import java.io.IOException;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

public class ConvertOffice2Pdf {
	public static void off2Swf(String fileName) throws IOException{
		String command = "D:\\OpenOffice4\\program\\soffice.exe -headless -accept=\"socket,host=127.0.0.1,port=8100;urp;\"";  
        Process pro = Runtime.getRuntime().exec(command);
		File inputFile = new File("D:/test.docx"); 
		File outputFile = new File("D:/test.pdf"); 
		// connect to an OpenOffice.org instance running on port 8100 
		OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100); 
		connection.connect(); 
		// convert 
		DocumentConverter converter = new OpenOfficeDocumentConverter(connection); 
		converter.convert(inputFile, outputFile); 
		// close the connection 
		connection.disconnect(); 
		pro.destroy();
	}
}
