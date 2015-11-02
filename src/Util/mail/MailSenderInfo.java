package Util.mail;

import java.util.Properties;

/**
 * �����ʼ���Ҫʹ�õĻ�����Ϣ
 * 
 * @author dove *
 */
public class MailSenderInfo {
	// �����ʼ��ķ�������IP
	private String mailServerHost;
	// �����ʼ��ķ������Ķ˿�
	private String mailServerPort = "25";
	// �ʼ������ߵĵ�ַ
	private String fromAddress;
	// �ʼ������ߵĵ�ַ
	private String[] toAddress;
	// �ʼ����ͽ����ߵĵ�ַ
	private String[] toBlindCarbonCopyAddress;
	// �ʼ����ͽ����ߵĵ�ַ
	private String[] toCarbonCopyAddress;
	// ��½�ʼ����ͷ��������û���
	private String userName;
	// ��½�ʼ����ͷ�����������
	private String password;
	// �Ƿ���Ҫ�����֤
	private boolean validate = false;
	// �ʼ�����
	private String subject;
	// �ʼ����ı�����
	private String content;
	// �ʼ��������ļ���
	private String[] attachFileNames;

	/**
	 * ����ʼ��Ự����
	 */
	public Properties getProperties() {
		Properties pro = new Properties();
		pro.put("mail.smtp.host", this.mailServerHost);
		pro.put("mail.smtp.port", this.mailServerPort);
		pro.put("mail.smtp.auth", validate ? "true" : "false");
		return pro;
	}

	public String getMailServerHost() {
		return mailServerHost;
	}

	public void setMailServerHost(String mailServerHost) {
		this.mailServerHost = mailServerHost;
	}

	public String getMailServerPort() {
		return mailServerPort;
	}

	public void setMailServerPort(String mailServerPort) {
		this.mailServerPort = mailServerPort;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String[] getToAddress() {
		return toAddress;
	}

	public void setToAddress(String[] toAddress) {
		this.toAddress = toAddress;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isValidate() {
		return validate;
	}

	public void setValidate(boolean validate) {
		this.validate = validate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String[] getAttachFileNames() {
		return attachFileNames;
	}

	public void setAttachFileNames(String[] attachFileNames) {
		this.attachFileNames = attachFileNames;
	}

	public String[] getToBlindCarbonCopyAddress() {
		return toBlindCarbonCopyAddress;
	}

	public void setToBlindCarbonCopyAddress(String[] toBlindCarbonCopyAddress) {
		this.toBlindCarbonCopyAddress = toBlindCarbonCopyAddress;
	}

	public String[] getToCarbonCopyAddress() {
		return toCarbonCopyAddress;
	}

	public void setToCarbonCopyAddress(String[] toCarbonCopyAddress) {
		this.toCarbonCopyAddress = toCarbonCopyAddress;
	}

}
