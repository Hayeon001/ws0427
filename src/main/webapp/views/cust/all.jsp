<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="col-sm-8 text-left">
        <div class ="container">
            <div class="row content">
                <div class="col-sm-6 text-left">
                    <h3>Cust All Page</h3>
                    <%--table삽입--%>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>PWD</th>
                            <th>NAME</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="c" items="${clist}">
                            <tr>
                                <td><a href="/cust/get?id=${c.id}">${c.id}</a></td>
                                    <%--cust서버의 get에게 id가 ${c.id}인 것을 가져오기--%>
                                <td>${c.pwd}</td>
                                <td>${c.name}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

<%--                                table삽입 전 형태--%>
<%--                                <c:forEach var="c" items="${clist}">--%>
<%--                                &lt;%&ndash;clist리스트의 값을 c로 가져와&ndash;%&gt;--%>
<%--                                    <h4>${c.id} ${c.name}</h4>--%>

<%--                                </c:forEach>--%>
                </div>
            </div> <%--row content end--%>
        </div>

    </div>
