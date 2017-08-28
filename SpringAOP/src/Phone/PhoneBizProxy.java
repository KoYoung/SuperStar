package Phone;

import util.LogUtil;

public class PhoneBizProxy implements PhoneBiz{
	private PhoneBiz pb = new PhoneBizImpl();
	private LogUtil lu = new LogUtil();
	@Override
	public void buyPhone(int num) {
		pb.buyPhone(num);
		lu.log("¹ºÂò", num);
	}

	@Override
	public void salePhone(int num) {
		pb.salePhone(num);
		lu.log("³öÊÛ", num);
	}

}
