package Phone;

public class PhoneBizImpl implements PhoneBiz{

	@Override
	public void buyPhone(int num) {
		System.out.println("手机进货，进货数量为"+num+"部");
	}

	@Override
	public void salePhone(int num) {
		System.out.println("手机销售，销售数量为"+num+"部");
	}

}
