import React from 'react';
import './ReviewStats.css';
import StarAverage from './StarAverage';

const ReviewStats = ({ reviews }) => {
  const calculateAverage = (property) => {
    const sum = reviews.reduce((acc, review) => acc + review[property], 0);
    return (sum / reviews.length).toFixed(1);
  };

  const foodAverage = calculateAverage('foodRating');
  const serviceAverage = calculateAverage('serviceRating');
  const ambianceAverage = calculateAverage('ambianceRating');
  const valueAverage = calculateAverage('valueRating');
  const overallAverage = calculateAverage('overallRating');

  const countRatings = (reviews) => {
    const counts = { 5: 0, 4: 0, 3: 0, 2: 0, 1: 0 };
    reviews.forEach(review => {
      counts[review.overallRating]++;
    });
    return counts;
  };

  const ratingsCount = countRatings(reviews);
  const totalReviews = reviews.length;

  function calculateBarWidth(count, totalReviews) {
    const minWidth = 5; 
    const widthPercentage = Math.max((count / totalReviews) * 100, minWidth);
    return widthPercentage;
  }
  
  return (
    <>
        <h3 className='overall-ratings-reviews'>Overall ratings and reviews</h3>
        <div className='review-stats-container'>
            <div className="review-stats-left">
                <p>Reviews can only be made by diners who have eaten at this restaurant</p>
                <div className='review-stats-overall'>
                    <StarAverage reviews={reviews} />
                    <span className='review-stats-overall-text'>{overallAverage} based on all time ratings</span>
                </div>
                <div className="average-ratings">
                <div className="average-rating">
                    <span className="rating-value">{foodAverage}</span>
                    <span className="rating-category">Food</span>
                </div>
                <div className="divider"></div>
                <div className="average-rating">
                    <span className="rating-value">{serviceAverage}</span>
                    <span className="rating-category">Service</span>
                </div>
                <div className="divider"></div>
                <div className="average-rating">
                    <span className="rating-value">{ambianceAverage}</span>
                    <span className="rating-category">Ambiance</span>
                </div>
                <div className="divider"></div>
                <div className="average-rating">
                    <span className="rating-value">{valueAverage}</span>
                    <span className="rating-category">Value</span>
                </div>
                </div>
            </div>
            <div className="review-stats-right">
                {[5, 4, 3, 2, 1].map(star => {
                    const count = ratingsCount[star];
                    return (
                        <div key={star} className="rating-distribution">
                            <span className="star-label">{star}</span>
                            <div className="bar-background">
                            <div
                                className="rating-bar"
                                style={{ width: `${calculateBarWidth(count, totalReviews)}%` }}
                            ></div>
                            </div>
                        </div>
                    );
                })}
            </div>
        </div>
    </>
  );
};

export default ReviewStats;