<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script>
<script>
function goPay(){
//���� �����Ͽ� ���ÿ��� ��� �ּ��� ���� �� ����ϼ���
alert("zz");
BootPay.request({
	price: '1000', //���� �����Ǵ� ����
	application_id: "61ec4f15e38c3000227b81c9",
	name: '���� ����ī��', //����â���� ������ �̸�
	pg: 'payletter',
	method: '', //��������, �Է����� ������ �������� ���ú��� ȭ���� �����մϴ�.
	show_agree_window: 0, // ��Ʈ���� ���� ���� â ���̱� ����
	items: [
		{
			item_name: '���� ������', //��ǰ��
			qty: 1, //����
			unique: '123', //�ش� ��ǰ�� �������� primary key
			price: 10010, //��ǰ �ܰ�
			cat1: 'TOP', // ��ǥ ��ǰ�� ī�װ� ��, 50���� �̳�
			cat2: 'Ƽ����', // ��ǥ ��ǰ�� ī�װ� ��, 50���� �̳�
			cat3: '���� Ƽ', // ��ǥ��ǰ�� ī�װ� ��, 50���� �̳�
		}
	],
	user_info: {
		username: 'cbjun11',
		email: 'chlchlrnsrns@naver.com',
		addr: '�������� ������',
		phone: '010-1234-4567'
	},
	order_id: 'mymymy1', //���� �ֹ���ȣ��, �����Ͻ� ���� �����ּž� �մϴ�.
	params: {callback1: '�״�� �ݹ���� ���� 1', callback2: '�״�� �ݹ���� ���� 2', customvar1234: '������ �������'},
	account_expire_at: '2020-10-25', // ������� �ԱݱⰣ ���� ( yyyy-mm-dd �������� �Է����ּ���. ������¸� ����˴ϴ�. )
	extra: {
	    start_at: '', // ���� ���� ������ - �������� �������� ������ �� �� ���Ϸκ��� ������ ������ Billing key ����
		end_at: '', // ������� ������ -  �Ⱓ ���� - ������
        vbank_result: 1, // ������� ���� ���, ������� ���â�� ����(1), ����(0), �̼����� ��(1)
        quota: '0', // �����ݾ��� 5���� �̻�� �Һΰ��� �������� ������ �� ����, [0(�Ͻú�), 2����, 3����] ���, �̼����� 12�������� ���,
		theme: 'purple', // [ red, purple(�⺻), custom ]
		custom_background: '#00a086', // [ theme�� custom �� �� background ���� ���� ���� ]
		custom_font_color: '#ffffff' // [ theme�� custom �� �� font color ���� ���� ���� ]
	}
}).error(function (data) {
	//���� ����� ������ �߻��ϸ� ����˴ϴ�.
	console.log(data);
	alert("����");
}).cancel(function (data) {
	//������ ��ҵǸ� ����˴ϴ�.
	console.log(data);
	alert("���");
}).ready(function (data) {
	// ������� �Ա� ���¹�ȣ�� �߱޵Ǹ� ȣ��Ǵ� �Լ��Դϴ�.
	alert("�Աݰ���");
	console.log(data);
}).confirm(function (data) {
	//������ ����Ǳ� ���� ����Ǹ�, �ַ� ��� Ȯ���ϴ� ������ ���ϴ�.
	//���� - ī�� ��������� ��� �� �κ��� ������� �ʽ��ϴ�.
	console.log(data);
	var enable = true; // ��� ���� ���� ���� Ȥ�� �ٸ� ó��
	if (enable) {
		BootPay.transactionConfirm(data); // ������ ������ ���� ó���� �Ѵ�.
	} else {
		BootPay.removePaymentWindow(); // ������ ���� ������ ���� â�� �ݰ� ������ �������� �ʴ´�.
	}
}).close(function (data) {
    // ����â�� ������ ����˴ϴ�. (����,����,��ҿ� ������� ��� �����)
    console.log(data);
}).done(function (data) {
	//������ ���������� �Ϸ�Ǹ� ����˴ϴ�
	//����Ͻ� ������ �����ϱ� ���� ���� ��ȿ�� ������ �Ͻñ� ��õ�մϴ�.
	console.log(data);
});
}





function goPay2(){
	//���� �����Ͽ� ���ÿ��� ��� �ּ��� ���� �� ����ϼ���
	alert("zz");
	BootPay.request({
		price: 10010, //���� �����Ǵ� ����
		application_id: "61ec4f15e38c3000227b81c9",
		name: '���� ����ī��', //����â���� ������ �̸�
		pg: 'inicis',
		method: '', //��������, �Է����� ������ �������� ���ú��� ȭ���� �����մϴ�.
		show_agree_window: 0, // ��Ʈ���� ���� ���� â ���̱� ����
		items: [
			{
				item_name: '���� ������', //��ǰ��
				qty: 1, //����
				unique: '123', //�ش� ��ǰ�� �������� primary key
				price: 1000, //��ǰ �ܰ�
				cat1: 'TOP', // ��ǥ ��ǰ�� ī�װ� ��, 50���� �̳�
				cat2: 'Ƽ����', // ��ǥ ��ǰ�� ī�װ� ��, 50���� �̳�
				cat3: '���� Ƽ', // ��ǥ��ǰ�� ī�װ� ��, 50���� �̳�
			}
		],
		user_info: {
			username: 'cbjun11',
			email: 'chlchlrnsrns@naver.com',
			addr: '�������� ������',
			phone: '010-1234-4567'
		},
		order_id: 'mymymy', //���� �ֹ���ȣ��, �����Ͻ� ���� �����ּž� �մϴ�.
		params: {callback1: '�״�� �ݹ���� ���� 1', callback2: '�״�� �ݹ���� ���� 2', customvar1234: '������ �������'},
		account_expire_at: '2020-10-25', // ������� �ԱݱⰣ ���� ( yyyy-mm-dd �������� �Է����ּ���. ������¸� ����˴ϴ�. )
		extra: {
		    start_at: '', // ���� ���� ������ - �������� �������� ������ �� �� ���Ϸκ��� ������ ������ Billing key ����
			end_at: '', // ������� ������ -  �Ⱓ ���� - ������
	        vbank_result: 1, // ������� ���� ���, ������� ���â�� ����(1), ����(0), �̼����� ��(1)
	        quota: '0', // �����ݾ��� 5���� �̻�� �Һΰ��� �������� ������ �� ����, [0(�Ͻú�), 2����, 3����] ���, �̼����� 12�������� ���,
			theme: 'purple', // [ red, purple(�⺻), custom ]
			custom_background: '#00a086', // [ theme�� custom �� �� background ���� ���� ���� ]
			custom_font_color: '#ffffff' // [ theme�� custom �� �� font color ���� ���� ���� ]
		}
	}).error(function (data) {
		//���� ����� ������ �߻��ϸ� ����˴ϴ�.
		console.log(data);
		alert("����");
	}).cancel(function (data) {
		//������ ��ҵǸ� ����˴ϴ�.
		console.log(data);
		alert("���");
	}).ready(function (data) {
		// ������� �Ա� ���¹�ȣ�� �߱޵Ǹ� ȣ��Ǵ� �Լ��Դϴ�.
		alert("�Աݰ���");
		console.log(data);
	}).confirm(function (data) {
		//������ ����Ǳ� ���� ����Ǹ�, �ַ� ��� Ȯ���ϴ� ������ ���ϴ�.
		//���� - ī�� ��������� ��� �� �κ��� ������� �ʽ��ϴ�.
		console.log(data);
		var enable = true; // ��� ���� ���� ���� Ȥ�� �ٸ� ó��
		if (enable) {
			BootPay.transactionConfirm(data); // ������ ������ ���� ó���� �Ѵ�.
		} else {
			BootPay.removePaymentWindow(); // ������ ���� ������ ���� â�� �ݰ� ������ �������� �ʴ´�.
		}
	}).close(function (data) {
	    // ����â�� ������ ����˴ϴ�. (����,����,��ҿ� ������� ��� �����)
	    console.log(data);
	}).done(function (data) {
		//������ ���������� �Ϸ�Ǹ� ����˴ϴ�
		//����Ͻ� ������ �����ϱ� ���� ���� ��ȿ�� ������ �Ͻñ� ��õ�մϴ�.
		console.log(data);
	});
	}
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a href="javascript:goPay()">�����ϱ�</a>
<a href="javascript:goPay2()">�����ϱ�</a>
</body>
</html>