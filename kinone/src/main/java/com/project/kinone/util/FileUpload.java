package com.project.kinone.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

	public static String fileUpload(MultipartFile file, String path) {

		// 파일 중복시 저장할 이름
		UUID uuid = UUID.randomUUID();
		String saveFName = uuid.toString().replace("-", "")+"_"+file.getOriginalFilename();

		// 오리지널 이름에서 확장자 추출
		String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);

		System.out.println("ext :" + ext);
		System.out.println("file 이름 : " + file.getOriginalFilename());

		// 파일저장 경로
		String filePath = path + "\\" + saveFName;// + "." + ext;
		
		// 파일 이름
		String rfname = saveFName;// + "." + ext;
		
		// 파일 저장
		File saveFile = new File(filePath);
		System.out.println("saveFIle : " + saveFile);

		try {
			file.transferTo(saveFile);
			System.out.println("파일 업로드 성공");
			System.out.println("파일 저장 경로 : " + path);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return rfname;
	}

}