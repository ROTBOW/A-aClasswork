document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'red';
  ctx.fillRect(50,50, 30, 10)

  ctx.beginPath();
  ctx.arc(50,200, 20, 0, 360);
  ctx.strokeStyle = 'red';
  ctx.fillStyle = 'red'
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fill()
});
