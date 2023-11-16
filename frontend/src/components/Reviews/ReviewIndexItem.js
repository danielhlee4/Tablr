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
        <span className="review-date">Dined on {formatDate(review.reservation.date)}</span>
      </div>
      <div className="review-details">
        <span className="detail-label">Overall</span><span className="detail-rating">{review.overallRating}</span> •
        <span className="detail-label">Food</span><span className="detail-rating">{review.foodRating}</span> •
        <span className="detail-label">Service</span><span className="detail-rating">{review.serviceRating}</span> •
        <span className="detail-label">Ambiance</span><span className="detail-rating">{review.ambianceRating}</span> •
        <span className="detail-label">Value</span><span className="detail-rating">{review.valueRating}</span>
      </div>
      <div className="review-body">
        {review.body}
      </div>
    </div>
  );
};

export default ReviewIndexItem;
