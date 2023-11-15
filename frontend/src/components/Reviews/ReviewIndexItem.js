import React from 'react';
import './ReviewIndexItem.css';

const ReviewIndexItem = ({ review }) => {
  const formatDate = (dateString) => {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
  };

  const renderStars = (rating) => {
    return [...Array(5)].map((_, index) => (
      <span key={index} className={`star ${index < rating ? 'filled' : 'empty'}`}>&#9733;</span>
    ));
  };

  return (
    <div className="review-index-item">
      <div className="review-user">
        {review.reservation.user.firstName} {review.reservation.user.lastName[0]}.
      </div>
      <div className="review-ratings">
        {renderStars(review.overallRating)}
        <span className="review-date"> - Dined on {formatDate(review.reservation.date)}</span>
      </div>
      <div className="review-details">
        <div>Overall {review.overallRating}</div>
        <div>Food {review.foodRating}</div>
        <div>Service {review.serviceRating}</div>
        <div>Ambiance {review.ambianceRating}</div>
        <div>Value {review.valueRating}</div>
      </div>
      <div className="review-body">
        {review.body}
      </div>
      <hr className="review-divider" />
    </div>
  );
};

export default ReviewIndexItem;
