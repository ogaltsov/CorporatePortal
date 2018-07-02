var myList = [{}];
var arr = [{}];
var url = "http://localhost:8080/corpsite.com/check";

function ajaxRequest(selector) {

    var firstName = $("#firstName").val();
    var secondName = $("#secondName").val();
    var position = $("#position").val();
    var department = $("#department").val();

    var arrOfInput =  [firstName,secondName,position, department];

    var TBody = document.getElementById("tableBody");
    TBody.innerHTML = "";

    $(document).ready(function() {
        if(isArrEmpty(arrOfInput).length>0) {
            document.getElementById('msgInput').style.display ='none';
            $.ajax({
                url: url + "?" + "firstName=" + firstName + "&secondName=" + secondName + "&position=" + position + "&department=" + department
            }).then(function (data) {
                //
                console.log(arrOfInput);
                console.log(url);
                console.log(firstName, secondName, position, department);
                console.log(data);
                //
                arr = data.jsonArray;

                console.log(arr);
                console.log(myList);
                myList = arr;
                console.log(myList);
                buildHtmlTable(selector)
            });
        }
        else {
            document.getElementById('msgInput').style.display ='block';
        }
    });
    return false;
}


// Builds the HTML Table out of myList.
function buildHtmlTable(selector) {



    var columns = addAllColumnHeaders(myList, selector);

    for (var i = 0; i < myList.length; i++) {
        var row$ = $('<tr/>');
        for (var colIndex = 0; colIndex < columns.length; colIndex++) {
            var cellValue = myList[i][columns[colIndex]];
            if (cellValue == null) cellValue = "";
            row$.append($('<td/>').html(cellValue));
        }
        $(selector).append(row$);
    }
}

// Adds a header row to the table and returns the set of columns.
// Need to do union of keys from all records as some records may not contain
// all records.
function addAllColumnHeaders(myList, selector) {
    var columnSet = [];
    var headerTr$ = $('<tr/>');

    for (var i = 0; i < myList.length; i++) {
        var rowHash = myList[i];
        for (var key in rowHash) {
            if ($.inArray(key, columnSet) == -1) {
                columnSet.push(key);
                headerTr$.append($('<th/>').html(key));
            }
        }
    }
    $(selector).append(headerTr$);

    return columnSet;
}

function isArrEmpty(array){
    return array.filter(function(line) {
        return line.length>1;
    });
}