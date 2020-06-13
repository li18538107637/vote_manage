//当前页码，默认为1
var currentPage = 1;
//后台获取数据的总页数
var totalPage = 0;
//后台获取数据的总条数
var totalCount = 0;
//每页显示的数量
var pageSize = 10;
//前端对页码进行分页的总页数
var wpageCount = 0

$(function () {
    var wcurrent = 1;
    var wsize = 5;
    getListData(currentPage);
    wpageCount = parseInt(totalPage % wsize == 0 ? totalPage / wsize : totalPage / wsize + 1);
    initPaging(wcurrent, wsize);

    $("#prePage").click(function () {
        wcurrent = wcurrent - 1;
        if (wcurrent < 1) {
            wcurrent = 1;
        }
        initPaging(wcurrent, wsize);

    });

    $("#nextPage").click(function () {
        wcurrent = wcurrent + 1;
        if (wcurrent > wpageCount) {
            wcurrent = wpageCount;
        }

        initPaging(wcurrent, wsize);

    });
    //根据当前页码请求后台获取数据
    $(document).on("click", '#Paging .pageButton', function () {
        $("tbody").html("");
        $(this).addClass("on").siblings().removeClass("on");
        currentPage = $(this).val()
        getListData(currentPage);
    });
});


//初始化分页数据
function initPaging(wcurrent, wsize) {
    $("#PagingCount").html("共" + totalCount + "条数据，共" + totalPage + "页");
    //前台页码分页开始结束下标

    var fromIndex = (wcurrent - 1) * wsize;
    var toIndex = wsize * wcurrent;

    var pagingContent = "";
    for (var i = fromIndex; i < toIndex; i++) {
        if (i > totalPage - 1) {
            break;
        }
        pagingContent = pagingContent + "<button class = 'pageButton btn' value='" + (i + 1) + "'>" + (i + 1) + "</button>";
    }
    $("#Paging").html(pagingContent);
};
//获取后台投票配置数据列表
function getListData(pageNo) {
    var requestParams = {
        pageSize: pageSize,
        pageNum: pageNo
    };
    $.ajax({
        type: "GET",
        url: "http://localhost:8080/votemgt/voteMgtConfig/getVoteList",
        data: requestParams,
        async: false,
        dataType: "json",
        success: function (data) {
            if (data.returnCode == "0") {
                totalCount = data.totalCount;
                totalPage = data.totalPage;
                var datalist = data.voteList;
                var dataStr = "";

                if (datalist == null) {
                    dataStr = "没有查询到数据";
                } else {
                    for (var i = 0; i < datalist.length; i++) {
                        dataStr = dataStr + "<tr>" +
                            "<td>" + datalist[i].id + "</td>" +
                            "<td>" + datalist[i].title + "</td>" +
                            "<td>" + datalist[i].createTime + "</td>" +
                            "<td><button class = ' btn btn-danger' value='" + datalist[i].voteId + "'>删除</button><a href='/votemgt/voteMgtPage/votePage?voteId="+ datalist[i].voteId+"'><button class = ' btn btn-primary'>编辑</button></a></td>" +
                            "</tr>";
                    }
                }
                $("tbody").html(dataStr);
            }
        },
        error: function (jqXHR) {
            alert("发生错误：" + jqXHR.status);
        }
    });
};
