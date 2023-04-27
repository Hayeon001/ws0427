<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .item_m_img{
        width: 80px;
        border: #0c4128 solid 1px;
    }
    tr{
        text-align: center;
        font-size: 20px;
    }
</style>

    <div class="col-sm-8 text-left">
        <div class ="container">
            <h3>Item All Page</h3>
                <div class="row content">
                    <div class="col-sm-6 text-left">
                        <%--table삽입--%>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>IMG</th>
                                <th>ID</th>
                                <th>NAME</th>
                                <th>PRICE</th>
                                <th>RDATE</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${allItem}">
                                <tr>
                                    <%-- img 위치 --%>
                                    <td><img src="/uimg/${obj.imgname}" class="item_m_img" id="item_img"/></td>
                                    <td>${obj.id}</td>
                                    <td>${obj.name}</td>
                                    <td><fmt:formatNumber value="${obj.price}" type="currency" /></td>
                                    <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <%--            table삽입 전 형태--%>
                        <%--            <c:forEach var="c" items="${clist}">--%>
                        <%--            &lt;%&ndash;clist리스트의 값을 c로 가져와&ndash;%&gt;--%>
                        <%--                <h4>${c.id} ${c.name}</h4>--%>

                        <%--            </c:forEach>--%>
                    </div>
                </div> <%--row content end--%>
        </div>

    </div>
