package com.util;

import com.montnets.mwgate.common.GlobalParams;
import com.montnets.mwgate.common.Message;
import com.montnets.mwgate.smsutil.ConfigManager;
import com.montnets.mwgate.smsutil.SmsSendConn;

public class ValidCodeUtil {
	public static String sendSMS(String validCode,String mobilePhone)
	{
		
		// �û��˺�
		String userid = "E101MH";

		// ����ȫ�ֲ���
		GlobalParams globalParams = new GlobalParams();
		// ��������·��
		globalParams.setRequestPath("/sms/v2/std/");
		// �����Ƿ���Ҫ��־ 1:��Ҫ��־;0:����Ҫ��־
		globalParams.setNeedLog(1);
		// ����ȫ�ֲ���
		ConfigManager.setGlobalParams(globalParams);

		// �����û��˺���Ϣ
		setAccountInfo();

		// �Ƿ񱣳ֳ�����
		boolean isKeepAlive = false;
		// ʵ�������Ŵ������
		SmsSendConn smsSendConn = new SmsSendConn(isKeepAlive);

		// ��������
		int result = singleSend(smsSendConn, userid,validCode,mobilePhone);

		// �Ƴ��û��˺�(�˴�Ϊ�Ƴ��û��˺Ź���ʾ����ʹ��ʱ�����ʵ�����������Ҫ�ŵ��ô˷���)
		removeAccount(userid);
		
		if(result == 0)
			return "���ͳɹ�";
		else return "����" + result;
	}
	public static String sendSMS(String orderser, int streamid,String mobilePhone)
	{
		
		// �û��˺�
		String userid = "E101MH";

		// ����ȫ�ֲ���
		GlobalParams globalParams = new GlobalParams();
		// ��������·��
		globalParams.setRequestPath("/sms/v2/std/");
		// �����Ƿ���Ҫ��־ 1:��Ҫ��־;0:����Ҫ��־
		globalParams.setNeedLog(1);
		// ����ȫ�ֲ���
		ConfigManager.setGlobalParams(globalParams);

		// �����û��˺���Ϣ
		setAccountInfo();

		// �Ƿ񱣳ֳ�����
		boolean isKeepAlive = false;
		// ʵ�������Ŵ������
		SmsSendConn smsSendConn = new SmsSendConn(isKeepAlive);

		// ��������
		int result = singleStream(smsSendConn, userid,orderser,streamid,mobilePhone);

		// �Ƴ��û��˺�(�˴�Ϊ�Ƴ��û��˺Ź���ʾ����ʹ��ʱ�����ʵ�����������Ҫ�ŵ��ô˷���)
		removeAccount(userid);
		
		if(result == 0)
			return "���ͳɹ�";
		else return "����" + result;
	}
	/**
	 * @description �����û��˺���Ϣ
	 */
	public static void setAccountInfo() {
		// �����û��˺���Ϣ

		// �û��˺�
		String userid = "E101MH";
		// ����
		String password = "pYxFoY";
		// �������ȼ�
		int priority = 1;
		// ��IP��Ϣ
		String ipAddress1 = "api02.monyun.cn:7901";

		// ����IP1��Ϣ
		String ipAddress2 = "api01.monyun.cn:7901";
		// ����IP2��Ϣ
		String ipAddress3 = null;
		// ����IP3��Ϣ
		String ipAddress4 = null;
		// ����ֵ
		int result = -310007;
		try {
			// �����û��˺���Ϣ
			result = ConfigManager.setAccountInfo(userid, password, priority,
					ipAddress1, ipAddress2, ipAddress3, ipAddress4);
			// �жϷ��ؽ����0���óɹ�������ʧ��
			if (result == 0) {
				System.out.println("�����û��˺���Ϣ�ɹ���");
			} else {
				System.out.println("�����û��˺���Ϣʧ�ܣ������룺" + result);
			}
		} catch (Exception e) {
			// �쳣����
			e.printStackTrace();
		}
	}

	/**
	 * �Ƴ��û��˺�
	 * 
	 * @param userid
	 *            �û��˺�
	 */
	public static void removeAccount(String userid) {
		try {
			// �����Ƴ��û��˺ŵķ���
			int result = ConfigManager.removeAccount(userid);

			// ����0�������Ƴ��ɹ�
			if (result == 0) {
				System.out.println("�Ƴ��û��˺�[" + userid + "]�ɹ���");
			}
			// ���ط�0�������Ƴ�ʧ��
			else {
				System.out.println("�Ƴ��û��˺�[" + userid + "]ʧ�ܣ������룺" + result);
			}
		} catch (Exception e) {
			// �쳣����
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @description ��������
	 * @param smsSendConn
	 *            ���Ŵ������,����������е��÷��Ͷ��Ź���
	 * @param userid
	 *            �û��˺�
	 */
	public static int singleSend(SmsSendConn smsSendConn, String userid,String validCode,String mobilePhone) {
		
		try {
			// ������
			Message message = new Message();
			// �����û��˺� ָ���û��˺ŷ��ͣ���Ҫ��д�û��˺ţ���ָ���û��˺ŷ��ͣ�������д�û��˺�
			message.setUserid(userid);
			// �����ֻ����� �˴�ֻ������һ���ֻ�����
			message.setMobile(mobilePhone);
			// ��������
			message.setContent("������֤����" + validCode + "����10������������Ч����Ǳ��˲�������Դ˶��š�");

			// ҵ������
			message.setSvrtype("SMS001");

			// ���ص���ˮ��
			StringBuffer returnValue = new StringBuffer();
			// ����ֵ
			int result = -310099;
			// ���Ͷ���
			result = smsSendConn.singleSend(message, returnValue);
			// resultΪ0:�ɹ�
			if (result == 0) {
				System.out.println("���������ύ�ɹ���");
				System.out.println(returnValue.toString());
			}
			// resultΪ��0��ʧ��
			else {
				System.out.println("���������ύʧ��,�����룺" + result);
			}
			return result;
		} catch (Exception e) {
			// �쳣����
			e.printStackTrace();
		}
		return -310099;
	}
	public static int singleStream(SmsSendConn smsSendConn, String userid,String orderser,int streamid,String mobilePhone) {
		
		try {
			// ������
			Message message = new Message();
			// �����û��˺� ָ���û��˺ŷ��ͣ���Ҫ��д�û��˺ţ���ָ���û��˺ŷ��ͣ�������д�û��˺�
			message.setUserid(userid);
			// �����ֻ����� �˴�ֻ������һ���ֻ�����
			message.setMobile(mobilePhone);
			// ��������
			message.setContent("�������" + orderser + "���������Ʒ�Է�������������Ϊ���ɼ��������" + streamid + "�뱣�ֵ绰��ͨ����л��ѡ��ת׬�����ǽ�������߳�Ϊ������");
			// ҵ������
			message.setSvrtype("SMS001");

			// ���ص���ˮ��
			StringBuffer returnValue = new StringBuffer();
			// ����ֵ
			int result = -310099;
			// ���Ͷ���
			result = smsSendConn.singleSend(message, returnValue);
			// resultΪ0:�ɹ�
			if (result == 0) {
				System.out.println("���������ύ�ɹ���");
				System.out.println(returnValue.toString());
			}
			// resultΪ��0��ʧ��
			else {
				System.out.println("���������ύʧ��,�����룺" + result);
			}
			return result;
		} catch (Exception e) {
			// �쳣����
			e.printStackTrace();
		}
		return -310099;
	}
}
