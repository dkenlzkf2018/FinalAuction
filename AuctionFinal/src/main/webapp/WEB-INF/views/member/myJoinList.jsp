<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script type="text/javascript">
	
</script>


	<div class="main" align="center" style="margin-top: 50px;">
      <div class="container">
          <div>
            <h3><span style="color: blue; font-weight: bold;">${sessionScope.loginuser.username}</span>님의 입찰정보</h3>
            <table id="JoinList" name="JoinList">
            	<thead>
					<tr align="center">
						<th style="width: 90px; text-align: center;">입찰물품 번호</th>
						<th style="width: 90px; text-align: center;">경매번호</th>
						<th style="width: 210px; text-align: center;">입찰금액</th>
						<th style="width: 270px; text-align: center;">입찰 날짜</th>
						<th style="width: 270px; text-align: center;">경매 마감 날짜</th>						
					</tr>
				</thead>
				<tbody>
					<c:if test="${JoinList == null}">					
						<tr>
							<th colspan="5"><div align="center"><span style="color: red; text-align: center;">목록이 없습니다.</span></div></th>
						</tr>
					</c:if>
					<c:if test="${JoinList != null}">
						<c:forEach var="list" items="${JoinList}">
							<tr>
								<td align="center">
									${list.joinactnum}
								</td>
								
								<td align="center">		
									${list.fk_actnum}						
								</td>
								
								<td align="center">
									${list.tenderprice}
								</td>
								
								<td align="center">
									${list.tenderday}
								</td>
								
								<td align="center">
									${list.actd_endday}
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
            </table>
          </div>
          <input type="hidden" id="usernum" name="usernum" value="${sessionScope.loginuser.usernum}" />
          <div class="row" align="center">
                <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                  <button class="btn btn-default" type="button" onClick="location.href='<%=request.getContextPath()%>/myPage.action';">돌아가기</button>
                </div>
          </div>
      </div>
    </div>
