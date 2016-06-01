<%@ page language="java" contentType="text/html; charset=euc-kr"

    pageEncoding="euc-kr"%>

        

<%@ page import="javapns.back.PushNotificationManager" %>

<%@ page import="javapns.back.SSLConnectionHelper" %>

<%@ page import="javapns.data.Device" %>

<%@ page import="javapns.data.PayLoad" %>

<%@ page import="java.lang.Object" %>

<%@ page import="org.apache.commons.lang.StringUtils" %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Push Notification</title>

</head>

<body>

<%

System.out.println("Start~!!!");

// ��ū ��ȣ
String deviceToken = "14c1a6e0ccc5af37c692fe5b004020179b2e3ba781a98ef6146194c9f9169546";


PayLoad payLoad = new PayLoad();
payLoad.addAlert("�ȳ�~!");    // �������� ���� ���� �޼��� ����
payLoad.addBadge(1);
payLoad.addSound("default");

PushNotificationManager pushManager = PushNotificationManager.getInstance();

pushManager.addDevice("iPhone", deviceToken);


//Connect to APNs
// String host = "gateway.sandbox.push.apple.com";  // ���߿�
String host = "gateway.push.apple.com";  // ���߿�
// ������ sandbox�� �� gateway.push.apple.com

int port = 2195;
String certificatePath = "/Users/neox/springsource/workspace/cert/push.p12";  // Push Notification ������ ��ġ
String certificatePassword = "aa1111";

pushManager.initializeConnection(host, port, certificatePath, certificatePassword, SSLConnectionHelper.KEYSTORE_TYPE_PKCS12);

//Send Push
Device client = pushManager.getDevice("iPhone");
pushManager.sendNotification(client, payLoad);
pushManager.stopConnection();
pushManager.removeDevice("iPhone");
%>

please wait��!

</body>

</html>