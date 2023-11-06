import React, { useState } from 'react';
import './StarRating.css';

const StarRating = ({ category, onChangeRating }) => {
  const [rating, setRating] = useState(0);

  const handleClick = (index) => {
    setRating(index);
    onChangeRating(category, index);
  };

  return (
    <div className="star-rating">
      <div>{category}</div>
      {[...Array(5)].map((star, index) => {
        index += 1;
        return (
          <button
            type="button"
            key={index}
            className={index <= rating ? 'on' : 'off'}
            onClick={() => handleClick(index)}
            aria-label={`Rate ${category} ${index} stars out of 5`}
          >
            <span className="star">&#9733;</span>
          </button>
        );
      })}
    </div>
  );
};

export default StarRating;
