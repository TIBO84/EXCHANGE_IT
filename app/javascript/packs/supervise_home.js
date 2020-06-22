const showReviewAnswer = () => {
  const reviews = document.querySelectorAll('.exchange-review');
  const fullReviews = document.querySelectorAll('.exchange-review.full');
  // reviews.classList.remove('full');
  reviews.forEach((review) => {
    const clickReviewEvent = (e) => {
      reviews.forEach((fullReview) => {
        console.log(e.currentTarget, fullReview, e.currentTarget != fullReview)
        if (fullReview != e.currentTarget) {
          fullReview.classList.remove('full');
        }
      });
      e.currentTarget.classList.toggle('full');
    };
    review.addEventListener('click', clickReviewEvent)
  });
}

export{showReviewAnswer};
