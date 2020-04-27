/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var delQuestion = function(page, id) {
    result = confirm("Are you sure to delete this question ?");
    if (result)
        window.location.replace("ManageQuiz?currentPage=" + page + "&del=" + id);
}