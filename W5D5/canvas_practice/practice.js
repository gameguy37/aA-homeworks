document.addEventListener("DOMContentLoaded", function(){
    
    const canvasEle = document.getElementById("mycanvas");
    canvasEle.width = 500;
    canvasEle.height = 500;

    const ctx = canvasEle.getContext("2d");
    ctx.fillStyle = "red";
    ctx.fillRect(0, 0, 500, 500);

    ctx.beginPath();
    ctx.arc(250, 250, 50, 0, 2 * Math.PI);
    ctx.strokeStyle = "blue";
    ctx.lineWidth = 3;
    ctx.stroke();
    ctx.fillStyle = "yellow";
    ctx.fill();

});
