package com.swing.saver.web.util;

import com.swing.saver.web.controller.UploadController;
import com.swing.saver.web.entity.Constant;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.UUID;

/**
 * Created by mycom on 2019-06-10.
 */
public class UploadFileUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(UploadFileUtils.class);

    public  static String uploadFile(String uploadPath, String originalName,byte[] fileData) throws Exception{
    	
    	System.out.println(originalName);
        UUID uid = UUID.randomUUID();
        String savedName = uid.toString()+"_"+originalName;
        String savedPath = calcPath(uploadPath);

        //저장할 파일준비
        File target = new File(uploadPath + savedPath, savedName);

        //파일을 저장
        FileCopyUtils.copy(fileData, target);

        String formatName  = originalName.substring(originalName.lastIndexOf(".")+1);

        String uploadedFileName = null;

        if(Constant.getMediaType(formatName) != null) {
            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
        }
        return uploadedFileName;
    }

    @SuppressWarnings("unused")
    private static String calcPath(String uploadPath) {

        Calendar cal = Calendar.getInstance();

        String yearPath = File.separator + cal.get(Calendar.YEAR);

        String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);

        String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

        makeDir(uploadPath, yearPath, monthPath, datePath);

        LOGGER.info(datePath);

        return datePath;
    }

    private static void makeDir(String uploadPath, String... paths) {

        if(new File(uploadPath + paths[paths.length -1]).exists()) {
            return;
        }

        for(String path : paths) {

            File dirPath = new File(uploadPath + path);

            if(!dirPath.exists()) {
                dirPath.mkdir();
            }

        }

    }
    //썸네일 이미지 생성
    private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {

        BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));

        BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

        String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;

        File newFile = new File(thumbnailName);
        String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

        ImageIO.write(destImg, formatName.toUpperCase(), newFile);

        return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }
    
	/**
	 * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
	 *
	 * @param
	 * @return Timestamp 값
	 * @exception MyException
	 * @see
	 */
	public static String getTimeStamp() {

		String rtnStr = null;

		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";

		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		rtnStr = sdfCurrent.format(ts.getTime());

		return rtnStr;
	}
}
