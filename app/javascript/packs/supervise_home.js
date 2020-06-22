const showReviewAnswer = () => {
  const reviews = document.querySelectorAll('.exchange-review__overview');
  const fullReviews = document.querySelectorAll('.exchange-review');
  // reviews.classList.remove('full');
  reviews.forEach((review) => {
    const clickReviewEvent = (e) => {
      reviews.forEach((review) => {
        if (review != e.currentTarget) {
          review.parentNode.classList.remove('full');
        }
      });
      e.currentTarget.parentNode.classList.toggle('full');
    };
    review.addEventListener('click', clickReviewEvent)
  });
}

export{showReviewAnswer};
