const timerAlerts = () => {
  const alerts = document.querySelectorAll('.alert');
  // reviews.classList.remove('full');
  alerts.forEach((alert) => {
      setTimeout(() => {
        alert.remove();
      },
      2000);
  });
}

export{timerAlerts};



