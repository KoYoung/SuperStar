package Phone;

public class PhoneBizImpl implements PhoneBiz{

	@Override
	public void buyPhone(int num) {
		System.out.println("�ֻ���������������Ϊ"+num+"��");
	}

	@Override
	public void salePhone(int num) {
		System.out.println("�ֻ����ۣ���������Ϊ"+num+"��");
	}

}
