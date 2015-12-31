package shopCart;

import javax.servlet.http.HttpSession;
import good.Good;
import good.GoodsDao;

public class ShoppingCart {
	
	//private ArrayList<Good> good;

	
	
	public ShoppingCart(){
		
	}
	
	/**
	 * 功能：往购物车中添加商品
	 * 参数：物品ID, 数量, session
	 * 步骤：先获得物品ID，然后和session中已存的进行比较
	 * 		如果不为空，则更新已有的。如果为空，则直接加入
	 */
	public void addGood(String goodID, int amount, HttpSession session){
		if(session.getAttribute(goodID) != null){
			amount += (Integer)session.getAttribute(goodID);
			session.setAttribute(goodID, amount);
		}else{
			session.setAttribute(goodID, amount);
		}
		
	}
	
	/**
	 * 功能：更新购物车商品数量
	 * 参数：物品ID, 数量, session
	 * 步骤：先获得物品ID，和session则中已存的进行比较，如果存在，则直接修改，返回0；否则返回－1。
	 * 返回：0	修改成功
	 *     -1	购物车中不含该商品
	 */
	
	public int updateGood(String goodID, int amount, HttpSession session){
		if(session.getAttribute(goodID) != null){
			session.setAttribute(goodID, amount);
			return 0;
		}
		return -1;
		
	}
	
	/**
	 * 功能：从购物车中删除
	 * 参数：物品ID, 数量, session
	 * 步骤：先获得物品ID，然后和session中已存的进行比较
	 * 		如果不为空，则更新已有的。如果为空，则直接加入
	 * 返回：0	修改成功
	 * 	   -1	session中存的数目小于要删除的数量
	 *     -2   session中不存在该物品
	 */
	public int removeGood(String goodID, int amount,HttpSession session){
		if(session.getAttribute(goodID) != null){
			int num = (Integer)session.getAttribute(goodID);
			if(amount >= num){
				amount -= num;
				session.setAttribute(goodID, amount);
				return 0;
			}
			return -1;
			
		}
		return -2;
		
	}
	
	/**
	 * 功能：从session中完全删除某个商品
	 * 参数：商品ID, session
	 * 步骤：先判断是否有该商品, 如果有，直接删除，返回0，没有则无操作，返回－1
	 * 返回：0	删除成功
	 * 	   -1	没有该物品
	 */
	
	public int removeGood(String goodID, HttpSession session){
		if(session.getAttribute(goodID) != null){
			session.removeAttribute(goodID);
			return 0;
		}
		return -1;	
	}
	
	/**
	 * 功能 先根据名称找到该物品对应的id，然后根据id在session中进行搜索
	 * 步骤 直接在session中进行搜索
	 * @param 商品名称
	 * @return 商品id 
	 * 			－1	没有该商品
	 * 			其他 商品id
	 */
	
	public int searchGood(String name, HttpSession session){
		int goodId = -1;
		GoodsDao gd = new GoodsDao();
		Good good = gd.getGood(name);
		if(good != null){
			goodId = good.getId();
			if(session.getAttribute(String.valueOf(goodId)) != null){
				return goodId;
			}
		}
		return goodId;
	}

}
