const ProgressBar = require('progressbar.js')

const initProgressBars = () => {
  const progressBars = document.querySelectorAll("#progress");
  progressBars.forEach((progressBar) => {
    var bar = new ProgressBar.Circle(progressBar, {
      strokeWidth: 12,
      easing: 'easeInOut',
      duration: 1400,
      color: '#FF8458',
      trailColor: '#006FFF26',
      trailWidth: 12,
      svgStyle: null
    });
    const progressValue = parseFloat(progressBar.dataset.progress)
    bar.animate(progressValue);  // Number from 0.0 to 1.0
  });
}

export { initProgressBars };
