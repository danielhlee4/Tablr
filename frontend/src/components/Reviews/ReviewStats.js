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
  
  return (
    <>
        <h3 className='overall-ratings-reviews'>Overall ratings and reviews</h3>
        <div className='review-stats'>
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
            <div className='review-stats-right'>

            </div>
        </div>
    </>
  );
};

export default ReviewStats;
