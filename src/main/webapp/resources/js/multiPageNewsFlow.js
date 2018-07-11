var url;
var requestUrl;
var pageNumber;

$(document).ready(function () {
    url = $('#url').html();
    var getVal;
    getVal = window.location.search;
    var separator = "?page=";
    pageNumber = parseInt(getVal.split(separator)[1]);
    if(pageNumber!=1){
        var aImg = document.getElementById('aImg0');
        aImg.href = url + "/news/?page=" + (pageNumber-1);
        aImg.style.display='block';
    }
    getNewsFlow();
});

function formNewsFlow(data) {
    for (var i = 0; i < 5; i++) {
        var date = new Date(data[i].date);

        var li = document.createElement('li');
        li.className = "team-member";


        var div = document.createElement('div');
        div.className = "team-text";

        var aLink = document.createElement('a');
        aLink.href = url + "/news/news?id=" + data[i].id;
        var h1 = document.createElement('h1');
        var h1Text = document.createTextNode(data[i].title);
        h1.appendChild(h1Text);
        aLink.appendChild(h1);

        var spanDate = document.createElement('span');
        var spanDateText = document.createTextNode(date.toLocaleDateString());
        spanDate.appendChild(spanDateText);

        var spanAuthor = document.createElement('span');
        var spanAuthorText = document.createTextNode(" - " + data[i].author);
        spanAuthor.appendChild(spanAuthorText);

        var pArticle = document.createElement('p');
        var pText = document.createTextNode(data[i].article);
        pArticle.appendChild(pText);
        pArticle.id = 'article' + i;
        var articlElem = '#article' + i;

        div.appendChild(aLink);
        div.appendChild(spanDate);
        div.appendChild(spanAuthor);
        div.appendChild(pArticle);
        li.appendChild(div);

        $('#team').append(li);

        $(articlElem).css('font-size', '12pt');
    }
}

    function getNewsFlow() {
        requestUrl = url + "/news/pg?page=" + pageNumber;
        $.ajax({
            url: requestUrl
        }).then(function (data) {
            var jsonDataArray = data.jsonArray;
            formNewsFlow(jsonDataArray);

            if(jsonDataArray.length==5){
                var aImg = document.getElementById('aImg1');
                aImg.href = url + "/news/?page=" + (pageNumber+1);
                aImg.style.display='block';
            }
            return false;
        });
    }
