$(function () {
    optionSort();
    questionSort();

    getVoteContent();

    $("#question_type").change(function () {
        var question_type_value = $(this).val();
        if (question_type_value == 3) {
            $("#vote_question_options").html("问题类型为输入类型");
            $("#addOption").hide();
        } else {
            $("#vote_question_options").html("<label>输入投票问题选项</label><ul id='vote_option_ul'><li class='vote_options_group' id='vote_options_1' index='1'><input type='text' placeholder='请输入投票问题选项内容'><button class='btn btn-success optionPic' type='button'>上传图片</button><input class='upload_option_img' name='file' accept='image/*' type='file' style='display: none'/><button class='btn btn-danger del_option' type='button'>删除</button> </li></ul>");
            $("#addOption").show();
            optionSort();
        }
    });


    $("#addvotesrc").click(function () {
        $("iframe").attr("src", "/votemgt/voteMgtPage/votePage");
    })
    // $("#myform").serializeArray();
    // $("#myform").serialize();

    $("#addOption").click(function () {

        var indexArray = new Array();
        $(".vote_options_group").each(function (index, item) {
            var indexs = $(this).attr("index");    //获取index序号值
            indexArray.push(indexs);
        });
        indexArray.sort();
        var newIndex = Number(indexArray[indexArray.length - 1]) + 1;
        $("#vote_option_ul").append("<li class='vote_options_group' id='vote_options_" + newIndex + "' index='" + newIndex + "'><input type='text' placeholder='请输入投票问题选项内容'><button class='btn btn-success optionPic' type='button'>上传图片</button><input class='upload_option_img' name='file' accept='image/*' type='file' style='display: none'/><button class='btn btn-danger del_option' type='button'>删除</button></li>");
    });


    //图片上传
    $("body").on("click", ".optionPic", function () {
        $(this).next().click(); //隐藏了input:file样式后，点击头像就可以本地上传
    });

    $("#csvUpload").click(function () {
        var formData = new FormData();
        var option_csv = $(this).next()[0].files[0];
        formData.append("file", option_csv);

        $.ajax({
            "url": "http://localhost:8080/votemgt/voteMgtConfig/parsingCsv",
            "type": "post",
            "data": formData,
            "processData": false,
            "contentType": false,
            "dataType": "json",
            "success": function (data) {
                if (data.returnCode == 0) {
                    var questionList = data.questionList;
                    for (var i = 0; i < questionList.length; i++) {
                        $("#vote_question_ul").append("<li id='" + questionList[i].question_id + "' class='question_li'>" + questionList[i].question_title +
                            "<button type='button' class='btn btn-primary update_question' data-toggle='modal' data-target='#myModal'>修改</button><button class='btn btn-danger del_question' type='button'>删除</button> </li>");
                    }
                } else {
                    alert(data.returnMsg);
                }
            },
            "error": function (obj) {
                console.log(obj)
            }
        });

    })


    $("body").on("change", ".upload_option_img", function () {
        var img_name = $(this)[0].files[0].name;
        $(this).prev().text(img_name);
    });

    //删除问题选项
    $("body").on("click", ".del_option", function () {
        $(this).parent().remove();
    });


    //点击添加投票问题时，重置表单内容
    $("#add_vote_question").click(function () {
        $("#vote_question").attr("question_id", "");
        $("#vote_question").val("");
        $("#question_type").val("1");
        $("#vote_question_options").html("<label>输入投票问题选项</label><ul id='vote_option_ul'><li class='vote_options_group' id='vote_options_1' index='1'><input type='text' placeholder='请输入投票问题选项内容'><button class='btn btn-success optionPic' type='button'>上传图片</button><input class='upload_option_img' name='file' accept='image/*' type='file' style='display: none'/><button class='btn btn-danger del_option' type='button'>删除</button> </li></ul>");
        $("#addOption").show();
        optionSort();
    })
    //删除问题
    $("body").on("click", ".del_question", function () {
        //删除标签
        $(this).parent().remove();
        //删除REDIS缓存存入的问题配置数据
        var question_id = $(this).parent().attr("id");
        var params = {
            "questionId": question_id,
        };
        $.ajax({
            "url": "http://localhost:8080/votemgt/voteMgtConfig/delQuestionConfig",
            "type": "post",
            "data": params,
            "dataType": "json",
            "success": function (data) {
                if (data.returnCode == 0) {

                } else {
                    alert(data.returnMsg);
                }
            },
            "error": function (obj) {
                console.log(obj)
            }
        });

    });

    //修改问题选项
    $("body").on("click", ".update_question", function () {
        var update_question_id = $(this).parent().attr("id");
        var params = {
            "questionId": update_question_id
        }
        $.ajax({
            "url": "http://localhost:8080/votemgt/voteMgtConfig/getQuestionConfig",
            "type": "get",
            "data": params,
            "dataType": "json",
            "success": function (data) {
                if (data.returnCode == 0) {
                    $("#vote_question").val(data.questionConfigMap.question_title);
                    $("#question_type").val(data.questionConfigMap.question_type);

                    var optionList = data.questionConfigMap.optionList;
                    var optionshtml = "";
                    for (var i = 0; i < optionList.length; i++) {
                        var img = optionList[i].img;
                        var option_content = optionList[i].option_content;
                        var option_id = optionList[i].option_id;
                        var option_index = optionList[i].option_index;
                        optionshtml = optionshtml + "<li class='vote_options_group' id='" + option_id + "' index='" + option_index + "'><input type='text' placeholder='请输入投票问题选项内容' value='" + option_content + "' class='vote_options_content'><button class='btn btn-success optionPic' type='button'>上传图片</button><input class='upload_option_img' imgUrl='" + img + "' name='file' accept='image/*' type='file' style='display: none'/><button class='btn btn-danger del_option' type='button'>删除</button> </li>";

                    }
                    $("#vote_option_ul").html(optionshtml);
                    $("#vote_question").attr("question_id", update_question_id);

                } else {
                    alert(data.returnMsg);
                }
            },
            "error": function (obj) {
                console.log(obj)
            }
        });

    });


    //保存问题内容，后台redis中
    $("#saveQuestion").click(function () {
        var formData = new FormData();
        var update_question_id = $("#vote_question").attr("question_id");
        var question_title = $("#vote_question").val();
        var question_type = $("#question_type").val();
        var optionsArray = new Array();
        $("#vote_option_ul li").each(function (index, item) {
            var option_content = $(this).children().eq(0).val();
            var option_img = $(this).children().eq(2)[0].files[0];
            var option_img_url = $(this).children().eq(2).attr("imgUrl");
            var option_index = $(this).attr("index");
            var option_id = $(this).attr("id");
            formData.append(option_id, option_img);
            var m = {
                "option_content": option_content,
                "option_index": option_index,
                "option_id": option_id,
                "option_img_url": option_img_url,
            };
            optionsArray.push(m);
        });
        formData.append("question_title", question_title);
        formData.append("question_id", update_question_id);
        formData.append("question_type", question_type);
        formData.append("optionsArray", JSON.stringify(optionsArray));

        $.ajax({
            "url": "http://localhost:8080/votemgt/voteMgtConfig/addQuestionConfig",
            "type": "post",
            "data": formData,
            "processData": false,
            "contentType": false,
            "dataType": "json",
            "success": function (data) {
                if (data.returnCode == 0) {
                    var questionIsExists = $("#" + update_question_id + "");
                    if (questionIsExists.length > 0) {
                        questionIsExists.html("<li id='" + data.question_id + "' class='question_li'>" + data.question_title +
                            "<button type='button' class='btn btn-primary update_question' data-toggle='modal' data-target='#myModal'>修改</button><button class='btn btn-danger del_question' type='button'>删除</button> </li>");
                    }else{
                        $("#vote_question_ul").append("<li id='" + data.question_id + "' class='question_li'>" + data.question_title +
                            "<button type='button' class='btn btn-primary update_question' data-toggle='modal' data-target='#myModal'>修改</button><button class='btn btn-danger del_question' type='button'>删除</button> </li>");
                    }
                } else {
                    alert(data.returnMsg);
                }
            },
            "error": function (obj) {
                console.log(obj)
            }
        });

    });

    //提交投票配置到后台
    $("#submit_vote").click(function () {
        var voteTitle = $("#vote_title").val();
        var voteStartTime = $("#vote_start_time").val();
        var voteEndTime = $("#vote_end_time").val();
        var isShowCount = $("input[name='isNeedCount']:checked").val();
        var questionList = new Array();

        $("#vote_question_ul li").each(function (index, item) {
            var question_id = $(this).attr("id");
            questionList.push(question_id);
        });

        var voteParams = {
            "voteTitle": voteTitle,
            "voteStartTime": voteStartTime,
            "voteEndTime": voteEndTime,
            "isShowCount": isShowCount,
            "questionList": questionList,
        }

        $.ajax({
            "url": "http://localhost:8080/votemgt/voteMgtConfig/saveVoteConfig",
            "type": "post",
            "data": JSON.stringify(voteParams),
            "contentType": "application/json",
            "dataType": "json",
            "success": function (obj) {
                if (obj.returnCode == 0) {
                    //跳转到投票列表页面
                    alert("提交成功");
                    window.location.reload();
                } else {
                    alert(obj.returnMsg);
                }
            },
            "error": function (obj) {
                console.log(obj)
            }
        });

    })


});

//修改投票配置时，初始化页面信息
function getVoteContent(){
    var voteId = $("#vote_id").val();

    if (voteId != "undefined" || voteId != "") {
        var params = {
            "voteId":voteId
        }
        $.ajax({
            "url": "/votemgt/voteMgtConfig/getVoteConfig",
            "type": "get",
            "data": params,
            "dataType": "json",
            "success": function (data) {
                if (data.returnCode == 0) {
                    var voteId = data.voteId;
                    var title = data.title;
                    var startTime = data.startTime;
                    var endTime = data.endTime;
                    var needCount = data.needCount;
                    var questionList = data.questionList;
                    $("#vote_title").val(title);
                    $("#vote_start_time").val(startTime);
                    $("#vote_end_time").val(endTime);
                    $("#vote_end_time").val(endTime);
                    $("input[name='isNeedCount']:checked").val(needCount);
                    for (var i=0;i<questionList.length;i++){
                        var questionId = questionList[i].questionId;
                        var questionTitle = questionList[i].questionTitle;
                        $("#vote_question_ul").append("<li id='" + questionId + "' class='question_li'>" + questionTitle +
                            "<button type='button' class='btn btn-primary update_question' data-toggle='modal' data-target='#myModal'>修改</button><button class='btn btn-danger del_question' type='button'>删除</button> </li>");
                    }
                } else {
                    alert(data.returnMsg);
                }
            },
            "error": function (obj) {
                console.log(obj)
            }
        })
    }
}


//问题选项拖动排序
function optionSort() {
    var questionOptions = document.getElementById("vote_option_ul");
    new Sortable(questionOptions, {
        animation: 150,
    });
}

//投票问题拖动排序
function questionSort() {
    var questionOptions = document.getElementById("vote_question_ul");
    new Sortable(questionOptions, {
        animation: 150,
    });
}