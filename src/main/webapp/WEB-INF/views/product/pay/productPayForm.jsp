<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../resources/css/common/reset.css">
<c:import url="../../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../../resources/css/common/basic.css">
<style type="text/css">
	.main_section{
		min-height: 1000px;
	}
</style>
</head>
<body>
	<c:import url="../../tmp/header.jsp"/>
	
	<section class="main_section">
		<form action="../order/orderInsert" name="frm" id="frm" method="post">
			<input type="hidden" name="memberid" id="memberid">
			<input type="hidden" name="o_name" id="o_name">
			<input type="hidden" name="o_phone" id="o_phone">
			<input type="hidden" name="o_address" id="o_address">
			<input type="hidden" name="uPoint" id="uPoint">
			<input type="hidden" name="orderlist" id="orderlist">
			<input type="hidden" name="totprice" id="totprice">
			<input type="hidden" name="ordername" id="ordername">
			<input type="hidden" name="status" id="status">
		</form>
	</section>
	
	<c:import url="../../tmp/footer.jsp"/>
	<script type="text/javascript">	
		
	    	frm.memberid.value = '${orderDTO.memberid}';
	    	frm.o_name.value = '${orderDTO.o_name}';
	    	frm.o_phone.value ='${orderDTO.o_phone}';
	    	frm.o_address.value = '${orderDTO.o_address}';
	    	frm.uPoint.value = '${uPoint}';
	    	frm.orderlist.value = '${orderDTO.orderlist}';
	    	frm.totprice.value = '${orderDTO.totprice}';
	    	frm.ordername.value = '${ordername}';
	    	frm.status.value = '${orderDTO.status}';
	    	frm.submit();
</script>
</body>
</html>