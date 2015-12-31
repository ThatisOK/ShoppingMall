package good;

public class Good {

	private int Id = 0;// 商品的编号Id
	private String name = null;// 商品的名称name
	private double price = 0.00d;// 商品的价格price
	private int number = 0;// 商品的数量number
	private String img = "null.png"; //商品的图片img

	/**
	 * 构造方法
	 * @param Id
	 * @param name
	 * @param price
	 * @param number
	 * @param img
	 */
	public Good(int Id, String name, float price, int number, String img) {
		this.Id = Id;
		this.name = name;
		this.price = price;
		this.number = number;
		this.img = img;

	}
	
	/**
	 * 空构造方法
	 */
	public Good(){

	}

	public int getId() 
	{
		return this.Id;
	}

	public String getName() 
	{
		return this.name;
	}

	public double getPrice() 
	{
		return this.price;
	}

	public int getNumber() 
	{
		return this.number;
	}
	
	public String getImg() {
		return this.img;
	}

	public void setId(int id) {
		Id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public void setImg(String img) {
		this.img = img;
	}

	
	
	

	

}
