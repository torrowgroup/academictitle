package com.torrow.title.action.user;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Participator;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.Email;
import com.torrow.title.util.PageCut;

public class ParticipatorAction extends BaseAction implements ModelDriven<Participator> {

	private int page = 1;// 初始页数
	private Participator participator;
	private String ask;// 查询的条件
	private String inquiry;// 查询的内容
	private List<File> file; // 上传文件集合
	private List<String> fileFileName; // 上传文件名集合
	private List<String> fileContentType; // 上传文件内容类型集合
	private int majorid;//专业ID，查询对应的专业对象
	private int titleid;//职称ID，查询对引得职称
	private int unitid;//单位ID，查询对应的单位对象
	
	
	private File myFileName;//富文本编辑器上传图片对应的统一文件名称

	// 查看所有的参评人信息
	public String select() {
		if (ask == null && inquiry == null) {
			ask = (String) session.get("ask");
			inquiry = (String) session.get("inquiry");
		} else if (ask.equals("all")) {
			ask = null;
		}
		PageCut<Participator> pCut = participatorService.getParticipator(page, 4, ask, inquiry);
		if (pCut.getData().size() == 0) {
			request.put("message", "无参评人");
		}
		request.put("messagenews", pCut);
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		return "select";
	}

	// 转发到添加界面
	public String relay() {
		List<Majors> majors = majorsService.selectMajors();
		List<Unit> unit = unitService.selectUnit();
		List<Title> title = titleService.selectTitle();
		if (majors.size()==0) {
			request.put("news", "并且无专业");
			return select();
		} else if (unit.size()==0) {
			request.put("news", "并且无单位");
			return select();
		} else if(title.size()==0){
			request.put("news", "并且无职称");
			return select();
		} else {
			request.put("majors", majors);
			request.put("unit", unit);
			request.put("title", title);
		}
		return "add";
	}

	// 添加参评人信息
	public String add() throws FileNotFoundException, IOException {
		if (file == null || file.equals("")) {
			request.put("message", "添加失败！请上传图片");
		} else {
			for (int i = 0; i < file.size(); i++) {
				// 循环上传每个文件
				uploadFile(i);
			}
			Majors major = majorsService.checkById(majorid);
			Unit units = unitService.checkById(unitid);
			Title titles = titleService.checkById(titleid);
			participator.setPa_majors(major);
			participator.setPa_unit(units);
			participator.setPa_title(titles);
			if(participator.getPa_introduce().equals("<p><br></p>")){
				participator.setPa_introduce("此参评人无简介");
			}
			boolean sign = participatorService.addParticipator(participator);
			if (sign) {
				request.put("message", "添加成功");
			} else {
				request.put("message", "添加失败");
			}
		}
		List<Majors> majors = majorsService.selectMajors();
		List<Unit> unit = unitService.selectUnit();
		List<Title> title = titleService.selectTitle();
		request.put("majors", majors);
		request.put("unit", unit);
		request.put("title", title);
		return "add";
	}

	//用于转发到修改界面，并获得修改的信息
	public String toUpdate(){
		List<Majors> majors = majorsService.selectMajors();
		List<Unit> unit = unitService.selectUnit();
		List<Title> title = titleService.selectTitle();
		Participator part = participatorService.getParticipatorById(participator.getPa_id());
		request.put("majors", majors);
		request.put("unit", unit);
		request.put("title", title);
		request.put("part", part);
		session.put("part", part);
		return "update";
	}
	//修改信息
	public String update() throws FileNotFoundException, IOException{
		boolean sign = false;
		if(participator.getPa_introduce().equals("<p><br></p>")){
			participator.setPa_introduce("此参评人无简介");
		}
		if (file == null || file.equals("")) {
			Participator parpator = (Participator) session.get("part");
			participator.setPa_imageUrl(parpator.getPa_imageUrl());
			Majors major = majorsService.checkById(majorid);
			Unit units = unitService.checkById(unitid);
			Title titles = titleService.checkById(titleid);
			participator.setPa_majors(major);
			participator.setPa_unit(units);
			participator.setPa_title(titles);
			sign = participatorService.updateParticipator(participator);
		} else {
			for (int i = 0; i < file.size(); i++) {
				// 循环上传每个文件
				uploadFile(i);
			}
			Majors major = majorsService.checkById(majorid);
			Unit units = unitService.checkById(unitid);
			Title titles = titleService.checkById(titleid);
			participator.setPa_majors(major);
			participator.setPa_unit(units);
			participator.setPa_title(titles);
			sign = participatorService.updateParticipator(participator);
		}
		if (sign) {
			request.put("message", "修改成功");
		} else {
			request.put("message", "修改失败");
		}
		return select();
	}
	
	//删除参评人
	public String delete(){
		String path =  ServletActionContext.getRequest().getRealPath("uploadImage")+"/"+participator.getPa_imageUrl();
		File files=new File(path);
	         if (files.exists()) {
	        	 files.delete();
	         }
		boolean sign = participatorService.deletParticipator(participator.getPa_id());
		if (sign) {
			request.put("message", "删除成功");
		} else {
			request.put("message", "删除失败");
		}
		return select();
	}
	//发送邮件
	public String sendEmail(){
		Participator part = participatorService.getParticipatorById(participator.getPa_id());
		Email email = new Email();
		try {
			email.subject("评审通知")
			.from("职称评审系统")
			.to(part.getPa_email())
			.html(part.getPa_name()+"您好，您参与的评选"+
					"<h1 font=red>"+part.getPa_title().getTi_titleName()+"</h1>"+
					"经各专家评审，您成功当选，请继续努力工作！")
			.send();
		} catch (MessagingException e) {
			request.put("message","发送失败，邮箱不存在");
		}
		request.put("message","发送成功");
		return select();
	}
	
	// 用于富文本编辑器的图片上传
	public void uploadImg() throws Exception {
		HttpServletRequest req2 = ServletActionContext.getRequest();
		HttpServletResponse res2 = ServletActionContext.getResponse();
		String name = myFileName.getName();
		// 提取文件拓展名
		String fileNameExtension = name.substring(name.indexOf("."), name.length() - 1);
		// 生成实际存储的真实文件名
		String realName = UUID.randomUUID().toString() + fileNameExtension;
		// 图片存放的真实路径
		String realPath = req2.getServletContext().getRealPath("/uploadImage") + "/" + realName;
		// 将文件写入指定路径下
		InputStream in = new FileInputStream(myFileName);
		File uploadFile = new File(realPath);
		OutputStream out = new FileOutputStream(uploadFile);
		byte[] buffer = new byte[1024 * 1024];
		int length;
		while ((length = in.read(buffer)) > 0) {
			out.write(buffer, 0, length);
		}
		in.close();
		out.close();
		// 返回图片的URL地址
		res2.getWriter().write(req2.getContextPath() + "/uploadImage/" + realName);
	}
	
	// 执行上传功能
	private void uploadFile(int i) throws FileNotFoundException, IOException {
		try {
			InputStream in = new FileInputStream(file.get(i));
			@SuppressWarnings("deprecation")
			String dir = ServletActionContext.getRequest().getRealPath("uploadImage");
			File fileLocation = new File(dir);
			// 此处也可以在应用根目录手动建立目标上传目录
			if (!fileLocation.exists()) {
				boolean isCreated = fileLocation.mkdir();
				if (!isCreated) {
					// 目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。
					return;
				}
			}
			String fileName = this.getFileFileName().get(i);
			participator.setPa_imageUrl(fileName);
			File uploadFile = new File(dir, fileName);
			OutputStream out = new FileOutputStream(uploadFile);
			byte[] buffer = new byte[1024 * 1024];
			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
			in.close();
			out.close();
		} catch (Exception ex) {
			System.out.println("上传失败!");
			ex.printStackTrace();
		}
	}
	//预览
	public String openNewview(){
		Participator part = participatorService.getParticipatorById(participator.getPa_id());
		part.setPa_introduce(part.getPa_introduce().replace("'", "\""));
		request.put("part", part);
		return "newview";
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

	public String getInquiry() {
		return inquiry;
	}

	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}

	public int getMajorid() {
		return majorid;
	}

	public void setMajorid(int majorid) {
		this.majorid = majorid;
	}

	public int getTitleid() {
		return titleid;
	}

	public void setTitleid(int titleid) {
		this.titleid = titleid;
	}

	public int getUnitid() {
		return unitid;
	}

	public void setUnitid(int unitid) {
		this.unitid = unitid;
	}

	public File getMyFileName() {
		return myFileName;
	}

	public void setMyFileName(File myFileName) {
		this.myFileName = myFileName;
	}

	@Override
	public Participator getModel() {
		if (participator == null) {
			participator = new Participator();
		}
		return participator;
	}

}
