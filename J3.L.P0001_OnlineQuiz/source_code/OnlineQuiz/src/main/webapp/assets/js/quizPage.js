/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


this.timeRemaining = 0;
this.timeDisplay = document.getElementById("timeDisplay");
this.questionPos = document.getElementById("questionPos");
this.currentQuiz = -1;
this.currentDiv = null;
this.testing = 0;
this.numOfQuiz = 0;

var nextQuestion = function () {
    currentQuiz = (currentQuiz +1) % numOfQuiz ;
    if (this.currentDiv !== null){
        this.currentDiv.classList.add("hidden");
    }
    currentDiv = document.getElementById("q" + currentQuiz);
    currentDiv.classList.remove("hidden");
    questionPos.textContent = "Question: " + (currentQuiz + 1)  + "/" + numOfQuiz;
}

var quizStart = function () {
    testing = 1;
    nextQuestion();
    setInterval(function () {
        timeRemaining--;
        updateTime();
        if (timeRemaining < 0) {
            testing = 0;
            document.getElementById("quizForm").submit();
        }
    }, 1000);
}

var updateTime = function () {
    var time = Math.floor(timeRemaining / 60);
    var sec = timeRemaining % 60;
    timeDisplay.textContent = time + ":" + sec;
}

window.onbeforeunload = function () {
    if (testing !== 0)
        return "Are you sure?";
}

var setNumOfQuiz = function (n) {
    numOfQuiz = n;
    this.timeRemaining = 20 * n;
    this.timeDisplay = document.getElementById("timeDisplay");
    this.questionPos = document.getElementById("questionPos");
    this.currentQuiz = -1;
    this.currentDiv = null;
//    this.currentDiv = document.getElementById("q" + currentQuiz);
//    currentDiv.classList.remove("hidden");
    this.testing = 0;
}

function askForSubmit(){
    if(!confirm('Do you readly want to submit?')){
        return false;
    }
}