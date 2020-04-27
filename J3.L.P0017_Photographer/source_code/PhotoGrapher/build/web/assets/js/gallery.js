function updateImage(src) {
    const imageSlide = document.querySelector("#imageShow");
    imageSlide.src = src;
}

let runningSlide = false;

function initEvent() {
    const playButton = document.querySelector("#playButton");
    playButton.addEventListener('click', e => {
        if (!runningSlide) {
            playButton.src = "assets/images/frontend/icon_pause.png";
            const images = document.querySelectorAll(".imageThumb");
            loadImageInfinity(images);
            runningSlide = true;

        } else {
            clearInterval(itv);
            playButton.src = "assets/images/frontend/icon_play.png";
            runningSlide = false;
        }
    });
}
let itv = null;
let currIndex = 0;
function loadImageInfinity(images) {
    itv = setInterval(e => {
        if (currIndex === images.length) {
            currIndex = 0;
        }
        const image = images[currIndex++];
        updateImage(image.src);
    }, 800);
}

initEvent();