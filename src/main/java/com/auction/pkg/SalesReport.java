/*
package com.auction.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SalesReport {
	
	public SalesReport() {
		
	}
	
}
SELECT SUM(amount)total 
FROM (SELECT MAX(amount) amount FROM bids, auctions GROUP BY bids.auction_id)t1;";
*/