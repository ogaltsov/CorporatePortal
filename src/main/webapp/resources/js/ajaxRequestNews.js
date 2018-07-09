var url;
var requestUrl;
$(document).ready(function() {
        url = $('#url').html();
        requestUrl = url + "/news/getLastNewsList";
        $.ajax({
            url: requestUrl
        }).then(function (data) {
            buildLatestNewsFlow(data.jsonArray);
            return false;
        });
});

function buildLatestNewsFlow(data) {
    var titleId = "#newsTitle";
    var textId = "#newsText";
    var dateId = "#newsDate";
    for(var i = 0; i<data.length; i++) {
        var titleIdMod = titleId;
        titleIdMod += i;

        var newsLink = url+"/news/news?id="+data[i].id;
        $(titleIdMod).append("<a href=\""+ newsLink +"\"><h2>" + data[i].title + "</h2></a>");

        var textIdMod = textId;
        textIdMod += i;
        $(textIdMod).append(data[i].article);

        var dateIdMod = dateId;
        dateIdMod =+ i;
        $(dateIdMod).append(data[i].date);
    }
}