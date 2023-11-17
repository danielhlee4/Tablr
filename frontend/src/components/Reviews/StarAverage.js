import React from 'react';
import './StarAverage.css';

const StarAverage = ({ reviews }) => {
  const averageRating = reviews.reduce((acc, { overallRating }) => acc + overallRating, 0) / reviews.length;
  const fullStars = Math.floor(averageRating);
  const partialStarWidth = (averageRating % 1) * 100; // Percentage of the last star filled

  return (
    <div className="star-average">
        {[...Array(5)].map((_, index) => {
            if (index < fullStars) {
                return <span key={index} className="full-star">&#9733;</span>; // Full star
            } else if (index === fullStars && partialStarWidth > 0) {
                return (
                    <span key={index} className="partial-star">
                        <span className="filled-part" style={{ width: `${partialStarWidth}%` }}>&#9733;</span>
                        <span className="empty-part">&#9734;</span>
                    </span>
                ); // Partial star
            } else {
                return <span key={index} className="empty-star">&#9734;</span>; // Empty star
            }
        })}
    </div>
  );
};

export default StarAverage;
