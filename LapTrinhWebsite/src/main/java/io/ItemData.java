package io;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import commom.Security;
import model.Cart;
import model.Info;
import model.Item;
import model.User;

public class ItemData {

	public static ArrayList<Item> allSale() {
		ArrayList<Item> items = new ArrayList<Item>();
		try {
			String sql = "SELECT * FROM item WHERE status=1 and sale > 0 ORDER BY rand() LIMIT 3";
			var ps = DBConnect.getConn().createStatement();
			ResultSet res = ps.executeQuery(sql);
			while (res.next()) {
				Item item = new Item();
				item.fill(res);
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return items;
	}

	public static ArrayList<Item> all(int type, int status) {
		ArrayList<Item> items = new ArrayList<Item>();
		try {
			String sql = "SELECT * FROM item WHERE type=" + type + " and status=" + status;
			var ps = DBConnect.getConn().createStatement();
			ResultSet res = ps.executeQuery(sql);
			while (res.next()) {
				Item item = new Item();
				item.fill(res);
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return items;
	}

	public static Item withId(int id) {
		try {
			String sql = "SELECT * FROM item WHERE id=" + id;
			var ps = DBConnect.getConn().createStatement();
			ResultSet res = ps.executeQuery(sql);
			while (res.next()) {
				Item item = new Item();
				item.fill(res);
				return item;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void updateImage(Item item, String image, String thump) {
		try {
			String sql = "UPDATE item SET image='" + image + "', thump='" + thump + "' WHERE id=" + item.getId();
			var ps = DBConnect.getConn().createStatement();
			ps.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static boolean insert(Item item) {
		try {
			String sql = "INSERT INTO item(id, type, name, description, price, colorId, status) VALUES(NULL, ?, ?, ?, ?, ?, ?)";
			var ps = DBConnect.getConn().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, item.getType());
			ps.setString(2, item.getName());
			ps.setString(3, item.getDescription());
			ps.setInt(4, item.getPrice());
			ps.setInt(5, item.getColorId());
			ps.setInt(6, item.getStatus());
			int row = ps.executeUpdate();
			ResultSet res = ps.getGeneratedKeys();
			if (res.next()) {
				item.setId(res.getInt(1));
			}
			return row == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
