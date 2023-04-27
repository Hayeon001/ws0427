<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    ////////////////////
    //index0421.js로 이동
    // let update_form = {
    //     init:function(){
    //         $('#register_btn').click(function(){
    //             update_form.send();
    //         });
    //     },
    //     send:function(){
    //         //submit login_form to server
    //         $('#update_form').attr({
    //             'action':'/registerimpl',
    //             'method':'post'
    //         });
    //         $('#update_form').submit();
    //
    //     }
    // };
    ////////////////////

    $(function(){
        // update_form.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row contents">
            <div class="col-sm-8 text-left">
                <h1>Register Page</h1>
                <form id="update_form" class="form-horizontal well">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">ID:</label>
                        <div class="col-sm-10">
                            <input type="text" name="id" class="form-control" id="id" value="${gcust.id}"
                                   readonly>
                            <%--readonly : id는 수정하지 못하도록--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Password:</label>
                        <div class="col-sm-10">
                            <input type="password" name="pwd" class="form-control" id="pwd" value="${gcust.pwd}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">Name: </label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="name" value="${gcust.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="update_btn" type="button" class="btn btn-default">Update</button>&nbsp&nbsp
                            <button id="remove_btn" type="button" class="btn btn-default">Remove</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>











